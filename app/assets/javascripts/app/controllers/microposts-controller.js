myapp.controller("MicropostsController",function($scope, $http, $location, $state, $stateParams){
    $scope.create = function() {
        return $http.post("/tasks", {
            task: {
                title: $scope.task.title,
                description: $scope.task.description
            }
        }).then((function(response) {
            return $location.path("/microposts");
        }), function(error) {});
    };

});