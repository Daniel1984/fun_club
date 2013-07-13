ejs = require 'ejs'
fs = require 'fs'
mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"
Post = require "#{process.cwd()}/app/models/post"

smsContent = fs.readFileSync("#{process.cwd()}/app/views/sms/post_join.ejs", "utf8")
emailContent = fs.readFileSync("#{process.cwd()}/app/views/emails/post_contact_success.ejs", "utf8")

module.exports.create = (reqBody, cb) ->
  postId = reqBody.post_id
  console.log reqBody
  Post.show postId, (err, post) ->
    return cb(err, null) if err
    cb(null, {})
    if post.mobile
      sms.sendSms(post.mobile, ejs.render(smsContent, {join: reqBody}))
    if post.email
      mailer.sendMail
        to: post.email
        subject: "Fun Club!"
        html: ejs.render(emailContent, { join: reqBody })


