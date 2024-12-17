<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;
int z = 0;

try {
    Connection con = ConnectionProvider.getCon();

    // Get product price from product table
    PreparedStatement ps1 = con.prepareStatement("SELECT * FROM product WHERE id = ?");
    ps1.setString(1, product_id);
    ResultSet rs1 = ps1.executeQuery();
    if (rs1.next()) {
        product_price = rs1.getInt(4);
        product_total = product_price;
    }
    rs1.close();
    ps1.close();

    // Check if product is already in the cart for the user
    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM cart WHERE product_id = ? AND email = ? AND address IS NULL");
    ps2.setString(1, product_id);
    ps2.setString(2, email);
    ResultSet rs2 = ps2.executeQuery();

    if (rs2.next()) {
        cart_total = rs2.getInt("total") + product_total;
        quantity = rs2.getInt("quantity") + 1;
        z = 1;
    }
    rs2.close();
    ps2.close();

    if (z == 1) {
        // Update cart if product exists
        PreparedStatement ps3 = con.prepareStatement("UPDATE cart SET total = ?, quantity = ? WHERE product_id = ? AND email = ? AND address IS NULL");
        ps3.setInt(1, cart_total);
        ps3.setInt(2, quantity);
        ps3.setString(3, product_id);
        ps3.setString(4, email);
        ps3.executeUpdate();
        ps3.close();

        response.sendRedirect("home.jsp?msg=exist");
    } else {
        // Insert new entry if product does not exist in the cart
        PreparedStatement ps4 = con.prepareStatement("INSERT INTO cart(email, product_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
        ps4.setString(1, email);
        ps4.setString(2, product_id);
        ps4.setInt(3, quantity);
        ps4.setInt(4, product_price);
        ps4.setInt(5, product_total);
        ps4.executeUpdate();
        ps4.close();

        response.sendRedirect("home.jsp?msg=added");
    }

    con.close();
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("home.jsp?msg=invalid");
}
%>
