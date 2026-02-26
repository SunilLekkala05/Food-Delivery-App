<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.food.model.Restaurant" %>
    <!doctype html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FoodExpress - Restaurants</title>

    <style>
      :root {
        --bg: #f6f7fb;
        --card: #ffffff;
        --muted: #6b7280;
        --accent: #ff6b35;
        --shadow: 0 6px 18px rgba(16, 24, 40, 0.08);
        --radius: 14px;
        font-family:
          Inter,
          system-ui,
          -apple-system,
          "Segoe UI",
          Roboto,
          Arial;
      }

      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        background: linear-gradient(180deg, var(--bg), #fff);
        padding: 40px 24px;
        color: #111827;
      }

      /* Header */
      header {
        max-width: 1200px;
        margin: 0 auto 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-weight: bold;
      }
      .nav a {
  text-decoration: none;
  color: var(--muted);
  font-weight: 500;
  transition: 0.2s;
}

.nav a:hover {
  color: var(--accent);
}

      .logo {
        font-size: 30px;
        font-weight: 700;
        color: var(--accent);
      }

      .nav {
        display: flex;
        gap: 25px;
        font-size: 14px;
        color: var(--muted);
        cursor: pointer;
      }

      /* Search Bar */
      .search-container {
        max-width: 1200px;
        margin: 0 auto 30px;
        text-align: center;
      }

      .search-container input {
        width: 60%;
        padding: 12px 16px;
        border-radius: 10px;
        border: 1px solid #ddd;
        font-size: 14px;
        margin-bottom: 15px;
      }

      /* Grid */
      .grid {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 20px;
      }

      .card {
        background: var(--card);
        border-radius: var(--radius);
        box-shadow: var(--shadow);
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transition: 0.2s ease;
      }

      .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 18px 40px rgba(16, 24, 40, 0.12);
      }

      .media {
        position: relative;
        height: 160px;
      }

      .media img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .badge-container {
        position: absolute;
        left: 12px;
        top: 12px;
        display: flex;
        gap: 8px;
      }

      .badge {
        background: rgba(0, 0, 0, 0.6);
        color: #fff;
        padding: 6px 8px;
        border-radius: 10px;
        font-size: 12px;
      }

      .eta {
        background: var(--accent);
      }

      .card-body {
        padding: 14px 16px 18px;
        display: flex;
        flex-direction: column;
        gap: 10px;
      }

      .name {
        font-weight: 600;
        font-size: 16px;
      }

      .desc {
        font-size: 13px;
        color: #374151;
      }

      .address {
        font-size: 13px;
        color: var(--muted);
      }

 .cta {
  display: block;              /* Make it block */
  text-align: center;          /* Center text */
  margin: 15px auto 0 auto;    /* Auto left & right margin centers */
  padding: 10px 18px;
  border-radius: 8px;
  border: none;
  background: var(--accent);
  color: white;
  font-weight: 600;
  cursor: pointer;
  width: 70%;
  text-decoration: none;       /* Remove underline */
  transition: 0.3s ease;
}

.cta:hover {
  background: #e85c28;
  transform: scale(1.05);
}


/* Footer */
.footer {
  background: var(--dark-color);
  color: var(--white);
  padding: 3rem 2rem 1rem;
}
.footer_content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.footer_section h3 {
  margin-bottom: 1rem;
  color: var(--secondary-color);
}

.footer_section ul {
  list-style: none;
}

.footer_section ul li {
  margin-bottom: 0.5rem;
}
.footer_section ul li a {
  color: var(--light-gray);
  text-decoration: none;
  transition: color 0.3s;
}
.footer_section ul li a:hover {
  color: var(--white);
}



#bottom {
  text-align: center;
  padding-top: 2rem;
  padding-bottom: 2rem;
  border-top: 1px solid var(--gray);
  color: var(--light-gray);
}

    </style>
  </head>

  <body>
    <!-- Header -->
    <header>
      <div class="logo">FoodExpress</div>
      <div class="nav">
      
      <a href="#">Offers</a>
      <a href="Cart.jsp">Cart</a>
      <a href="Login.jsp">Login</a>
      <a href="Register.jsp">Register</a>
       
      </div>
    </header>

    <!-- Search Bar -->
    <div class="search-container">
      <input type="text" placeholder="Search for restaurants or cuisines..." />
 <h2>Restaurants near you</h2>   
    </div>

    <!-- Restaurant Grid -->
    
    
    <main class="grid">
      <!-- 1 -->
      
      <% 
  	List<Restaurant> resturants = (List<Restaurant>)request.getAttribute("resturants");
    		  
          	for(Restaurant r : resturants)
          	{
      %>
      <article class="card">
        <div class="media">
          <img
            src="<%= r.getImagePath() %>"
            alt="<%= r.getName() %>"
          />
          <div class="badge-container">
            <div class="badge"><%= r.getRating() %> ★</div>
            <div class="badge eta"><%= r.getEta() %>mins</div>
          </div>
        </div>
        <div class="card-body">
          <div class="name"> <%= r.getName() %> </div>
          <div class="desc"> <%= r.getCuisineType() %> </div>
          <div class="address"> <%= r.getAddress() %> </div>
			<a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="cta">
 			  View Menu
				</a>
        </div>
      </article>
      <%
      }
      %>

    </main>
    
    
    <!--App_details-->
    <footer class="footer" id="contact">
      <div class="container">
        <div class="footer_content">
          <div class="footer_section">
            <h3>FoodBox</h3>
            <p>
              your favorite food delivery app brings mouthwatering meals,
              bursting with flavor, right to your doorstep. Savor convenience,
              taste, and happiness in every order!
            </p>
          </div>
          <div class="footer_section">
            <h3>Quick Links</h3>
            <ul>
              <li><a href="#restaurants">Restaurants</a></li>
              <li><a href="#menu">Menu</a></li>
              <li><a href="#offers">Offers</a></li>
              <li><a href="#contact">Contant</a></li>
            </ul>
          </div>
          <div class="footer_section">
            <h3>Support</h3>
            <ul>
              <li><a href="0">Help Center</a></li>
              <li><a href="0">Track Order</a></li>
              <li><a href="0">Refund Policy</a></li>
              <li><a href="0">Terms & Conditions</a></li>
            </ul>
          </div>
          <div class="footer_section">
            <h3>Contact Info</h3>
            <p>
              📞 +91 955XX XXXXX
            </p>
            <p>
              📧 supportfoodbox@gmail.com
            </p>
            <p>
              📍 1-24 old street, Nellore 524006
            </p>
          </div>
        </div>
        <hr>
        <div class="footer_bottom">
          <p id="bottom">&copy; 2020 FoodBox. All rights reserved</p>
        </div>
      </div>
    </footer>
  </body>
</html>
    
