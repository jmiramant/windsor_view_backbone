module.exports = function(grunt) {

  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    server: {
      port: 8000,
      base: '.'
    },
    concat: {
      options: {
        stripBanners: true,
        banner: '//\n' +
          '// <%= pkg.name %> - v<%= pkg.version %>\n' +
          '// The MIT License\n' +
          '// Copyright (c) 2012 The New York Times, CMS Group, Matthew DeLambo <delambo@gmail.com> \n' +
          '//\n'
      },
      dist: {
        src: 'backbone.stickit.js',
        dest: 'dist/backbone.stickit.js'
      }
    },
    nodemon: {
      dev: {
        script: 'server.js',
        options: {
          watch: ["server"]
        }
      }
    },
    watch: {
      sass: {
        files: ['styles/sass/**/*.{scss,sass}','styles/sass/_partials/**/*.{scss,sass}'],
        tasks: ['sass:dist']
      },
      livereload: {
        files: ['*.html', 'js/**/*.{js,json}','css/*.css','img/**/*.{png,jpg,jpeg,gif,webp,svg}'],
        options: {
          livereload: true
        }
      },
      templates: {
        files: ['./scripts/app/templates/*.html','./scripts/app/templates/**/*.html','./scripts/app/templates/**/**/*.html','./scripts/app/templates/**/**/**/*.html'],
        tasks: ['handlebars']
      }
    },
    'handlebars': {
      compile: {
        options: {
          amd: ['handlebars']
        },
        src: ['./scripts/app/templates/**/**/**/*.html'],
        dest: './scripts/templates.js'
      }
    },
    compass: {
      dist: {
        options: {
          sassDir: 'styles/sass',
          cssDir: 'styles/css'
        }
      }
    },
    sass: {
      dist: {
        files: [{
          expand: true,
          cwd: '../styles',
          src: ['*.sass', '*.scss'],
          dest: '../styles/public',
          ext: '.css'
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-nodemon');
  grunt.loadNpmTasks('grunt-docco');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-handlebars');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-compress');

  grunt.registerTask('default', ['build', "nodemon", 'watch']);
  grunt.registerTask('build', ['compass', 'sass', 'handlebars', 'concat']);
  // grunt.registerTask('build', ['jshint', 'clean:build', 'uglify:nasty', 'compress:gz', 'compress:zip']);

};
