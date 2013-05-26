config = require 'config'
client = require('twilio')(config.sms.sid, config.sms.token)

module.exports.sendSms = (to, msg) ->
  client.sendSms(
    to: to
    from: config.sms.phonenumber
    body: msg
  )
