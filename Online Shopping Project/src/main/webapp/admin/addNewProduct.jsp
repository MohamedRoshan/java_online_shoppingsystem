<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if ("done".equals(msg)) {
%>
    <h3 class="alert">Product Added Successfully!</h3>
<% 
} else if ("wrong".equals(msg)) {
%>
    <h3 class="alert">Something went wrong! Try Again!</h3>
<% 
} 
%>

<%
int id = 1;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT MAX(id) FROM product");
    if (rs.next()) {
        id = rs.getInt(1) + 1; // Increment the ID based on the max value found
    }
    rs.close();
    st.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%= id %> </h3>
<input type="hidden" name="id" value="<%= id %>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter name" required>
<hr>
</div>
<div class="right-div">
 <h3>Enter Category</h3>
<input class="input-style" type="text" name="category" placeholder="Enter category" required>
 <hr>
</div>
<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" placeholder="Enter price" required>
<hr>
 </div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
 <option value="Yes">Yes</option>
<option value="No">No</option>
</select>
 <hr>
 </div>
    
<button class="button">Save <i class="far fa-arrow-alt-circle-right"></i></button>
</form>

<br><br><br>
</body>
</html>
