ejs = require 'ejs'
fs = require 'fs'
db = require "#{process.cwd()}/db/mongo"
mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"

postSuccessHtmlEmail = fs.readFileSync("#{process.cwd()}/app/views/emails/post_success_html.ejs", "utf8")

titleLengthValidator = (v) ->
  return true unless v?.length > 100
emailLengthValidator = (v) ->
  return true unless v?.length > 50
mobileLengthValidator = (v) ->
  return true unless v?.length > 12
bodyLengthValidator = (v) ->
  return true unless v?.length > 300

PostSchema = new db.Schema
  title: type: String, required: true, validate: [titleLengthValidator, 'per ilgas pavadinimas']
  email: type: String, required: false, validate: [emailLengthValidator, 'per ilgas adresas']
  mobile: type: String, required: false, validate: [mobileLengthValidator, 'per ilgas mob. numeris']
  city: type: String, required: true
  body: type: String, required: false, validate: [bodyLengthValidator, 'per ilgas pranešimas']
  post_image: String
  comments: [type: db.Schema.Types.ObjectId, ref: 'CommentSchema']
  created_at: type: Date
  updated_at: type: Date, default: Date.now

Post = db.mongoose.model('Post', PostSchema)

module.exports.create = (post, cb) ->
  post.created_at = new Date
  Post(post).save (err, post) ->
    return cb(null, err) if err
    cb(post, null)
    if post.email
      mailer.sendMail
        to: post.email
        subject: 'Laikas linksmybėms!'
        html: ejs.render(postSuccessHtmlEmail, {post: post})
    if post.mobile
      sms.sendSms(post.mobile, 'FUN CLUB DEKOJA UZ SKELBIMA. TIKIMES JOG RASITE TAI KO IESKOJOTE.')

module.exports.index = (search, cb) ->
  Post
    .where('city').in(if search.city then [search.city] else [1..64])
    .exec (err, posts) ->
      cb(posts, null)

module.exports.show = (id, cb) ->
  Post.findById id, (err, post) ->
    return cb(null, err) if err
    cb(post, null)
