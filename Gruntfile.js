'use strict';


module.exports = function (grunt) {

  grunt.initConfig({

    bump: {
      options: {
        files: ['./clone-git-repo/**/package.json'],
      }
    }

  });

  grunt.loadNpmTasks('grunt-bump');

  grunt.registerTask('default', ['bump']);


};