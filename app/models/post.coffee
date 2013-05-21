db = require "#{process.cwd()}/db/mongo"

titleLengthValidator = (v) ->
  return true unless v?.length > 100

emailLengthValidator = (v) ->
  return true unless v?.length > 50

mobileLengthValidator = (v) ->
  return true unless v?.length > 8

bodyLengthValidator = (v) ->
  return true unless v?.length > 300


PostSchema = new db.Schema
  title: type: String, required: true, validate: [titleLengthValidator, 'per ilgas pavadinimas']
  email: type: String, required: true, validate: [emailLengthValidator, 'per ilgas adresas']
  mobile: type: String, required: false, validate: [mobileLengthValidator, 'per ilgas mob. numeris']
  body: type: String, required: false, validate: [bodyLengthValidator, 'per ilgas pranešimas']
  created_at: type: Date
  updated_at: type: Date, default: Date.now

Post = db.mongoose.model('Post', PostSchema)

module.exports.create = (post, cb) ->
  post.created_at = new Date
  Post(post).save (err, post) ->
    return cb(null, err) if err
    cb(post, null)
    #  db.disconnect()

module.exports.index = (search, cb) ->
  Post.find {}, (err, posts) ->
    return cb(null, err) if err
    cb(posts, null)
    #    db.disconnect()
