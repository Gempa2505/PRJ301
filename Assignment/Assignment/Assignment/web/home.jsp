
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Book Store</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"

            />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM3SIwjGg1AA5D6l5v6NAYtj8MR4hxR5qqEmNO0" crossorigin="anonymous">

    </head>
    <body>
        <h1 class="text-center" style="color: white; background-color: #084298"><i class="fa-solid fa-book"></i>BookStore</h1>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
<!--        <header class="py-5">

                            <div class="text-center text-w
                                 hite">
                                <h1 class="display-4 fw-bolder" style="color: white">Book Store</h1>
                                <p class="lead fw-normal text-white-50 mb-0">
                                    Welcome to everyone go to Book Store!
                                </p>
                            </div>
            <div
                class="p-5 text-center bg-image"
                style="
                background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/041.webp');
                height: 400px;
                "
                >
            </div>
        </header>-->
        <!-- Section-->
        
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>Danh Mục</h3>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>Danh Mục Sản Phẩm</h3>
                        <c:choose>
                            <c:when test="${listProducts==null || listProducts.size()==0}">
                                Không tìm thấy
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">Trước</a></li>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">Tiếp</a></li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    ${P.id}
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <!--                                        <div
                                                                                    class="badge bg-dark text-white position-absolute"
                                                                                    style="top: 0.5rem; right: 0.5rem"
                                                                                    >
                                                                                    Sale
                                                                                </div>-->
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.imageUrl}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2"
                                                    >
                                                    <div class="bi-star-fill">${P.tiltle}</div>

                                                </div>
                                                <!-- Product price-->
                                                <!--                                                <span class="text-muted text-decoration-line-through"
                                                                                                      >{P.price+10}</span
                                                                                                >-->
                                                ${P.price} VND
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                   >Thêm vào giỏ hàng</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <c:if test="${p != null}">
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4 text-center" >Sản phẩm mới</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach items="${p}" var="L">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
<!--                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>-->
                                <!-- Product image-->
                                <a href="detail?productId=${L.id}">
                                <img class="card-img-top" src="${L.imageUrl}" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${L.name}</h5>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
<!--                                        <span class="text-muted text-decoration-line-through">{L.price+10}</span>-->
                                        ${L.price} VND
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${L.id}">Thêm vào giỏ hàng</a></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
            
        </section>
            </c:if>
        <%@include file="components/new.jsp"%>  
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
