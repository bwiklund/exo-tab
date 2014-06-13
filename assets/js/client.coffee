angular.module 'newtab', []


.controller 'CPUCtrl', ($scope, $interval) ->

  $scope.processorStyle = (i) ->
    return if !$scope.lastInfo?

    now = $scope.info.processors[i]
    last = $scope.lastInfo.processors[i]

    totalSinceLast = now.usage.total - last.usage.total
    idleSinceLast  = now.usage.idle  - last.usage.idle

    usage = 1 - idleSinceLast / totalSinceLast
    width: usage * 100 + "%"
    background: "white"


  $interval ->
    chrome.system.cpu.getInfo (info) ->
      $scope.$apply ->
        $scope.lastInfo = $scope.info
        $scope.info = info
  ,100
