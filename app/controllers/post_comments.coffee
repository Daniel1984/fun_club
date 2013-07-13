appPath = "#{process.cwd()}/app"
PostComment = require "#{appPath}/models/post_comment"

module.exports.index = (req, res) ->
  PostComment.index req.query.post_id, (err, comments) ->
    return res.json({}, 422) if err
    res.json(comments, 200)

module.exports.create = (req, res) ->
  PostComment.create req.body, (comment, err) ->
    return res.json(422, err) if err
    res.json(comment, 200)

module.exports.update = (req, res) ->
  PostComment.update req.body, (comment, err) ->
    return res.json(422, err) if err
    res.json(comment, 200)
