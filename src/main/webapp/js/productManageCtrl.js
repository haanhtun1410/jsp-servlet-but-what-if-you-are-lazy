window.productCtrl = function (
  $routeParams,
  $http,
  $scope,
  $rootScope,
) {
  $scope.categories = {};
  $scope.newProduct = {};
  $scope.newCategory = {};
  $scope.products = [];
  $scope.filteredProducts = {};
  $rootScope.cart = [];

  $rootScope.subtotal = 0;
  $scope.fromDetail = 1;
}