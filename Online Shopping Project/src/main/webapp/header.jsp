<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <!--Header-->
    <div class="topnav sticky">
        <%
        String email = session.getAttribute("email").toString();
        %>
        <center><h2>Online shopping</h2></center>
        <h2><a href=""><%= email %> <i class="fas fa-user-alt"></i></a></h2>
        <a href="home.jsp">Home <i class="fa fa-institution"></i></a>
        <a href="myCart.jsp">My Cart <i class="fas fa-shopping-cart"></i></a>
        <a href="myOrders.jsp">My Orders <i class="fas fa-box"></i></a>
        <a href="changeDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
        <a href="logout.jsp">Logout <i class="fas fa-sign-out-alt"></i></a> 
        
        <div class="search-container">
            <form action="searchHome.jsp" method="post">
                <input type="text" placeholder="Search" name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>
    <br>
    <!--Table or Other Content-->
</body>
</html>