appPath = "#{process.cwd()}/app"
PostJoin = require "#{appPath}/models/post_join"

module.exports.create = (req, res) ->
  PostJoin.create req.body, (err, postJoin) ->
    return res.json(422, err) if err
    res.json(postJoin, 200)
