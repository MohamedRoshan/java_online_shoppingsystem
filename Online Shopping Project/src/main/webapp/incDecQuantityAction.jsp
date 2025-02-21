<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    
    // Correct ResultSet declaration and SQL query syntax
    ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE email='" + email + "' AND product_id='" + id + "' AND address IS NULL");

    // Extracting values from ResultSet
    while (rs.next()) {
        price = rs.getInt(4);
        total = rs.getInt(5);
        quantity = rs.getInt(3);
    }

    if (quantity == 1 && incdec.equals("dec")) {
        response.sendRedirect("myCart.jsp?msg=notPossible");
    } else if (quantity != 1 && incdec.equals("dec")) {
        total = total - price;
        quantity = quantity - 1;
        st.executeUpdate("UPDATE cart SET total='" + total + "', quantity='" + quantity + "' WHERE email='" + email + "' AND product_id='" + id + "' AND address IS NULL");
        response.sendRedirect("myCart.jsp?msg=dec");
    } else {
        total = total + price;
        quantity = quantity + 1;
        st.executeUpdate("UPDATE cart SET total='" + total + "', quantity='" + quantity + "' WHERE email='" + email + "' AND product_id='" + id + "' AND address IS NULL");
        response.sendRedirect("myCart.jsp?msg=inc");
    }

    // Closing resources
    rs.close();
    st.close();
    con.close();

} catch (Exception e) {
    System.out.println(e);
}
%>
