<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email = (String) session.getAttribute("email");
if (email == null) {
    // Handle the case where the user is not logged in
    response.sendRedirect("login.jsp"); // Redirect to login page or show an error
    return; // Exit the JSP to avoid further processing
}

int total = 0;
int sno = 0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
    while (rs1.next()) {
        total = rs1.getInt(1);
    }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
          <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%= total %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
          <th scope="col">Product Name</th>
          <th scope="col">Category</th>
          <th scope="col"><i class="fa fa-inr"></i> Price</th>
          <th scope="col">Quantity</th>
          <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = st.executeQuery("SELECT * FROM product INNER JOIN cart ON product.id=cart.product_id AND cart.email='" + email + "' AND cart.address IS NULL");
        while (rs.next()) {
        %>
          <tr>
          <% sno++; %>
           <td><%= sno %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><%= rs.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(10) %></td>
            </tr>
        <%
        }
        ResultSet rs2 = st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
        if (rs2.next()) {
        %>
        </tbody>
      </table>

<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%= rs2.getString(7) %>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter City</h3>
<input class="input-style" type="text" name="city" value="<%= rs2.getString(8) %>" placeholder="Enter city" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%= rs2.getString(9) %>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h3>Enter Country</h3>
<input class="input-style" type="text" name="country" value="<%= rs2.getString(10) %>" placeholder="Enter Country" required>
</div>
<h3 style="color: red">*If there is no address, it means that you did not set your address!</h3>
<h3 style="color: red">*This address will also update your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select Way of Payment</h3>
 <select class="input-style" name="paymentMethod">
 <option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
 <option value="Online Payment">Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this Vin_Rosh@pay.com</h3>
<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">
<h3 style="color: red">*If you select online payment, then enter your transaction ID here; otherwise, leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%= rs2.getString(3) %>" placeholder="Enter Mobile Number" required>
<h3 style="color: red">*This mobile number will also update your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter a wrong transaction ID, then your order may be canceled!</h3>
<button class="button" type="submit">Proceed to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
        }

} catch (Exception e) {
    e.printStackTrace(); // More detailed error reporting
}
%>

      <br>
      <br>
      <br>

</body>
</html>
