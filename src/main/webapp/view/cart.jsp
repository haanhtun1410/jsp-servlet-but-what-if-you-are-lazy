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
    <title>Gio hang</title>
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
<c:set var="subtotal" value="0" />
        <section class="container align-items-center">
            <div class="main-content-wrapper d-flex">
                <div class="cart-table-area section-padding-100">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="cart-title mt-50">
                                    <h2>Shopping Cart</h2>
                                </div>
                                <div class="cart-table clearfix">
                                    <table class="table table-responsive">
                                        <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="items" items="${cart.items}">
                                            <tr>
                                                <c:set var="subtotal" value="${subtotal + (items.quantity * items.price)}" /> <!-- Add current row's subtotal to the running subtotal -->
                                                <td class="cart_product_desc">
                                                    <h5>${items.productName}</h5>
                                                </td>
                                                <td class="price">
                                                    <span>$${items.price}</span>
                                                </td>
                                                <td class="qty">
                                                    <div class="qty-btn d-flex">
                                                        <p>Qty</p>
                                                        <div class="quantity">
                          <span class="qty-minus"
                          ><i class="fa fa-minus"></i
                          ></span>
                                                            <form action="/san-pham/quantity-change" method="get"> <!-- Set the form action to your servlet URL -->
                                                                <input type="number"
                                                                       class="qty-text"
                                                                       id="qty"
                                                                       step="1"
                                                                       min="0"
                                                                       max="300"
                                                                       name="quantity"
                                                                       value="${items.quantity}"
                                                                       onchange="this.form.submit();"
                                                                />
                                                                <input type="hidden" name="idP" value="${items.productId}">

                                                            </form>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>$${items.quantity * items.price}</td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>

                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="cart-summary">
                                    <h5>Cart Total</h5>
                                    <ul class="summary-table">
                                        <li><span>subtotal:</span> <span>$${subtotal}</span></li>
                                        <li><span>delivery:</span> <span>Free</span></li>
                                        <li><span>total:</span> <span>$${subtotal}</span></li>
                                    </ul>
                                    <div class="cart-btn mt-100">
                                        <a href="#/checkout" class="btn amado-btn w-100">Checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
