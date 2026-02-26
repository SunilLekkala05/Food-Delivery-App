<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String error = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - FoodExpress</title>

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

/* Card */
.login-card{
  width:380px;
  background:var(--card);
  padding:35px;
  border-radius:var(--radius);
  box-shadow:var(--shadow);
}

h2{
  text-align:center;
  color:var(--accent);
  margin-bottom:25px;
}

/* Inputs */
input{
  width:100%;
  padding:12px;
  margin-bottom:15px;
  border-radius:8px;
  border:1px solid #d1d5db;
  font-size:14px;
  outline:none;
  transition:0.2s;
}

input:focus{
  border-color:var(--accent);
  box-shadow:0 0 0 2px rgba(255,107,53,0.2);
}

/* Button */
button{
  width:100%;
  padding:12px;
  border:none;
  border-radius:8px;
  background:var(--accent);
  color:white;
  font-weight:600;
  cursor:pointer;
  transition:0.2s;
}

button:hover{
  background:#e85c28;
}

/* Error Message */
.error-box{
  background:#ffe6e6;
  color:#cc0000;
  padding:10px;
  border-radius:8px;
  margin-bottom:15px;
  font-size:14px;
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

.footer-text a:hover{
  text-decoration:underline;
}

</style>
</head>

<body>

<div class="login-card">

    <h2>FoodExpress Login</h2>

    <% if(error != null) { %>
        <div class="error-box">
            <%= error %>
        </div>
    <% } %>

    <form action="LoginServlet" method="post">

        <input type="text" 
               name="username" 
               placeholder="Enter Username" 
               required>

        <input type="password" 
               name="password" 
               placeholder="Enter Password" 
               required>

        <button type="submit">Login</button>

    </form>

    <div class="footer-text">
        Don’t have an account? 
        <a href="Register.jsp">Register</a>
    </div>

</div>

</body>
</html>