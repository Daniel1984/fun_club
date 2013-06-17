ejs = require 'ejs'
fs = require 'fs'
async = require "async"
mailer = require "#{process.cwd()}/app/mailers/node_mailer"
sms = require "#{process.cwd()}/app/services/sms"
Post = require "#{process.cwd()}/app/models/post"

smsContent = fs.readFileSync("#{process.cwd()}/app/views/sms/post_join.ejs", "utf8")

module.exports.create = (reqBody, cb) ->
  postId = reqBody.post_id
  async.parallel
    post: (callback) ->
      Post.show postId, (err, post) ->
        callback(err, post)
    (err, response) ->
      return cb(null, err) if err
      if reqBody.mobile
        # sms.sendSms(response.post.mobile, "JUS LIKOTE PASTEBETI FUNTIMES.LT PUSLAPYJE! SUSIDOMEJUSIO ASMENS NUMERIS: #{reqBody.mobile}. ZINUTE: #{reqBody.content}")
        sms.sendSms(response.post.mobile, ejs.render(smsContent, {join: reqBody}))
