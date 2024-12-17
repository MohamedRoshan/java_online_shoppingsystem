<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="forgotPasswordAction.jsp" method="post">
  <input type="email" name="email" placeholder="Enter email" required>
  <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
  <select name="SecurityQuestion">
  <option value="What is your pet name?">What is your pet name</option>
  <option value="Which elementary school did you attend first?">First vehicle?</option>
  <option value="First vehicle?">First vehicle?</option>
  </select>
   <input type="text" name="answer" placeholder="Enter Answer" required>
    <input type="password" name="newpassword" placeholder="Enter Your New Password" required>
    <input type="submit" value="save">
  </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   
<h1>Password Changed Successfully!</h1>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>	
<h2>Online Shopping</h2>
<%} %>
 
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>