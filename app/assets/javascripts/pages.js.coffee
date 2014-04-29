# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	# findMyCase = angular.module("findMyCase", [])
	# findMyCase.controller("findMyCaseList", [
	# 	"$scope"
	# 	"$http"
	# 	($scope, $http) ->
	# 		$http.get("/admin/cases.json").success (response) ->
	# 			key = undefined
	# 			res = undefined
	# 			for key of response
	# 				res = response[key]
	# 				res.material_decoded = atob(res.material)
	# 			$scope.allCases = response
	# 			return

	# 		$http.get("/admin/devices.json").success (response) ->
	# 			$scope.allDevices = devicesJson
	# 			return

	# 		$scope.clearMaterial = ->
	# 			$scope["case"].material = {}
	# 			return

	# 		$scope.clearFinishing = ->
	# 		  $scope["case"].finishing.Croco = false
	# 		  $scope["case"].finishing.Print = false
	# 		  $scope["case"].finishing.Snake = false
	# 		  $scope["case"].finishing.Other = false
	# 		  $scope["case"].finishing.Gloss = false
	# 		  return

	# 		$scope.clearColors = ->
	# 			$scope.case.color = {}
	# 			return

	# 		$scope.clearProductTypes = ->
	# 			$scope.case.prodType = {}
	# 			return
	# ]).filter "deviceFilter", ->
	# 	(allCases, filterInput) ->
	# 		if not angular.isUndefined(allCases) and not angular.isUndefined(filterInput) and filterInput.length > 0
	# 			tempCases = []
	# 			angular.forEach allCases, (value, key) ->
	# 				gotIt = false
	# 				angular.forEach value.devices, (value, key) ->
	# 					gotIt = true if value.id is filterInput
	# 					return

	# 				tempCases.push value if gotIt
	# 				return

	# 			tempCases
	# 		else
	# 			allCases

$(document).ready(ready)
$(document).on('page:load', ready)