appPath = "#{process.cwd()}/app"
Post = require "#{appPath}/models/post"

module.exports.index = (req, res) ->
  Post.index req.query, (posts, err) ->
    return res.json({}, 422) if err
    res.json(posts, 200)

module.exports.create = (req, res) ->
  Post.create req.body, (post, err) ->
    return res.json(422, err) if err
    res.json(post, 200)
