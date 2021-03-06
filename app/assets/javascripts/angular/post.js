var myApp = angular.module("myApp", ['ngResource']);

// Service
myApp.factory("Posts",['$resource', function($resource){
    return $resource('/posts.json', {}, {
        create: { method: 'POST' }
    });
}]);

// Controller
myApp.controller('postsCtrl', function($scope, Posts){
    $scope.post = {}
    $scope.save = function(){
        if($scope.postForm.$valid){
            Posts.create({post: $scope.post}, function(){
                document.location.href="/";
            }, function(error){
                console.log(error)
            })
        }
    }
});