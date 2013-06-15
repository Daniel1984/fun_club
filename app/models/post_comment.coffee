async = require "async"
db = require "#{process.cwd()}/db/mongo"
mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"
Post = require "#{process.cwd()}/app/models/post"

CommentSchema = new db.Schema
  author_name: type: String, default: 'anonimas'
  author_comment: type: String
  like: type: Number, default: 0
  dislike: type: Number, default: 0
  created_at: type: Date
  updated_at: type: Date, default: Date.now

Comment =  db.mongoose.model('Comment', CommentSchema)

module.exports.create = (reqBody, cb) ->
  postId = reqBody.post_id
  delete reqBody.post_id
  comment = reqBody
  async.parallel
    comment: (callback) ->
      comment.created_at = new Date
      Comment(comment).save (err, comment) ->
        callback(err, comment)
    post: (callback) ->
      Post.show postId, (err, post) ->
        callback(err, post)
    (err, response) ->
      cb(null, err) if err
      post = response.post
      post.comments.push(response.comment._id)
      post.save()
      cb(response.comment, null)

module.exports.index = (postId, cb) ->
  async.waterfall [
    (callback) ->
      Post.show postId, (err, post) ->
        callback(err, post)
    ,
    (post, callback) ->
      callback(null, []) if post.comments.length == 0
      comments = []
      for id in post.comments
        Comment.findById id, (err, comment) ->
          comments.push(comment)
          if comments.length == post.comments.length
            callback(err, comments)
    ], (err, result) ->
      cb(err, result)
