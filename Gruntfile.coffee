module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: [
      '.tmp'
      'dist'
      'pkg'
    ]

    coffee:
      dist:
        files:
          '.tmp/formConnect.js': 'src/coffee/formConnect.coffee'

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

    cssmin:
      dist:
        files:
          'dist/production.min.css': [
            'src/css/fonts.css'
            'src/css/bernie.css'
            'src/css/signup.css'
          ]

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

    watch:
      scripts:
        files: [
          'index.html'
          'src/**/*'
        ]
        tasks: ['default']

    zip:
      'pkg/SignupMobile.zip': [
        'dist/*'
        'index.html'
      ]

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-zip')

  grunt.registerTask 'default', [
    'clean'
    'cssmin:dist'
    'coffee:dist'
    'uglify:dist'
    'copy:dist'
  ]

  grunt.registerTask 'build', [
    'default'
    'zip'
  ]
