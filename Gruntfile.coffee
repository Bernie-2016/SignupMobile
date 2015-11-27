module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: [
      '.tmp'
      'dist'
      'built'
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
      deploy:
        files: [
          {
            expand: true
            src: [
              'dist/*'
              'index.html'
            ]
            dest: 'built'
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

    shell:
      deploy:
        command: './node_modules/.bin/firebase deploy'

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

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-shell')

  grunt.registerTask 'default', [
    'clean'
    'sass:dist'
    'coffee:dist'
    'cssmin:dist'
    'uglify:dist'
    'copy:dist'
  ]

  grunt.registerTask 'deploy', [
    'default'
    'copy:deploy'
    'shell:deploy'
  ]
