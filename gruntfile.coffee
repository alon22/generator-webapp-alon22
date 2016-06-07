module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    meta:
      dest   : "app"
      static : "app/static"

    src:
      app : [
        "src/app/*.coffee"]
      test : [
        "src/test/*.coffee"]

    concat:
      build:
        files:
          ".tmp/index.coffee" : "<%= src.app %>"
          ".tmp/test.coffee" : "<%= src.test %>"

    coffee:
      compile:
        files:
          "app/index.js" : ".tmp/index.coffee"
          "test/test.js" : ".tmp/test.coffee"

    watch:
      main:
        files:["grunfile.coffee"]
        tasks:["default"]
      coffee:
        files:["<%= src.coffee %>"]
        tasks:["concat","coffee","uglify"]

  grunt.registerTask 'default',["concat","coffee"]
