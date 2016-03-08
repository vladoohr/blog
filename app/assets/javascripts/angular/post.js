var myApp = angular.module("myApp", ['ngResource']);

// Service
myApp.factory("Posts",['$resource', function($resource){
    return $resource('/posts.json', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' }
    });
}]);

// Controller
myApp.controller('postsCtrl', function($scope, $location, Posts){
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