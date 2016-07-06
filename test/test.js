(function() {
  var assert, helpers, path;

  path = require('path');

  assert = require('assert');

  helpers = require('yeoman-generator').test;

  describe("generator webapp-alon22", function() {
    before(function() {
      this.app = helpers.run(require.resolve('../app')).withGenerators([[helpers.createDummyGenerator(), 'webapp-alon22:app']]).withOptions({
        'skip-install': true
      }).withPrompts({
        projectName: 'testGenerator'
      });
      return;
    });
    return describe('default settings', function() {
      before(function(done) {
        return this.app.on('end', done);
      });
      return it('creates expected files', function() {
        var expected;
        expected = ['src/jade/index.jade', 'src/stylus/app.styl', 'src/coffee/app.coffee', 'bower.json', '.gitignore', 'package.json', 'gruntfile.coffee'];
        assert.file(expected);
      });
    });
  });

}).call(this);
