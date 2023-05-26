var app = angular.module("myApp", ["ngRoute", "ngStorage"]);

app.config(function ($routeProvider, $locationProvider) {
  $locationProvider.hashPrefix("");
  $routeProvider
    .when("/", {
      templateUrl: "/view/search.jsp",
      controller: productCtrl,
    }).when("/home", {
      templateUrl: "/view/search.jsp",
      controller: productCtrl,
    }).when("!/curd", {
    templateUrl: "/view/home.jsp",
    controller: productCtrl,
  }).when("/blog", {
      templateUrl: "/view/blog.jsp",
      controller: productCtrl,
    }).when("/contact", {
      templateUrl: "./view/contact.jsp",
      controller: productCtrl,
    }).when("/about", {
      templateUrl: "/view/about.jsp",
          controller: productCtrl,
    }).otherwise({
      redirectTo: "/home",
    });
});
