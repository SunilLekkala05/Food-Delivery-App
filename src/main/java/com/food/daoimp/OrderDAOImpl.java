package com.food.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.Order;
import com.food.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {
	
	private static final String INSERT_QUERY =
		"INSERT INTO orders (userId, restaurantId, orderDate, totalAmount, status, paymentMode) VALUES (?, ?, ?, ?, ?, ?)";

	private static final String GET_QUERY =
		"SELECT * FROM orders WHERE orderId = ?";

	private static final String UPDATE_QUERY =
		"UPDATE orders SET userId=?, restaurantId=?, orderDate=?, totalAmount=?, status=?, paymentMode=? WHERE orderId=?";

	private static final String DELETE_QUERY =
		"DELETE FROM orders WHERE orderId = ?";

	private static final String GET_ALL_QUERY =
		"SELECT * FROM orders";
	
	private static final String GET_BY_USER =
		    "SELECT * FROM orders WHERE userId = ? ORDER BY orderDate DESC";

	@Override
	public int addOrder(Order order) {

		int orderId = 0;
		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, order.getUserId());
			ps.setInt(2, order.getRestaurantId());
			ps.setTimestamp(3, new Timestamp(order.getOrderDate().getTime()));
			ps.setDouble(4, order.getTotalAmount());
			ps.setString(5, order.getStatus());
			ps.setString(6, order.getPaymentMode());

			int affectRows = ps.executeUpdate();
			if(affectRows == 0) {
				throw new SQLException("Creating order failed, no rows affected.");
					
			}
			
			ResultSet generatedKeys = ps.getGeneratedKeys();
			
			while (generatedKeys.next()) {
				orderId = generatedKeys.getInt(1);
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("Error adding order", e);
		}
		
		return orderId;
	}

	@Override
	public Order getOrder(int orderId) {

		Order order = null;

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(GET_QUERY)) {

			ps.setInt(1, orderId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				order = extractOrder(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public void updateOrder(Order order) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY)) {

			ps.setInt(1, order.getUserId());
			ps.setInt(2, order.getRestaurantId());
			ps.setTimestamp(3, new Timestamp(order.getOrderDate().getTime()));
			ps.setDouble(4, order.getTotalAmount());
			ps.setString(5, order.getStatus());
			ps.setString(6, order.getPaymentMode());
			ps.setInt(7, order.getOrderId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(DELETE_QUERY)) {

			ps.setInt(1, orderId);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Order> getAllOrders() {

		List<Order> list = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection();
			 Statement stmt = conn.createStatement()) {

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {
				list.add(extractOrder(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	private Order extractOrder(ResultSet rs) throws SQLException {

		return new Order(
				rs.getInt("orderId"),
				rs.getInt("userId"),
				rs.getInt("restaurantId"),
				rs.getTimestamp("orderDate"),
				rs.getDouble("totalAmount"),
				rs.getString("status"),
				rs.getString("paymentMode")
		);
	}
	
	@Override
	public List<Order> getOrdersByUser(int userId) {

	    List<Order> list = new ArrayList<>();

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(GET_BY_USER)) {

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            list.add(extractOrder(rs));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
}
