ejs = require 'ejs'
fs = require 'fs'
db = require "#{process.cwd()}/db/mongo"
validator = require("mongoose-validator").validate

mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"
postSuccessHtmlEmail = fs.readFileSync("#{process.cwd()}/app/views/emails/post_success_html.ejs", "utf8")

emailValidator = [validator(message: 'klaidingas El. pašto adresas', 'isEmail')]
bodyValidator = [validator(message: 'šį langelį būtina užpildyti', 'len', 2, 300)]
mobileValidator = (v) ->
  if v && v == ''
    return true
  else if v && /^(\+[\d]{1,3}|0)?[7-9]\d{9}$/.test(v)
    return true
  else
    return false

PostSchema = new db.Schema
  email: type: String, required: false, validate: emailValidator
  mobile: type: String, validate: [mobileValidator, 'klaidingas mobilus numeris']
  city: type: String, required: true
  body: type: String, required: true, validate: bodyValidator
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
    return cb(err, null) if err
    cb(null, post)
