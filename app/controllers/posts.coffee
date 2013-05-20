appPath = "#{process.cwd()}/app"
Post = require "#{appPath}/models/post"

module.exports.create = (req, res, next) ->
  Post.create req.body, (post, err) ->
    return res.json(422, err) if err
    res.json(post, 200)
