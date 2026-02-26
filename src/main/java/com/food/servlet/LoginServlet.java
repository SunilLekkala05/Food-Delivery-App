package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimp.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	  private UserDAO userDAO;

	    @Override
	    public void init() {
	        userDAO = new UserDAOImpl();
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        User user = userDAO.getUserByUsernameAndPassword(username, password);

	        if (user != null) {

	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);

	            response.sendRedirect("home"); // or HomeServlet mapping

	        } else {

	            request.setAttribute("errorMessage",
	                "Incorrect user id or password, please check.");

	            request.getRequestDispatcher("Login.jsp")
	                   .forward(request, response);
	        }
	    }
}
