angular.module('app.controllers.PreviewCtrl', [])
.controller('PreviewCtrl', [
  '$scope'
  '$routeParams'

($scope, $routeParams) ->
  $scope.newPreviewSrc = 'http://twitter.github.io/bootstrap'
  if $routeParams['src']
    $scope.newPreviewSrc = $routeParams['src']
  $scope.currentBlurValue = 0
  $scope.getPreviewStyle = ->
    blur = "blur(#{$scope.currentBlurValue}px)"
    style =
      '-webkit-filter': blur
      '-moz-filter':    blur
      '-ms-filter':     blur
      'filter':         blur
    style
  # $scope.getPreviewStyle = _.throttle $scope._getPreviewStyle, 1000
  $scope.reloadPage = -> $scope.currentPreviewSrc = $scope.newPreviewSrc

  $scope.reloadPage()
])
