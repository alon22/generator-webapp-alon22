(function() {
  var WebappAlon22Generator, chalk, yeoman, yosay,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  yeoman = require('yeoman-generator');

  chalk = require('chalk');

  yosay = require('yosay');

  WebappAlon22Generator = (function(superClass) {
    extend(WebappAlon22Generator, superClass);

    function WebappAlon22Generator() {
      WebappAlon22Generator.__super__.constructor.apply(this, arguments);
    }

    WebappAlon22Generator.prototype.initializing = function() {
      return this.pkg = require('../package.json');
    };

    WebappAlon22Generator.prototype.prompting = function() {
      var done, prompts;
      done = this.async();
      this.log(yosay("Welcome to the exquisite " + (chalk.red('WebappAlon22')) + " generator!"));
      prompts = [
        {
          type: 'input',
          name: 'projectName',
          message: 'What is the name of your project?',
          "default": this.appname
        }
      ];
      return this.prompt(prompts, (function(props) {
        this.folderName = props.projectName;
        return done();
      }).bind(this));
    };

    WebappAlon22Generator.prototype.configuring = {
      folderName: function() {
        return this.destinationRoot(this.folderName);
      }
    };

    WebappAlon22Generator.prototype.writing = {
      projectfiles: function() {
        this.copy('_bower.json', 'bower.json');
        this.copy('_bowerrc', '.bowerrc');
        this.copy('_package.json', 'package.json');
        return this.copy('_gruntfile.coffee', 'gruntfile.coffee');
      },
      gitfiles: function() {
        return this.copy('_gitignore', '.gitignore');
      },
      app: function() {
        return this.directory('src/', 'src/');
      }
    };

    WebappAlon22Generator.prototype.install = function() {
      return this.installDependencies({
        skipInstall: this.options['skip-install'],
        bower: false
      });
    };

    return WebappAlon22Generator;

  })(yeoman.generators.Base);

  module.exports = WebappAlon22Generator;

}).call(this);
