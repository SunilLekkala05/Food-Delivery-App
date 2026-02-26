<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List, com.food.model.Menu"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu List</title>
<style>
:root {
  --bg:#f6f7fb;
  --card:#ffffff;
  --muted:#6b7280;
  --accent:#ff6b35;
  --shadow: 0 6px 18px rgba(16,24,40,0.08);
  --radius:14px;
  font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, Arial;
}

*{
  box-sizing:border-box;
}

body{
  margin:0;
  padding:40px 24px;
  background:linear-gradient(180deg,var(--bg),#fff);
}

/* Heading */
.menu-title{
  text-align:center;
  font-size:28px;
  font-weight:700;
  margin-bottom:35px;
  color:var(--accent);
}

/* Grid */
.grid{
  max-width:1100px;
  margin:0 auto;
  display:grid;
  grid-template-columns:repeat(auto-fill,minmax(260px,1fr));
  gap:22px;
}

/* Card */
.card{
  background:var(--card);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  overflow:hidden;
  transition:0.25s ease;
  display:flex;
  flex-direction:column;
}

.card:hover{
  transform:translateY(-6px);
  box-shadow:0 18px 40px rgba(16,24,40,0.12);
}

/* Image */
.media{
  height:170px;
}

.media img{
  width:100%;
  height:100%;
  object-fit:cover;
}

/* Body */
.card-body{
  padding:15px;
  display:flex;
  flex-direction:column;
  gap:10px;
  flex:1;
}

.item-name{
  font-size:16px;
  font-weight:600;
}

.desc{
  font-size:13px;
  color:#374151;
  line-height:1.4;
}

/* Price + Rating Row */
.price-rating{
  display:flex;
  justify-content:space-between;
  align-items:center;
  margin-top:5px;
}

.price{
  font-weight:600;
  color:green;
}

.rating{
  font-size:13px;
  color:var(--muted);
}

/* Cart Controls Row */
.cart-controls{
  display:flex;
  justify-content:space-between;
  align-items:center;
  gap:12px;
  margin-top:10px;
}

/* Quantity Input */
.qty-input{
  width:70px;
  padding:8px;
  border-radius:6px;
  border:1px solid #d1d5db;
  text-align:center;
  font-weight:600;
}

/* Add to Cart Button */
.add-btn{
 flex:1;
  padding:9px;
  border-radius:8px;
  border:none;
  background:var(--accent);
  color:white;
  font-weight:600;
  cursor:pointer;
  transition:0.2s;
}

.add-btn:hover{
  background:#e85c28;
}
</style>
</head>
<body>

<div class="menu-title">Menu</div>

<div class="grid">

	<%
		List<Menu> menuList = (List<Menu>)request.getAttribute("menus");
		if (menuList != null && !menuList.isEmpty()) {
		for(Menu menuItem : menuList){
	%>
  <!-- Menu Item -->
  <div class="card">
    <div class="media">
      <img src="<%= menuItem.getImagePath() %>" alt="<%= menuItem.getItemName() %>">
    </div>
    <div class="card-body">
      <div class="item-name"><%= menuItem.getItemName() %></div>
      <div class="desc"><%= menuItem.getDescription() %></div>

      <div class="price-rating">
        <div class="price">Price: ₹<%= menuItem.getPrice() %></div>
        <div class="rating">⭐<%= menuItem.getRatings() %></div>
      </div>

<form action="cart" method="post" class="cart-form">

    <input type="hidden" name="restaurantId" 
           value="<%= request.getParameter("restaurantId") %>">

    <input type="hidden" name="itemId" 
           value="<%= menuItem.getMenuId() %>">

    <input type="hidden" name="action" value="add">

    <div class="cart-controls">
        <input type="number" 
               name="quantity" 
               value="1" 
               min="1" 
               class="qty-input">

        <button type="submit" class="add-btn">
            ADD TO CART
        </button>
    </div>

</form>

    </div>
  </div>

	<%
	}
		} else {
	%>
	<p style="text-align: center; color: #757575;">No menu items available. Please check back..</p>
	
	<%
	}
	%>
</div>


</body>
</html>