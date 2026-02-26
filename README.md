# 🍽️ Food Delivery Web Application

A full-stack dynamic web application developed using Java, JSP, Servlets, JDBC, and MySQL.  
The application allows users to browse restaurants, add items to cart, place orders, and view order history.

---

## 🛠 Technologies Used

- Java (OOP Concepts)
- JSP & Servlets
- JDBC
- MySQL
- Apache Tomcat 10
- HTML & CSS

---

## 🏗 Project Architecture

The project follows a layered architecture:

### 1️⃣ Model Layer (`com.food.model`)
- User
- Restaurant
- Menu
- Cart
- Order
- OrderItem

### 2️⃣ DAO Layer (`com.food.dao`)
- UserDAO
- RestaurantDAO
- MenuDAO
- OrderDAO
- OrderItemDAO

### 3️⃣ DAO Implementation Layer (`com.food.daoimp`)
- UserDAOImpl
- RestaurantDAOImpl
- MenuDAOImpl
- OrderDAOImpl
- OrderItemDAOImpl

### 4️⃣ Controller Layer (`com.food.servlet`)
- HomeServlet
- LoginServlet
- RegisterServlet
- MenuServlet
- CartServlet
- CheckoutServlet
- OrderHistoryServlet

### 5️⃣ Utility & Configuration
- DBConnection.java
- AppContextListener.java
- web.xml

---

## ✨ Features

- 🔐 User Registration & Login
- 🏬 Browse Restaurants
- 🍛 View Menu Items
- 🛒 Add to Cart / Update Quantity
- 💳 Checkout & Place Order
- 📜 View Order History
- 🗄️ Database-driven dynamic content

---

## 🗂 Database Structure

Database: `food_delivery_db`

Tables:
- user
- restaurant
- menu
- orders
- order_item

SQL files are available inside:
