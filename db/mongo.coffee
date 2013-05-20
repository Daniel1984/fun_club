config = require 'config'
mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports.mongoose = mongoose
module.exports.Schema = Schema

username = config.database.user
password = config.database.pass
address = config.database.address
url = "mongodb://#{username}:#{password}#{address}"

connect = () ->
  mongoose.connect(url)

module.exports.disconnect = () ->
  mongoose.disconnect()

connect()
