var findMyCase = angular.module('findMyCase', []);
 
findMyCase.controller('findMyCaseList', ['$scope', '$http', function($scope, $http){
		$http.get('/cases.json').success(function(response) {
			for (var key in response){
			  	var res = response[key];
	  			res.material = atob(res.material);
			}
			$scope.allCases = response;
		});
}]);