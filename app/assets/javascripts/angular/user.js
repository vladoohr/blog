var myApp = angular.module("myApp", ['ngResource']);

// Service
myApp.factory("Users",['$resource', function($resource){
    return $resource('/users.json', {}, {
        create: { method: 'POST' }
    });
}]);

// Controller
myApp.controller('usersCtrl', function($scope, Users){
    $scope.user = {}
    $scope.save = function(){
        if($scope.userForm.$valid){
            Users.create({user: $scope.user}, function(){
                document.location.href="/";
            }, function(error){
                console.log(error)
            })
        }
    }
});