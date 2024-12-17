<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="loginAction.jsp" method="post"> 
      <input type="email" name="email" placeholder="Enter Email" required>
      <input type="password" name="password" placeholder="Enter Password" required>
      <input type="submit" value="Login">
    </form>
     
    <h2><a href="signup.jsp">Sign Up</a></h2>
    <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  
  <div class='whysignLogin'>
    <%
      String msg = request.getParameter("msg");
      if ("notexist".equals(msg)) {
    %>
        <h1>Incorrect USERNAME or Password</h1>
    <% } %>
    
    <%
      if ("invalid".equals(msg)) {
    %>
        <h1>Something Went Wrong! Try Again!</h1>
    <% } %>
    
    <h2>Online Shopping</h2>
    <p>"Welcome to the Online Shopping Project! Enjoy a seamless shopping experience from the comfort of your home."</p>
  </div>
</div>
</body>
</html>
