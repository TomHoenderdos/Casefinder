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
.filter('leatherFilter', function(){
	return function(allCases, leatherFilterInput) {
		if (!angular.isUndefined(allCases) && !angular.isUndefined(leatherFilterInput)){	
			var allFalse = {"L":true, "N":true};
			var tempCases = [];
			angular.forEach(allCases, function(allCases_value, allCases_key){	
				angular.forEach(leatherFilterInput, function(filterInput_value, filterInput_key){
						
						console.log("allCases Value");
						console.log(allCases_value);
						console.log("allCases_key");
						console.log(allCases_key);
						console.log("filterInput_key");
						console.log(filterInput_key);
						console.log("filterInput_value");
						console.log(filterInput_value);
						console.log("allFalse");
						console.log(allFalse);

					if (filterInput_value != "false"){
						
						console.log("filterInput_value != false");
						console.log("filterInput_value");
						console.log(filterInput_value);
						
						if(allCases_value.material == filterInput_value){
							tempCases.push(allCases_value);
						}
					} else {
						
						console.log("bliep");
						console.log(allFalse);
						
						allFalse[filterInput_key] = false;
						
						console.log(allFalse[filterInput_key]);
						console.log("bloep");
						
					}
				})
			})
			console.log(allFalse);
			if(allFalse.L && allFalse.N){
				return allCases;
			} else {
				return tempCases;	
			}
		} else {
			return allCases;
		}
	};
})
.filter('finishingFilter', function(){
	return function(allCases, finishingFilterInput) {
		if (!angular.isUndefined(allCases) && !angular.isUndefined(finishingFilterInput)){	
			var allFalse = true;
			var stopAllFalseCheck = false;
			var tempCases = [];
			angular.forEach(allCases, function(allCases_value, allCases_key){	
				angular.forEach(finishingFilterInput, function(filterInput_value, filterInput_key){
					if (filterInput_value == true){
						if(!stopAllFalseCheck){
							allFalse = false;	
						} 
						if(allCases_value.finishing == filterInput_key){
							allFalse = true;
							stopAllFalseCheck = true;
							tempCases.push(allCases_value);
						}
					}
				})
			})
			if(allFalse){
				return allCases;
			} else {
				return tempCases;	
			}
		} else {
			return allCases;
		}
	};
});
