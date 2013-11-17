var findMyCase = angular.module('findMyCase', []);
 
findMyCase.controller('findMyCaseList', ['$scope', '$http', function($scope, $http){
		$http.get('/cases.json').success(function(response) {
			for (var key in response){
			  	var res = response[key];
	  			res.material_decoded = atob(res.material);
			}
			$scope.allCases = response;
		});
		$scope.clearMaterial = function() {
			$scope.materialFilter = {};
		}

		$scope.clearFinishing = function() {
			$scope.finishing.Croco = "";
			$scope.finishing.Print = "";
			$scope.finishing.Snake = "";
			$scope.finishing.Other = "";
			$scope.finishing.Gloss = "";
		}

		$scope.clearColors = function() {
			$scope.colorFilter = {};
		}
}])
.filter('finishingFilter', function(){
	return function(case_, finishing_) {
		
		if (finishing_ == undefined){
			return case_;
		}

		var items = {
			finishings: finishing_,
			out: []
		};
		var allFalse = true;
		angular.forEach(case_, function(value, key){	


			// if (this.finishings === true && this.finishings[value.finishing] == undefined){allFalse = false;}
			if (this.finishings[value.finishing] === true){
				allFalse = false;
				this.out.push(value);
			}
		}, items);

		if (allFalse){
			return case_;
		} else {
			if ($.isEmptyObject(items.out))
				return [];
			else
				return items.out;
		}
		
	};
});