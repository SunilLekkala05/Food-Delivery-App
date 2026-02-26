package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimp.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{

	 private UserDAO userDAO;

	    @Override
	    public void init() {
	        userDAO = new UserDAOImpl();
	    }

	    @Override
	    protected void doPost(HttpServletRequest request,
	                          HttpServletResponse response)
	            throws ServletException, IOException {

	        String name = request.getParameter("name");
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("confirmPassword");

	        if (!password.equals(confirmPassword)) {

	            request.setAttribute("errorMessage",
	                "Passwords do not match!");

	            request.getRequestDispatcher("Register.jsp")
	                   .forward(request, response);
	            return;
	        }

	        User user = new User();
	        user.setName(name);
	        user.setUsername(username);
	        user.setEmail(email);
	        user.setPhone(phone);
	        user.setAddress(address);
	        user.setPassword(password);
	        user.setRole("USER");

	        userDAO.addUser(user);

	        request.setAttribute("successMessage",
	            "Registration successful! Please login.");

	        request.getRequestDispatcher("Register.jsp")
	               .forward(request, response);
	    }
}
