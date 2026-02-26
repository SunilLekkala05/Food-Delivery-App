package com.food.model;

public class CartItem {

	   private int menuId;
	    private int restaurantId;
	    private String itemName;
	    private int quantity;
	    private double price;

	    public CartItem(int menuId, int restaurantId, String itemName, int quantity, double price) {
	        this.menuId = menuId;
	        this.restaurantId = restaurantId;
	        this.itemName = itemName;
	        this.quantity = quantity;
	        this.price = price;
	    }

	    public int getMenuId() {
	        return menuId;
	    }

	    public int getRestaurantId() {
	        return restaurantId;
	    }

	    public String getItemName() {
	        return itemName;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public double getPrice() {
	        return price;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    // ✅ IMPORTANT (for your earlier error)
	    public double getTotalPrice() {
	        return price * quantity;
	    }
}
