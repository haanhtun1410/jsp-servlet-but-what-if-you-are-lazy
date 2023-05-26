<%--
  Created by IntelliJ IDEA.
  User: longv
  Date: 4/3/2023
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body ng-app="myApp">
<div ng-controller="myCtrl">
    <h1>{{greeting}}</h1>
</div>
<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) {
        $scope.greeting = 'Hello, World!';
    });
</script>
</body>
</html>
