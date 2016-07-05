module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    meta:
      dest   : "app"
      static : "app/static"
      banner : """
      /*
        <%=pkg.name%> v<%=pkg.version%> - <%=grunt.template.today("d/m/yyyy")%>

        Author: <%= pkg.author.name %> - <%= pkg.author.email %>
      */

      """

    src:
      coffee : [
        "src/coffee/*.coffee"
        "src/coffee/*/*.coffee"]
      stylus : [
        "src/stylus/app.*.styl"]
      jade   : [
        "src/jade/index.jade"]
      jade_files : [
        "src/jade/*.jade"
        "src/jade/*/*.jade"]

    jade :
      primary:
        options:
          pretty: true
        files:
          "<%= meta.dest %>/index.html" : "<%= src.jade %>"
      secondary:
        options:
          pretty: true
        files:[
          expand: true
          cwd: "src/jade/"
          src: "*/*.jade"
          dest: "<%= meta.static %>/html"
          ext: ".html"]

    stylus:
      compile:
        options:
          compress: false
        files:
          "<%= meta.static %>/css/<%= pkg.name %>.css" : "<%= src.stylus %>"

    concat:
      build:
        files:
          ".tmp/tmp.coffee" : "<%= src.coffee %>"

    coffee:
      compile:
        files:
          "<%= meta.static %>/js/<%= pkg.name %>.debug.js" : ".tmp/tmp.coffee"

    uglify:
      options:
        banner: "<%= meta.banner %>"
      compile:
        files:
          "<%= meta.static %>/js/<%= pkg.name %>.js" : [
                              "<%= meta.static %>/js/<%= pkg.name %>.debug.js"]
    watch:
      main:
        files:["grunfile.coffee"]
        tasks:["default"]
      coffee:
        files:["<%= src.coffee %>"]
        tasks:["concat","coffee","uglify"]
      stylus:
        files:["<%= src.stylus %>"]
        tasks:["stylus"]
      jade:
        files:["<%= src.jade %>","<%= src.jade_files %>"]
        tasks:["jade"]

  grunt.registerTask 'default',["jade","stylus","concat","coffee","uglify"]
