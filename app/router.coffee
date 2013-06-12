appPath = "#{process.cwd()}/app"

module.exports = (app) ->

  homeController = require("#{appPath}/controllers/home_controller")
  app.get '/', homeController.index
  
  postController = require("#{appPath}/controllers/posts")
  app.get '/posts', postController.index
  app.post '/posts', postController.create

  postCommentsController = require("#{appPath}/controllers/post_comments")
  app.get '/post_comments', postCommentsController.index
  app.post '/post_comments', postCommentsController.create
