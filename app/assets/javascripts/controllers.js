var findMyCase = angular.module('findMyCase', ['ngResource']);
 
findMyCase.controller('PhoneListCtrl', function PhoneListCtrl($scope) {
	$scope.add = function(){
		$http.get('/case.json').then(function(response) {
			  $scope.allCases = response;
		});
	};
});