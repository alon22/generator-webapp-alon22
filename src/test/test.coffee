path    = require 'path'
assert  = require 'assert'
helpers = require('yeoman-generator').test

describe "generator webapp-alon22", ->
  before ->
    @app = helpers
      .run require.resolve '../app'
      .withGenerators [
         [helpers.createDummyGenerator(), 'webapp-alon22:app']
      ]
      .withOptions
        'skip-install' : true
      .withPrompts
        projectName : 'testGenerator'
      return
    return

  describe 'default settings', ->
    before (done) ->
      @app.on 'end', done

    it 'creates expected files', ->
      expected = [
        'src/jade/index.jade'
        'src/stylus/app.styl'
        'src/coffee/app.coffee'
        'bower.json'
        '.gitignore'
        'package.json'
        'gruntfile.coffee'
      ]
      assert.file expected
      return
