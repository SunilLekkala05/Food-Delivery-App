<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.food.model.Order" %>
<%
    Order order = (Order) session.getAttribute("order");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order Successful</title>
</head>
<body style="font-family:Arial; text-align:center; margin-top:100px;">

    <h1 style="color:green;">🎉 Order Placed Successfully!</h1>

    <% if(order != null) { %>
        <p><strong>Order ID:</strong> <%= order.getOrderId() %></p>
        <p><strong>Total Amount:</strong> ₹<%= order.getTotalAmount() %></p>
        <p><strong>Status:</strong> <%= order.getStatus() %></p>
    <% } else { %>
        <p>No order details available.</p>
    <% } %>

    <br><br>

    <a href="home">🏠 Back to Home</a>
    <br><br>
    <a href="OrderHistoryServlet">📜 View Order History</a>

</body>
</html>