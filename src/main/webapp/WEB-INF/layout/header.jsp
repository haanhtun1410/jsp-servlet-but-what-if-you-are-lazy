<%--
  Created by IntelliJ IDEA.
  User: longv
  Date: 4/3/2023
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
</head>
<body>
<header  id="header"
         class="fixed-top d-flex align-items-center">
<div class="container d-flex align-items-center">
    <h1 class="logo me-auto"><a href="/main-page">Sailor</a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="logo me-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>-->
    <nav id="navbar" class="navbar">
        <ul>
            <li><a href="/main-page">Home</a></li>
            <li class="dropdown">
                <a href="/crud-view?class=NhanVien"
                ><span>CRUD </span> <i class="bi bi-chevron-down"></i
                ></a>
                <ul>
                    <c:forEach var="clazz" items="${requestScope.classList}">
                        <li>
                            <a href="/crud-view?class=${clazz.toString()}">${clazz.toString()}</a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
            <li><a href="/san-pham/view">Product</a></li>
            <li><a href="#/about">About</a></li>
            <li><a href="#/blog">Blog</a></li>
            <li><a href="#/contact">Contact</a></li>
            <li>
                <a href="/gio-hang">
                    <i style="font-size: 16px; color: gray" class="bi bi-basket3-fill"></i>
                    <c:if test="${requestScope.cart.items.size() >0}">
                       <span
                               style="background-color: red"
                               class="badge badge-light"
                       >${requestScope.cart.items.size()}</span>
                    </c:if>
                </a>
            </li>
            </ul>
    </nav>
     </div>
</header>
</body>
</html>
