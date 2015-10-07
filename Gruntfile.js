
module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        bowercopy: {
            options: {
                destPrefix: 'vendor'
            },
            libs: {
                files: {
                    'jquery.js': 'jquery/dist/jquery.js',
                    'jquery.maskedinput.js': 'jquery.maskedinput/dist/jquery.maskedinput.js',
                    'mailcheck.js': 'mailcheck/src/mailcheck.js',
                    'qrcode.js': 'qrcode.js/qrcode.js'
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-bowercopy');
    grunt.registerTask('default', ['bowercopy']);
}
