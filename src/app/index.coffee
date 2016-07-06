yeoman = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'

class WebappAlon22Generator extends yeoman.generators.Base

  constructor: ->
    super

  initializing: () ->
    @pkg = require '../package.json'

  prompting: () ->
    done = @async()

    @log yosay(
      "Welcome to the exquisite #{chalk.red('WebappAlon22')} generator!")

    prompts = [{
      type: 'input'
      name: 'projectName'
      message: 'What is the name of your project?'
      default: @appname
    }]

    @prompt prompts, ((props) ->
      @folderName = props.projectName
      done()
    ).bind @

  configuring:
    folderName: ->
      @destinationRoot @folderName

  writing :
    projectfiles: () ->
      @copy '_bower.json', 'bower.json'
      @copy '_bowerrc', '.bowerrc'
      @copy '_package.json', 'package.json'
      @copy '_gruntfile.coffee', 'gruntfile.coffee'

    gitfiles: ->
      @copy '_gitignore', '.gitignore'

    app: ->
      @directory 'src/', 'src/'

  install: ->
    @installDependencies
      skipInstall: @options['skip-install']
      bower: false

module.exports = WebappAlon22Generator
