<%--
  Created by IntelliJ IDEA.
  User: longv
  Date: 4/6/2023
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sản Phẩm</title>
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
<table class="table">

    <%--   tên cột    --%>
    <thead>
    <tr>
        <c:forEach var="field" items="${fields}">
            <c:if test="${field.name ne 'id' && field.name ne 'id' && field.name ne 'soLuongTon' && field.name ne 'giaNhap' }">
                <th>${field.name}</th>
            </c:if>
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
                <c:if test="${field.name ne 'id' && field.name ne 'id' && field.name ne 'soLuongTon' && field.name ne 'giaNhap' }">
                    <td>${field.get(object)}</td>
                </c:if>
            </c:forEach>
            <td>
                <a href="/san-pham/add?id=${idValue.toString()}" class="btn btn-outline-primary" tabindex="-1" role="button" aria-disabled="true">Add to cart</a>
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
