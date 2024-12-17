<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String email = (String) session.getAttribute("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");

if (email == null || address == null || city == null || state == null || country == null) {
    response.sendRedirect("addChangeAddress.jsp?msg=invalid");
} else {
    Connection con = null;
    PreparedStatement ps = null;
    
    try {
        con = ConnectionProvider.getCon();
        ps = con.prepareStatement("UPDATE users SET address=?, city=?, state=?, country=? WHERE email=?");
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, country);
        ps.setString(5, email);
        
        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            response.sendRedirect("addChangeAddress.jsp?msg=valid");
        } else {
            response.sendRedirect("addChangeAddress.jsp?msg=invalid"); 
        }
    } catch (Exception e) {
        e.printStackTrace(); // Consider logging this
        response.sendRedirect("addChangeAddress.jsp?msg=invalid");
    } finally {
 
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }
}
%>
