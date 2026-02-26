package com.food.servlet;

import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.daoimp.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
			
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);		
		}
		
		String action = request.getParameter("action");
		
		if ("add".equals(action)) {
			int newRestaurantId = Integer.parseInt(request.getParameter("restaurantId"));
	        Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

	        if (currentRestaurantId == null || newRestaurantId != currentRestaurantId) {
	            cart = new Cart();
	            session.setAttribute("cart", cart);
	            session.setAttribute("restaurantId", newRestaurantId);
	        }
			addItemToCart(request, cart);
		}
		else if("update".equals(action)) {
			updateCartItem(request, cart);
		} 
		else if("remove".equals(action)) {
			removeItemFromCart(request, cart);
		}
		
	
		
		response.sendRedirect("Cart.jsp");
	}
	
	

	private void removeItemFromCart(HttpServletRequest request, Cart cart) {

		int itemId = Integer.parseInt(request.getParameter("itemId"));
		cart.removeCartItem(itemId);
		
	}

	private void updateCartItem(HttpServletRequest request, Cart cart) {
		
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		cart.updateCartItem(itemId, quantity);
		
	}

	private void addItemToCart(HttpServletRequest request, Cart cart) {
		
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		MenuDAO menuDAO = new MenuDAOImpl();
		Menu menuItem = menuDAO.getMenu(itemId);
		
		System.out.println("The menu in Cart Servlet"+menuItem);
		
		if(menuItem != null) {
			CartItem item = new CartItem(
					menuItem.getMenuId(),
					menuItem.getRestaurantId(),
					menuItem.getItemName(),
					quantity,
					menuItem.getPrice()
					);
			
			cart.addCartItem(item);
		}
		
	}	

}
