myapp.controller("CommentsController",function($scope,$http,$location,$state,$stateParams){
       $scope.comments ={}

    if($state.current.name == 'comments'){
        $http.get("/comments").             //this doesn't work coz model/id/comment should be the path
         then(function(res){
                 $scope.comments = res.data;
            })
    }

});
