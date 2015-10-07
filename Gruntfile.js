
module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        bowercopy: {
            options: {
                destPrefix: 'vendor'
            },
            libs: {
                files: {
                    'qrcode.js': 'qrcode.js/qrcode.js'
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-bowercopy');
    grunt.registerTask('default', ['bowercopy']);
}
