<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.List, com.food.model.Order" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
</head>
<body style="font-family:Arial; margin:40px;">

<h2>Your Order History</h2>

<% if (orders != null && !orders.isEmpty()) {
    for(Order o : orders) {
%>

<div style="border:1px solid #ccc; padding:15px; margin-bottom:10px;">
    <p><strong>Order ID:</strong> <%= o.getOrderId() %></p>
    <p><strong>Date:</strong> <%= o.getOrderDate() %></p>
    <p><strong>Total:</strong> ₹<%= o.getTotalAmount() %></p>
    <p><strong>Status:</strong> <%= o.getStatus() %></p>
</div>

<%
    }
} else {
%>

<p>No orders found.</p>

<%
}
%>

<br>
<a href="home">🏠 Back to Home</a>

</body>
</html>