package com.food.servlet;

import java.io.IOException;
import java.util.Date;

import com.food.dao.OrderDAO;
import com.food.daoimp.OrderDAOImpl;
import com.food.daoimp.OrderItemDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class CheckoutServlet extends HttpServlet{
	
	private OrderDAO orderDAO;
	OrderItemDAOImpl orderItemDAOImpl;
	
	@Override
	public void init() {
		
		orderDAO = new OrderDAOImpl();
		
		orderItemDAOImpl = new OrderItemDAOImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		
		if (cart != null && user != null && !cart.getItems().isEmpty()) {
			//Extract form data
			String paymentMethod = req.getParameter("paymentMethod");
			String address = req.getParameter("address");
			
			//Create and populate order object
			Order order = new Order();
			
			order.setUserId(user.getUserId());
			order.setRestaurantId((int) session.getAttribute("restaurantId"));
			order.setOrderDate(new Date());
			order.setPaymentMode(paymentMethod);
			order.setDeliveryAddress(address);
			order.setStatus("Pending");
			
			// Calculate total amount
			double totalAmount = 0;
			for (CartItem item : cart.getItems().values()) {
				totalAmount += item.getPrice() * item.getQuantity();
			}
			
			order.setTotalAmount(totalAmount);
			
			int orderId = orderDAO.addOrder(order);
			order.setOrderId(orderId);
			
			for (CartItem item : cart.getItems().values()) {
				
				int itemId = item.getMenuId();
			//	String name = item.getItemName();
				double price = item.getPrice();
				int quantity = item.getQuantity();	
				double totalPrice = item.getTotalPrice();
				
				OrderItem orderItem = new OrderItem(orderId, itemId, quantity, totalPrice);
				
				orderItemDAOImpl.addOrderItem(orderItem);
			}
			
			session.removeAttribute("cart");
			session.setAttribute("order", order);
			resp.sendRedirect("OrderSuccess.jsp");
					
		} else {
			resp.sendRedirect("Cart.jsp");
		}
		
	}
	

}
