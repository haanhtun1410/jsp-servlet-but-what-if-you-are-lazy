<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <!-- ======= Hero Section ======= -->
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
        <div class="carousel-indicators">
            <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="0"
                    class="active"
                    aria-current="true"
                    aria-label="Slide 1"
            ></button>
            <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="1"
                    aria-label="Slide 2"
            ></button>
            <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="2"
                    aria-label="Slide 3"
            ></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img
                        src="/assets/img/slide/slide-1.jpg"
                        class="d-block w-100"
                        alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img
                        src="/assets/img/slide/slide-2.jpg"
                        class="d-block w-100"
                        alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img
                        src="/assets/img/slide/slide-3.jpg"
                        class="d-block w-100"
                        alt="..."
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                </div>
            </div>
        </div>
        <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev"
        >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next"
        >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!-- ======= Clients Section ======= -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <h1 class="text-center">Sản phẩm bán chạy</h1>
                <br />
            </div>
            <br />
            <div class="row">
                <div
                        ng-repeat="product in products | limitTo: 8 "
                        class="col-lg-3 mb-4 col-sm-6 portfolio-item"
                        ng-href="#/detail/{{product.id}}"
                >
                    <a href="#/detail/{{product.id}}">
                        <div class="portfolio-wrap">
                            <img
                                    ng-src="/assets/img/product/{{product.image}}"
                                    class="img-fluid"
                                    alt=""
                                    style="height: 300px; width: 300px; object-fit: cover"
                            />

                            <div class="portfolio-info">
                                <h4>{{product.name}}</h4>
                                <h3>{{product.price}}$</h3>
                                <div class="portfolio-links">
                                    <a
                                            ng-click="addToCart(product.id)"
                                            ng-href="#/cart"
                                            data-gallery="portfolioGallery"
                                            class="portfolio-lightbox"
                                            title="Quick purchase"
                                    ><i class="bx bx-plus"></i
                                    ></a>
                                    <a
                                            href="#/detail/{{product.id}}"
                                            class="portfolio-details-lightbox"
                                            data-glightbox="type: external"
                                            title="Portfolio Details"
                                    ><i class="bx bx-link"></i
                                    ></a>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 justify-content-center">
                    <h1 class="text-center">Sản phẩm mới nhất</h1>
                    <br />
                </div>
            </div>
            <br />
            <div class="row portfolio-container">
                <div
                        ng-repeat="product in products | orderBy : '-created_at'| limitTo : 8 "
                        class="col-lg-3 col-md-4 portfolio-item"
                >
                    <a href="#/detail/{{product.id}}">
                        <div class="portfolio-wrap">
                            <img
                                    ng-src="/assets/img/product/{{product.image}}"
                                    style="height: 300px; width: 300px; object-fit: cover"
                                    class="img-fluid"
                                    alt=""
                            />
                            <div class="portfolio-info">
                                <h4>{{product.name}}</h4>
                                <h3>{{product.price}}$</h3>
                                <div class="portfolio-links">
                                    <a
                                            ng-click="addToCart(product.id)"
                                            ng-href="#/cart"
                                            data-gallery="portfolioGallery"
                                            class="portfolio-lightbox"
                                            title="Quick purchase"
                                    ><i class="bx bx-plus"></i
                                    ></a>
                                    <a
                                            href="#/detail/{{product.id}}"
                                            class="portfolio-details-lightbox"
                                            data-glightbox="type: external"
                                            title="Portfolio Details"
                                    ><i class="bx bx-link"></i
                                    ></a>
                                </div>
                            </div></div
                        ></a>
                </div>
            </div>
        </div>
    </section>
    <!-- End Clients Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="icon-box">
                        <i class="bi bi-briefcase"></i>
                        <h4><a href="#">Lorem Ipsum</a></h4>
                        <p>
                            Voluptatum deleniti atque corrupti quos dolores et quas molestias
                            excepturi sint occaecati cupiditate non provident
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-card-checklist"></i>
                        <h4><a href="#">Dolor Sitema</a></h4>
                        <p>
                            Minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                            aliquip ex ea commodo consequat tarad limino ata
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-bar-chart"></i>
                        <h4><a href="#">Sed ut perspiciatis</a></h4>
                        <p>
                            Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-binoculars"></i>
                        <h4><a href="#">Nemo Enim</a></h4>
                        <p>
                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                            officia deserunt mollit anim id est laborum
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-brightness-high"></i>
                        <h4><a href="#">Magni Dolore</a></h4>
                        <p>
                            At vero eos et accusamus et iusto odio dignissimos ducimus qui
                            blanditiis praesentium voluptatum deleniti atque
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-calendar4-week"></i>
                        <h4><a href="#">Eiusmod Tempor</a></h4>
                        <p>
                            Et harum quidem rerum facilis est et expedita distinctio. Nam
                            libero tempore, cum soluta nobis est eligendi
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Services Section -->

    <!-- End #main -->
</section>

