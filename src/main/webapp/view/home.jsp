
<%--
  Created by IntelliJ IDEA.
  User: longv
  Date: 3/20/2023
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.example.templatefinal.HelloServlet" %>
<%@ page import="java.lang.reflect.AnnotatedType" %>
<%@ page import="java.lang.Class" %>
<%@ page import="javax.persistence.Id" %>
<%@page import="java.util.UUID" %>

<html>
<head>
    <title>Crud ${className}</title>
    <link href="/assets/img/favicon.png" rel="icon" />
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />
    <link
            rel="stylesheet"
            href="/css/plugins/iconic/css/material-design-iconic-font.css"
    />
    <link href="/css/plugins/animate.css/animate.min.css" rel="stylesheet" />
    <link href="/css/plugins/bootstrap.min.css" rel="stylesheet" />
    <link
            href="/css/plugins/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
    />
    <link href="/css/plugins/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
            href="/css/plugins/glightbox/css/glightbox.min.css"
            rel="stylesheet"
    />
    <link href="/css/plugins/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/css/plugins/swiper/swiper-bundle.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/custom/core-style.css" />
    <link href="/css/custom/style.css" rel="stylesheet" />
</head>

<body>

<%@include file="/WEB-INF/layout/header.jsp" %>
<div class="container align-items-center" style="margin-top: 100px">
    <div class="mx-auto">
    <%--Bạn hoàn toàn có thể tái sử dụng đường các đường URI qua parameter tương ứng, nếu cần mình sẽ ra 1 clip rõ hơn--%>
        <form action="/b1/add?class=${className}" method="post">
            <c:forEach var="field" items="${fields}">
                <c:if test="${field.name eq 'id'}">
                    <%-- Truong hop kieu du lieu la ID của object thì ta có thể hiển thị tùy vào yêu cầu,ở đây mình sẽ không input id và để Không để id tự tăng --%>
                </c:if>
                <c:if test="${field.name ne 'id' && field.type.simpleName ne 'Set'}">
                    <div class="mb-3">
                        <label for="${field.getName()}" class="form-label">${field.getName()}: </label>
                        <c:choose>
                            <%-- Truong hop kieu du lieu la String --%>
                            <c:when test="${field.type.simpleName == 'String'}">
                                <input type="text" id="id" name="${field.name}" class="form-control" required>
                            </c:when>
                            <%-- Truong hop kieu du lieu la Date --%>
                            <c:when test="${field.type.simpleName == 'Date'}">
                                <input type="date" id="id" name="${field.name}" class="form-control" required>
                            </c:when>
                            <c:when test="${field.type.simpleName == 'Set'}">
                            </c:when>
                            <%-- Đối với các trường dữ liệu là các class mapping relationship, bạn có thể sử dụng Select<Option> để lấy ra các option tương ứng
                                  Ví dụ nhân viên có trường chức vụ để thể hiện chức vụ, bạn có thể lấy thông tin chức vụ để getTenChucVu() để set cho các option
                                  việc này tùy thuộc vào khả năng của bạn.....
                            --%>
                            <c:when test="${!field.type.isPrimitive() && !field.type.getPackage().getName().startsWith('java')}">
                                <jsp:useBean id="myFunctions" class="com.example.templatefinal.HelloServlet" />
                                <c:set var="className" value="${className}" />
                                <c:set var="listInner" value="${myFunctions.getListOfClass(field,className)}" />
                                <select name="${field.name}" class="form-select">
                                    <c:forEach var="option" items="${listInner}">
                                        <option value="${option.id}">${option.ten}</option>
                                    </c:forEach>
                                </select>
                            </c:when>
                            <%-- otherwise custom tùy bạn --%>
                            <c:otherwise>
                                <input type="number" id="id" step="0.01" name="${field.name}" class="form-control" required>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
            </c:forEach>
            <button type="submit"  class="btn btn-success">Insert Object</button>
        </form>

  <table class="table">

<%--   tên cột    --%>
   <thead>
   <tr>
    <c:forEach var="field" items="${fields}">
     <th>${field.name}</th>
    </c:forEach>
       <th> Function </th>
   </tr>
   </thead>
 <%--   tên cột    --%>

 <%--   Dữ liệu    --%>
   <tbody>
   <c:set var="idValue" value="" />
   <c:forEach var="object" items="${list}" varStatus="loop">
    <tr>
     <c:forEach var="field" items="${fields}">
         <c:if test="${field.getName() eq 'id'}">
             <c:set var="idValue" value="${field.get(object)}" />
         </c:if>
      <td>${field.get(object)}</td>
     </c:forEach>
     <td>
             <a href="/b1/detail?class=${className}&id=${idValue.toString()}" class="btn btn-outline-primary" tabindex="-1" role="button" aria-disabled="true">Detail</a>
             <a href="/b1/delete?class=${className}&id=${idValue.toString()}" class="btn btn-outline-primary " tabindex="-1" role="button" aria-disabled="false">Delete</a>
     </td>
    </tr>
   </c:forEach>
   </tbody>
 <%--   Dữ liệu    --%>
  </table>
    </div>
</div>


<%@include file="/WEB-INF/layout/footer.jsp" %>


<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/css/plugins/iconic/fonts/Material-Design-Iconic-Font.woff"></script>
<script src="/css/plugins/iconic/css/material-design-iconic-font.css"></script>
<script src="/css/plugins/glightbox/js/glightbox.min.js"></script>
<script src="/css/plugins/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/css/plugins/swiper/swiper-bundle.min.js"></script>
<script src="/css/plugins/waypoints/noframework.waypoints.js"></script>
<script src="/css/plugins/php-email-form/validate.js"></script>
<script src="/lib/angular.min.js"></script>
<script src="/lib/angular-route.min.js"></script>
<script src="/js/main.js"></script>
</body>
</html>
