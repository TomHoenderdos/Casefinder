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
.filter('finishingFilter', function(){
	return function(allCases, finishingFilterInput) {
		console.log("Case_");
			console.log(allCases);
			console.log("Finishing_");
			console.log(finishingFilterInput);

		if (!angular.isUndefined(allCases) && !angular.isUndefined(finishingFilterInput) && finishingFilterInput.length > 0) {	
			


			var tempCases = [];
			angular.forEach(allCases, function(allCases_value, allCases_key){	
				angular.forEach(finishingFilterInput, function(filterInput_value, filterInput_key){
					if (filterInput_key == true){
						console.log(filterInput_value);
						console.log(allCases_value)
					}
				})
			})

			var items = {
				finishings: finishingFilterInput,
				out: []
			};

			var allFalse = true;
			angular.forEach(allCases, function(value, key){	
				// if (this.finishings === true && this.finishings[value.finishing] == undefined){allFalse = false;}
				if (this.finishings[value.finishing] == true){
					allFalse = false;
					this.out.push(value);
				}
			}, items);

			if (allFalse){
				return allCases;
			} else {
				if ($.isEmptyObject(items.out))
					return [];
				else
					return items.out;
			}
		} else {
			return allCases;
		}
	
	};
});
