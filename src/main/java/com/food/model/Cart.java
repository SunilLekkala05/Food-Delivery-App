package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	

	  private Map<Integer, CartItem> cart;

	    public Cart() {
	        this.cart = new HashMap<>();
	    }

	    // Add item
	    public void addCartItem(CartItem item) {

	        if (cart.containsKey(item.getMenuId())) {
	            CartItem existing = cart.get(item.getMenuId());
	            existing.setQuantity(existing.getQuantity() + item.getQuantity());
	        } else {
	            cart.put(item.getMenuId(), item);
	        }
	    }
	    
	    

	    // Update quantity
	    public void updateCartItem(int menuId, int quantity) {

	        if (cart.containsKey(menuId)) {
	        	if(quantity <= 0) {
	        		cart.remove(menuId);
	        	} else {
	            cart.get(menuId).setQuantity(quantity);
	        	}
	        }
	    }
	    
	    
	    

	    // Remove item
	    public void removeCartItem(int menuId) {
	        cart.remove(menuId);
	    }
	    
	    

	    // Get all items
	    public Map<Integer, CartItem> getItems() {
	        return cart;
	    }

	    // Get total cart price
	    public double getTotalAmount() {
	        double total = 0;
	        for (CartItem item : cart.values()) {
	            total += item.getTotalPrice();
	        }
	        return total;
	    }
	    
	    public void clear() {
			
	    	cart.clear();
		}

}
