appPath = "#{process.cwd()}/app"
Post = require "#{appPath}/models/post"

module.exports.index = (req, res, next) ->
  Post.index {}, (posts, err) ->
    return res.json({}, 422) if err
    res.json(posts, 200)

module.exports.create = (req, res, next) ->
  Post.create req.body, (post, err) ->
    return res.json(422, err) if err
    res.json(post, 200)
