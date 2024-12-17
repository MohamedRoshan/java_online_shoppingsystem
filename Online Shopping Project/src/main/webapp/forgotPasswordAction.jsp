<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String SecurityQuestion = request.getParameter("SecurityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM users WHERE email = ? AND mobilenumber = ? AND SecurityQuestion = ? AND answer = ?");
    ps.setString(1, email);
    ps.setString(2, mobilenumber);
    ps.setString(3, SecurityQuestion);
    ps.setString(4, answer);

    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        check = 1;
        PreparedStatement updatePs = con.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
        updatePs.setString(1, newPassword);
        updatePs.setString(2, email);
        updatePs.executeUpdate();
        response.sendRedirect("forgotpassword.jsp?msg=done");
    }
    if (check == 0) {
        response.sendRedirect("forgotpassword.jsp?msg=invalid");
    }
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("forgotpassword.jsp?msg=error");
}
%>
