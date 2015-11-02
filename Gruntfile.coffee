module.exports = (grunt) ->
  grunt.initConfig
    clean: [
      '.tmp'
      'dist'
    ]

    pkg: grunt.file.readJSON('package.json')

    cssmin:
      dist:
        files:
          'dist/production.min.css': [
            'src/fonts/jubilat.css'
            'src/fonts/freightsans.css'
            'src/css/bernie.css'
            'src/css/signup.css'
          ]

    coffee:
      dist:
        files:
          '.tmp/formConnect.js': 'src/coffee/formConnect.coffee'

    uglify:
      dist:
        files:
          'dist/production.min.js': [
            'bower_components/jquery/dist/jquery.js'
            'bower_components/jquery.maskedinput/dist/jquery.maskedinput.js'
            'bower_components/mailcheck/src/mailcheck.js'
            'bower_components/qrcode.js/qrcode.js'
            '.tmp/formConnect.js'
          ]

    copy:
      dist:
        files: [
          {
            expand: true
            flatten: true
            src: 'src/fonts/*'
            dest: 'dist/'
          }
        ]

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask 'default', [
    'clean'
    'cssmin:dist'
    'coffee:dist'
    'uglify:dist'
    'copy:dist'
  ]