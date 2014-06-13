angular.module 'newtab', []


.controller 'CPUCtrl', ($scope) ->

  chrome.system.cpu.getInfo (info) ->
    $scope.$apply ->
      $scope.info = info
