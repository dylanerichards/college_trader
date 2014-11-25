app.controller('CommentsController', ['$scope', '$http', function($scope, $http, $routeParams) {
  $http.get('/categories/1-Electronics/listings/31/comments.json').success(function(data) {
    $scope.comments = data;

    console.log($scope.testInput);
  })
}]);
