<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = (String) session.getAttribute("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobileNumber = request.getParameter("mobileNumber");
String paymentMethod = request.getParameter("paymentMethod");
String transactionId = request.getParameter("transactionId");
String status = "bill";

try {
    Connection con = ConnectionProvider.getCon();
    
    // Update user information
    PreparedStatement ps = con.prepareStatement("UPDATE users SET address=?, city=?, state=?, country=?, mobileNumber=? WHERE email=?");
    ps.setString(1, address);
    ps.setString(2, city);
    ps.setString(3, state);
    ps.setString(4, country);
    ps.setString(5, mobileNumber);
    ps.setString(6, email);
    ps.executeUpdate();
    
    

    PreparedStatement ps1 = con.prepareStatement("UPDATE cart SET address=?, city=?, state=?,country=?, mobileNumber=?, orderDate=NOW(), deliveryDate=DATE_ADD(NOW(), INTERVAL 7 DAY), paymentMethod=?, transactionId=?, status=? WHERE email=? AND address IS NULL");
    ps1.setString(1, address);
    ps1.setString(2, city);
    ps1.setString(3, state);
    ps1.setString(4, country);
    ps1.setString(5, mobileNumber);
    ps1.setString(6, paymentMethod);
    ps1.setString(7, transactionId);
    ps1.setString(8, status);
    ps1.setString(9, email);
    ps1.executeUpdate();
    response.sendRedirect("bill.jsp");

} catch(Exception e) {
    e.printStackTrace(); 
}
%>
