angular.module('app.controllers', [])
.controller('PreviewCtrl', [
  '$scope'
  '$routeParams'

($scope, $routeParams) ->
  $scope.newPreviewSrc = 'http://twitter.github.io/bootstrap/'
  if $routeParams['src']
    $scope.newPreviewSrc = $routeParams['src']
  $scope.currentBlurValue = 0

  $scope.getPreviewStyle = ->
    filter = "blur(#{$scope.currentBlurValue}px)"
    if $scope.bwEnabled then filter = filter + " saturate(0)"
    style =
      '-webkit-filter': filter
      '-moz-filter':    filter
      '-o-filter':      filter
      '-ms-filter':     filter
      'filter':         filter
    style
  # $scope.getPreviewStyle = _.throttle $scope._getPreviewStyle, 1000
  $scope.reloadPage = -> $scope.currentPreviewSrc = $scope.newPreviewSrc

  $scope.reloadPage()
])