async = require "async"
db = require "#{process.cwd()}/db/mongo"
mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"
Post = require "#{process.cwd()}/app/models/post"

CommentSchema = new db.Schema
  name: type: String
  content: type: String

Comment =  db.mongoose.model('Comment', CommentSchema)

module.exports.create = (postId, comment, cb) ->
  async.parallel
    comment: (callback) ->
      comment.created_at = new Date
      Comment(comment).save (err, comment) ->
        callback(err, comment)
    post: (callback) ->
      Post.show postId, (post, err) ->
        callback(err, post)
    (err, response) ->
      console.log '----------------', response

module.exports.index = (postId, cb) ->
  Post.show postId, (post, err) ->
    return cb(null, err) if err
    cb(post.comments, null)
