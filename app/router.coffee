appPath = "#{process.cwd()}/app"

module.exports = (app) ->

  homeController = require("#{appPath}/controllers/home_controller")
  app.get '/', homeController.index
