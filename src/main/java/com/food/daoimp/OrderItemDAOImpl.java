package com.food.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

	private static final String INSERT_QUERY =
		"INSERT INTO order_item (orderId, menuId, quantity, totalPrice) VALUES (?, ?, ?, ?)";

	private static final String GET_QUERY =
		"SELECT * FROM order_item WHERE orderItemId = ?";

	private static final String UPDATE_QUERY =
		"UPDATE order_item SET orderId=?, menuId=?, quantity=?, totalPrice=? WHERE orderItemId=?";

	private static final String DELETE_QUERY =
		"DELETE FROM order_item WHERE orderItemId = ?";

	private static final String GET_ALL_QUERY =
		"SELECT * FROM order_item";

	@Override
	public void addOrderItem(OrderItem orderItem) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {

			ps.setInt(1, orderItem.getOrderId());
			ps.setInt(2, orderItem.getMenuId());
			ps.setInt(3, orderItem.getQuantity());
			ps.setDouble(4, orderItem.getTotalPrice());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {

		OrderItem orderItem = null;

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(GET_QUERY)) {

			ps.setInt(1, orderItemId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				orderItem = extractOrderItem(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItem;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY)) {

			ps.setInt(1, orderItem.getOrderId());
			ps.setInt(2, orderItem.getMenuId());
			ps.setInt(3, orderItem.getQuantity());
			ps.setDouble(4, orderItem.getTotalPrice());
			ps.setInt(5, orderItem.getOrderItemId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(DELETE_QUERY)) {

			ps.setInt(1, orderItemId);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		List<OrderItem> list = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection();
			 Statement stmt = conn.createStatement()) {

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {
				list.add(extractOrderItem(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	private OrderItem extractOrderItem(ResultSet rs) throws SQLException {

		return new OrderItem(
				rs.getInt("orderItemId"),
				rs.getInt("orderId"),
				rs.getInt("menuId"),
				rs.getInt("quantity"),
				rs.getDouble("totalPrice")
		);
	}
}
