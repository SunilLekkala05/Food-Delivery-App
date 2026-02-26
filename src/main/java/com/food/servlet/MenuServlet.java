package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimp.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("MenuServlet Called");
		
		int rid = Integer.parseInt(req.getParameter("restaurantId"));
		
		MenuDAOImpl daoImpl = new MenuDAOImpl();
		
		List<Menu> menuList = daoImpl.getMenuByRestaurant(rid);
		
		req.setAttribute("menus", menuList);
		
		RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, resp);
		
		
		
	}
}
