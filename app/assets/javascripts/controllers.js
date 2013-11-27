var findMyCase = angular.module('findMyCase', []);
 
findMyCase.controller('findMyCaseList', ['$scope', '$http', function($scope, $http){
		$http.get('/admin/cases.json').success(function(response) {
			for (var key in response){
			  	var res = response[key];
	  			res.material_decoded = atob(res.material);
			}
			$scope.allCases = response;
		});

		$http.get('/admin/devices.json').success(function(devicesJson) {
			$scope.allDevices = devicesJson;
		});

		$scope.clearMaterial = function() {
			$scope.case.material = {};
		}

		$scope.clearFinishing = function() {
			$scope.case.finishing.Croco = false;
			$scope.case.finishing.Print = false;
			$scope.case.finishing.Snake = false;
			$scope.case.finishing.Other = false;
			$scope.case.finishing.Gloss = false;

		}

		$scope.clearColors = function() {
			$scope.case.color = {};
		}
}])
.filter('deviceFilter', function(){
	return function(allCases, filterInput){
		if (!angular.isUndefined(allCases) && !angular.isUndefined(filterInput) && filterInput.length > 0) {
			var tempCases = [];
			angular.forEach(allCases, function(value, key){
			var gotIt = false;	
				angular.forEach(value.devices, function(value, key){
					if (value.id == filterInput){
						gotIt=true;
					}
				});
				if(gotIt){
					tempCases.push(value);
				}
			});
			return tempCases;
		} else {
			return allCases;
		}
	};
})
// .filter('leatherFilter', function(){
// 	return function(allCases, leatherFilterInput) {
// 		if (!angular.isUndefined(allCases) && !angular.isUndefined(leatherFilterInput)){	
// 			var tempCases = [];
// 				angular.forEach(leatherFilterInput, function(filterInput_value, filterInput_key){
// 					angular.forEach(allCases, function(allCases_value, allCases_key){				
// 						if(angular.equals(allCases_value.material, filterInput_value)){
// 							tempCases.push(allCases_value);
// 						}
// 					});
// 				});
// 			return tempCases;
// 		} else {
// 			return allCases;
// 		}
// 	};
// })
.filter('colorFilter', function(){
	return function(allCases, colorFilterInput) {
		console.log("colorFilterInput");
		console.log(colorFilterInput);
		if (!angular.isUndefined(allCases) && !angular.isUndefined(colorFilterInput) && colorFilterInput.length > 0){
			var tempCases = [];
			angular.forEach(allCases, function(cases){	
				if (cases.color == colorFilterInput){
					tempCases.push(cases);
				}
			});
			return tempCases;
		} else {
			return allCases;
		}
	};
}).filter('finishingFilter', function(){
	return function(allCases, finishingFilterInput) {
		console.log("finishingFilterInput");
		console.log(finishingFilterInput);
		if (!angular.isUndefined(allCases) && !angular.isUndefined(finishingFilterInput)){	
			var FilterInputsFalse = true;
			var noResults = true;
			var tempCases = [];
			angular.forEach(allCases, function(allCases_value, allCases_key){	
				angular.forEach(finishingFilterInput, function(filterInput_value, filterInput_key){
					if (filterInput_value == true){			
							FilterInputsFalse = false;			
						if(allCases_value.finishing == filterInput_key){
							noResults = false;
							tempCases.push(allCases_value);
						}
					}
				});
			});
			if(FilterInputsFalse){
				return allCases;
			} else {
				if (noResults){
					return allCases;
				} else {	
					return tempCases;	
				}
			}
		} else {
			return allCases;
		}
	};
});
