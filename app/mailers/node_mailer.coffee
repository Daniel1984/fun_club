nodeMailer = require 'nodemailer'
config = require 'config'
_ = require 'underscore'

smtpTransportr = nodeMailer.createTransport("SMTP",
  service: config.email.service
  auth:
    user: config.email.user
    pass: config.email.pass
)

mailOptions = 
  from: "linksmiVakarai@gmail.com"

module.exports.sendMail = (options) ->
  _.extend(mailOptions, options)
  console.log 'mail options -->>>', mailOptions
  smtpTransportr.sendMail(mailOptions, (err, res) ->
    console.log "error --->>>", err if err
    console.log "response --->>>>", res if res
  )
