module.exports = (grunt) ->
  grunt.initConfig(
    clean:
      precompile: ['tmp/precompile', 'public/assets']
    coffee:
      compileBare:
        options:
          bare: true
        files: grunt.file.expandMapping(['app/assets/javascripts/**/*.coffee'], 'tmp/precompile/',
          rename: (destBase, destPath) ->
            destBase + destPath.replace(/\.coffee$/, '.js')
        )
    copy:
      target:
        files: [
          { src: ['app/assets/javascripts/**/*.js','app/assets/javascripts/**/*.html'], dest: 'tmp/precompile/'}
        ]
    requirejs:
      compile:
        options:
          baseUrl: 'tmp/precompile/app/assets/javascripts'
          name: 'main'
          mainConfigFile: 'tmp/precompile/app/assets/javascripts/main.js'
          preserveLicenseComments: false
          optimize: 'uglify2'
          findNestedDependencies: true
          inlineText: true
          stubModules: ['text', 'html']
          out: 'public/javascripts/ttt.js'

  )
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-requirejs')

  grunt.registerTask('build', ['clean','coffee','copy','clean'])
