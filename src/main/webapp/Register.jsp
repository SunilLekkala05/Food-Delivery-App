<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String error = (String) request.getAttribute("errorMessage");
    String success = (String) request.getAttribute("successMessage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - FoodExpress</title>

<style>
:root {
  --bg:#f6f7fb;
  --card:#ffffff;
  --muted:#6b7280;
  --accent:#ff6b35;
  --shadow:0 6px 18px rgba(16,24,40,0.08);
  --radius:14px;
  font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, Arial;
}

body{
  margin:0;
  background:linear-gradient(180deg,var(--bg),#fff);
  display:flex;
  justify-content:center;
  align-items:center;
  height:100vh;
}

.register-card{
  width:420px;
  background:var(--card);
  padding:35px;
  border-radius:var(--radius);
  box-shadow:var(--shadow);
}

h2{
  text-align:center;
  color:var(--accent);
  margin-bottom:20px;
}

input{
  width:100%;
  padding:12px;
  margin-bottom:12px;
  border-radius:8px;
  border:1px solid #d1d5db;
  font-size:14px;
  outline:none;
}

input:focus{
  border-color:var(--accent);
  box-shadow:0 0 0 2px rgba(255,107,53,0.2);
}

button{
  width:100%;
  padding:12px;
  border:none;
  border-radius:8px;
  background:var(--accent);
  color:white;
  font-weight:600;
  cursor:pointer;
}

button:hover{
  background:#e85c28;
}

.error-box{
  background:#ffe6e6;
  color:#cc0000;
  padding:10px;
  border-radius:8px;
  margin-bottom:10px;
  text-align:center;
}

.success-box{
  background:#e6ffe6;
  color:#008000;
  padding:10px;
  border-radius:8px;
  margin-bottom:10px;
  text-align:center;
}

.footer-text{
  text-align:center;
  margin-top:15px;
  font-size:13px;
  color:var(--muted);
}

.footer-text a{
  color:var(--accent);
  text-decoration:none;
}
</style>
</head>

<body>

<div class="register-card">

<h2>Create Account</h2>

<% if(error != null) { %>
<div class="error-box"><%= error %></div>
<% } %>

<% if(success != null) { %>
<div class="success-box"><%= success %></div>
<% } %>

<form action="RegisterServlet" method="post">

<input type="text" name="name" placeholder="Full Name" required>
<input type="text" name="username" placeholder="Username" required>
<input type="email" name="email" placeholder="Email" required>
<input type="text" name="phone" placeholder="Phone Number" required>
<input type="text" name="address" placeholder="Address" required>
<input type="password" name="password" placeholder="Password" required>
<input type="password" name="confirmPassword" placeholder="Confirm Password" required>

<button type="submit">Register</button>

</form>

<div class="footer-text">
Already have an account?
<a href="Login.jsp">Login</a>
</div>

</div>

</body>
</html>