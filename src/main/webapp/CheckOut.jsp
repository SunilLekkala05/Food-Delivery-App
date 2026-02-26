<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!doctype html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Checkout - FoodExpress</title>

    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 0;
      }

      .checkout-container {
        width: 500px;
        margin: 60px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      }

      h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
      }

      label {
        font-weight: bold;
        display: block;
        margin-bottom: 8px;
        margin-top: 15px;
      }

      textarea {
        width: 100%;
        height: 80px;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        resize: none;
      }

      .payment-options {
        margin-top: 10px;
      }

      .payment-options label {
        font-weight: normal;
        display: block;
        margin-bottom: 8px;
        cursor: pointer;
      }

      .place-order-btn {
        width: 100%;
        margin-top: 25px;
        padding: 12px;
        background-color: #ff5722;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
      }

      .place-order-btn:hover {
        background-color: #e64a19;
      }
    </style>
  </head>
  <body>
    <div class="checkout-container">
      <h2>Checkout</h2>

      <form action="PlaceOrderServlet" method="post">
        <!-- Delivery Address -->
        <label for="address">Delivery Address</label>
        <textarea
          name="address"
          id="address"
          placeholder="Enter your full delivery address"
          required
        ></textarea>

        <!-- Payment Method -->
        <label>Payment Method</label>
        <div class="payment-options">
          <label
            ><input
              type="radio"
              name="paymentMethod"
              value="Credit Card"
              required
            />
            Credit Card</label
          >
          <label
            ><input type="radio" name="paymentMethod" value="Debit Card" />
            Debit Card</label
          >
          <label
            ><input type="radio" name="paymentMethod" value="UPI" /> UPI</label
          >
          <label
            ><input
              type="radio"
              name="paymentMethod"
              value="Cash on Delivery"
            />
            Cash on Delivery</label
          >
          <label
            ><input type="radio" name="paymentMethod" value="Others" />
            Others</label
          >
        </div>

        <!-- Place Order Button -->
        <button type="submit" class="place-order-btn">Place Order</button>
      </form>
    </div>
  </body>
</html>
    