package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.daoimp.OrderDAOImpl;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet  extends HttpServlet{
	

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 🔒 Login validation
        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        List<Order> orders = orderDAO.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("OrderHistory.jsp")
               .forward(request, response);
    }

}
