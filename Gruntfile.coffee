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
          '.tmp/app.js': 'src/coffee/app.coffee'

    copy:
      dist:
        files: [
          {
            expand: true
            flatten: true
            src: 'src/{fonts,img}/*'
            dest: 'dist/'
          }
        ]

    cssmin:
      dist:
        files:
          'dist/production.min.css': [
            '.tmp/fonts.css'
            '.tmp/bernie.css'
            '.tmp/footer.css'
          ]

    sass:
      dist:
        files:
          '.tmp/bernie.css': 'src/css/bernie.scss'
          '.tmp/fonts.css': 'src/css/fonts.scss'
          '.tmp/footer.css': 'src/css/footer.scss'

    uglify:
      dist:
        files:
          'dist/production.min.js': [
            'bower_components/jquery/dist/jquery.js'
            'bower_components/jquery.maskedinput/dist/jquery.maskedinput.js'
            'bower_components/mailcheck/src/mailcheck.js'
            'bower_components/fabric.js/dist/fabric.js'
            'bower_components/jquery-qrcode/dist/jquery.qrcode.js'
            '.tmp/app.js'
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
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-zip')

  grunt.registerTask 'default', [
    'clean'
    'sass:dist'
    'coffee:dist'
    'cssmin:dist'
    'uglify:dist'
    'copy:dist'
  ]

  grunt.registerTask 'build', [
    'default'
    'zip'
  ]
