<%--
  Created by IntelliJ IDEA.
  User: longv
  Date: 3/20/2023
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="com.example.templatefinal.HelloServlet" %>
<%@ page import="java.lang.reflect.AnnotatedType" %>
<%@ page import="java.lang.Class" %>
<%@ page import="javax.persistence.Id" %>
<html>
<head>
    <title>Detail ${className}</title>
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
<form action="/b1/update?class=${className}&id=${id}" method="post">
    <c:set var="detail" value="${detail}"></c:set>
    <jsp:useBean id="myFunction" class="com.example.templatefinal.HelloServlet"/>
    <jsp:useBean id="myFunctions" class="org.apache.commons.beanutils.BeanUtils"/>
    <c:forEach var="field" items = "${fields}">
        <c:if test="${field.name eq 'id'}">
            <%--Truong hop kieu du lieu la ID của object thì ta có thể hiển thị tùy vào yêu cầu,ở đây mình sẽ không input id và để Không để id tự tăng--%>
        </c:if>
        <c:if test="${field.name ne 'id'  && field.type.simpleName ne 'Set'}">
            <label for="${field.getName()}">${field.getName()}: </label>
            <c:choose>
                <%--Truong hop kieu du lieu la String--%>
                <c:when test="${field.type.simpleName == 'String'}">
                    <input type="text" id="id" class="form-control" name="${field.name}" value="${myFunctions.getProperty(detail, field.name)}" required>
                </c:when>
                <c:when test="${field.type.simpleName == 'Integer' || field.type.simpleName == 'int' || field.type.simpleName == 'double' ||field.type.simpleName == 'BigDecimal'}">
                    <input type="number" id="id" class="form-control" name="${field.name}" value="${myFunctions.getProperty(detail, field.name)}" required>
                </c:when>
                <%--Truong hop kieu du lieu la Date--%>
                <c:when test="${field.type.simpleName == 'Date'}">
                    <input type="date" id="id"  class="form-control"name="${field.name}" value="${myFunctions.getProperty(detail, field.name)}"   required>
                </c:when>
                <c:when test="${field.type.simpleName == 'Set'}">

                </c:when>
                <%--Đối với các trường dữ liệu là các class mapping relationship, bạn có thể sử dụng Select<Option> để lấy ra các option tương ứng
                Ví dụ nhân viên có trường chức vụ để thể hiện chức vụ, bạn có thể lấy thông tin chức vụ để getTenChucVu() để set cho các option
                việc này tùy thuộc vào khả năng của bạn.....
                --%>
                <c:when test="${!field.type.isPrimitive() && !field.type.getPackage().getName().startsWith('java')}">
                    <c:set var="className" value="${className}"/>
                    <c:set var="listInner" value="${myFunction.getListOfClass(field,className)}" />
                    <select class="form-select" name="${field.name}">
                        <c:forEach var="option" items="${listInner}">
                           <c:choose>
                               <c:when test="${option == myFunctions.getProperty(detail, field.name)}">
                                   <option value="${option.id}" selected="selected">${option.ten}</option>
                               </c:when>
                               <c:otherwise>
                                   <option value="${option.id}">${option.ten}</option>
                               </c:otherwise>
                           </c:choose>
                        </c:forEach>
                    </select>
                </c:when>
                <%-- otherwise custom tùy bạn --%>
                <c:otherwise>
                    <input type="number" class="form-control" id="id" name="${field.name} value="${myFunctions.getProperty(detail, field.name)}" required>
                </c:otherwise>
            </c:choose>
        </c:if>
        <br>
    </c:forEach>
    <button type="submit"  class="btn btn-success">Update</button>
</form>
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
