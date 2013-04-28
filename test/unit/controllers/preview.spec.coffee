'use strict'

# jasmine specs for controllers go here

# TODO figure out how to test Controllers that use modules
describe "controllers", ->

  beforeEach(module "app.controllers")

  describe "Preview controller", ->
    scope = null
    ctrl = null

    beforeEach ->
      inject ($rootScope, $controller) ->
        scope = $rootScope.$new()
        ctrl = $controller "PreviewCtrl", $scope: scope


    it "should make scope testable", ->
      expect(scope).toBeDefined()

    it "should have an url as default value", ->
      expect(scope.newPreviewSrc).toMatch /^http\:/gi

    describe "getPreviewStyle method", ->

      it "should return style definitions", ->
        scope.currentBlurValue = 10
        style = scope.getPreviewStyle()

        expect(style['-webkit-filter']).toEqual "blur(10px)" 

      it "should be cross-browser compatible (futureproof)", ->
        scope.currentBlurValue = 10
        style = scope.getPreviewStyle()
        prefixes = ['-webkit-', '-moz-', '-ms-', '', '-o-']
        for item in prefixes
          expect(style["#{item}filter"]).toEqual "blur(10px)" 

    
    it "should be able to reload preview content", ->
      scope.newPreviewSrc = 'http://e-medycyna.pl'
      scope.reloadPage()
      expect(scope.newPreviewSrc).toEqual scope.currentPreviewSrc
