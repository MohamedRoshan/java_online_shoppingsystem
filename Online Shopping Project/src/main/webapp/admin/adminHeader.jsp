<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String email=session.getAttribute("email").toString(); %>
        <center><h2>ONLINE SHOPPING</h2></center>
        <a href="addNewProduct.jsp">Add New Product <i class="fas fa-plus-square"></i></a>
        <a href="allProductEditProduct.jsp">All Products & Edit Products <i class="fas fa-boxes"></i></a>
        <a href="../logout.jsp">logout <i class="fas fa-share-square"></i></a>
    </div>
    <br>
    <!--table-->
</body>
</html>
