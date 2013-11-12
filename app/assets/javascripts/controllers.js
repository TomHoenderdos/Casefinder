var findMyCase = angular.module('findMyCase', []);
 
findMyCase.controller('findMyCaseList', ['$scope', '$http', function($scope, $http){
		$http.get('/cases.json').success(function(response) {
			  $scope.allCases = response;
		});
}]);