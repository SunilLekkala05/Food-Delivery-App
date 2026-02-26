package com.food.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT_QUERY =
			"INSERT INTO restaurant (name, address, phone, rating, cuisineType, isActive, eta, adminUserId, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		private static final String GET_QUERY =
			"SELECT * FROM restaurant WHERE restaurantId = ?";

		private static final String UPDATE_QUERY =
			"UPDATE restaurant SET name=?, address=?, phone=?, rating=?, cuisineType=?, isActive=?, eta=?, adminUserId=?, imagePath=? WHERE restaurantId=?";

		private static final String DELETE_QUERY =
			"DELETE FROM restaurant WHERE restaurantId = ?";

		private static final String GET_ALL_QUERY =
			"SELECT * FROM restaurant";

		public void addRestaurant(Restaurant restaurant) {

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {

				ps.setString(1, restaurant.getName());
				ps.setString(2, restaurant.getAddress());
				ps.setString(3, restaurant.getPhone());
				ps.setDouble(4, restaurant.getRating());
				ps.setString(5, restaurant.getCuisineType());
				ps.setBoolean(6, restaurant.isActive());
				ps.setInt(7, restaurant.getEta());
				ps.setInt(8, restaurant.getAdminUserId());
				ps.setString(9, restaurant.getImagePath());

				ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		@Override
		public Restaurant getRestaurant(int restaurantId) {

			Restaurant restaurant = null;

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement ps = conn.prepareStatement(GET_QUERY)) {

				ps.setInt(1, restaurantId);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					restaurant = extractRestaurant(rs);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return restaurant;
		}

		@Override
		public void updateRestaurant(Restaurant restaurant) {

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY)) {

				ps.setString(1, restaurant.getName());
				ps.setString(2, restaurant.getAddress());
				ps.setString(3, restaurant.getPhone());
				ps.setDouble(4, restaurant.getRating());
				ps.setString(5, restaurant.getCuisineType());
				ps.setBoolean(6, restaurant.isActive());
				ps.setInt(7, restaurant.getEta());
				ps.setInt(8, restaurant.getAdminUserId());
				ps.setString(9, restaurant.getImagePath());
				ps.setInt(10, restaurant.getRestaurantId());

				ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void deleteRestaurant(int restaurantId) {

			try (Connection conn = DBConnection.getConnection();
				 PreparedStatement ps = conn.prepareStatement(DELETE_QUERY)) {

				ps.setInt(1, restaurantId);
				ps.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		@Override
		public List<Restaurant> getAllRestaurants() {

			List<Restaurant> list = new ArrayList<>();

			try (Connection conn = DBConnection.getConnection();
				 Statement stmt = conn.createStatement()) {

				ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

				while (rs.next()) {
					list.add(extractRestaurant(rs));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}

		private Restaurant extractRestaurant(ResultSet rs) throws SQLException {

			return new Restaurant(
					rs.getInt("restaurantId"),
					rs.getString("name"),
					rs.getString("address"),
					rs.getString("phone"),
					rs.getDouble("rating"),
					rs.getString("cuisineType"),
					rs.getBoolean("isActive"),
					rs.getInt("eta"),
					rs.getInt("adminUserId"),
					rs.getString("imagePath")
			);
		}
		
		
}
