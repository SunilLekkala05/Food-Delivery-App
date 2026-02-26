<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.food.model.Cart" %>
<%@ page import="com.food.model.CartItem" %>
<%@ page import="java.util.Map" %>

<%
Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f5f5f5;
    margin: 0;
}

h2 {
    text-align: center;
    margin-top: 30px;
    font-size: 28px;
    color: #ff6b35;
}

.container {
    width: 50%;
    margin: 40px auto;
}

.cart-item {
    background: white;
    padding: 14px;
    margin-bottom: 12px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
} 
.item-name {
    margin: 0 0 8px 0;
    font-size: 18px;
}

.price {
    margin: 0 0 10px 0;
    color: #555;
}

.total-qty-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.quantity-controls {
    display: flex;
    align-items: center;
    gap: 8px;
}

.quantity-btn {
    padding: 4px 10px;
    font-size: 16px;
    border: none;
    background-color: #ff6b35;
    color: white;
    border-radius: 6px;
    cursor: pointer;
}

.quantity-btn:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

.qty-number {
    font-weight: 600;
}

.remove-row {
    display: flex;
    justify-content: flex-end;
    margin-top: 10px;
}

.remove-btn {
    padding: 6px 12px;
    border: none;
    background-color: #e63946;
    color: white;
    border-radius: 6px;
    cursor: pointer;
}

.total-section {
    display: flex;
    justify-content: flex-end;
    font-size: 20px;
    font-weight: bold;
    margin-top: 25px;
}

.add-more-items,
.checkout-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

.add-more-items a,
.proceed-to-checkout-btn {
    width: 220px;
    text-align: center;
    padding: 12px 0;
    background: #ff6b35;
    color: white;
    text-decoration: none;
    border: none;
    border-radius: 10px;
    font-weight: 600;
    font-size: 15px;
    cursor: pointer;
    transition: 0.2s ease;
}

.proceed-to-checkout-btn {
 width: 300px;
}

.add-more-items a:hover,
.proceed-to-checkout-btn:hover {
    background: #e85c28;
}

</style>
</head>

<body>


<h2>Your Cart</h2>
<div class="container">
<%
		Cart cart1 = (Cart) session.getAttribute("cart");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");
		
		if(cart1 != null && !cart1.getItems().isEmpty()) {
			for(CartItem item : cart1.getItems().values()) {
%>

<div class="cart-item">

    <h3 class="item-name"><%= item.getItemName() %></h3>

    <p class="price">Price: ₹<%= item.getPrice() %></p>

    <!-- Total + Quantity Row -->
    <div class="total-qty-row">

        <div class="total">
            Total: ₹<%= item.getTotalPrice() %>
        </div>

        <div class="quantity-controls">

            <!-- Increase -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                <button type="submit" class="quantity-btn">+</button>
            </form>

            <span class="qty-number">
                <%= item.getQuantity() %>
            </span>

            <!-- Decrease -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <button type="submit" class="quantity-btn"
                    <%= item.getQuantity() == 1 ? "disabled" : "" %>>
                    -
                </button>
            </form>

        </div>
    </div>

    <!-- Remove Button -->
    <div class="remove-row">
        <form action="cart" method="post">
            <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
            <input type="hidden" name="action" value="remove">
            <button type="submit" class="remove-btn">Remove</button>
        </form>
    </div>

</div>


<%
}
%>

<div class="total-section">
    Grand Total: ₹ <%= cart1.getTotalAmount() %>
</div>

<div class="add-more-items">
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" 
       class="btn add-more-btn">
       Add More Items
    </a>
</div>

<%
} else {
%>

<p style="text-align: center; color: #757575;">
    Your cart is empty 🛒
</p>

<div class="add-more-items">
    <a href="home" 
       class="btn add-more-btn">
       Add Items
    </a>
</div>

<%
}
%>

<% if (cart1 != null && !cart1.getItems().isEmpty()) { %>

<div class="checkout-wrapper">
    <form action="CheckOut.jsp" method="post">
        <input type="submit"
               value="Proceed to Checkout"
               class="proceed-to-checkout-btn">
    </form>
</div>

<% } %>

</div>

</body>
</html>