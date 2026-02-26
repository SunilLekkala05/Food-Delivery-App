package com.food.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{


	private static final String INSERT_QUERY =
		"INSERT INTO menu (restaurantId, itemName, description, price, ratings, isAvailable, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?)";

	private static final String GET_QUERY =
		"SELECT * FROM menu WHERE menuId = ?";

	private static final String UPDATE_QUERY =
		"UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, ratings=?, isAvailable=?, imagePath=? WHERE menuId=?";

	private static final String DELETE_QUERY =
		"DELETE FROM menu WHERE menuId = ?";

	private static final String GET_ALL_QUERY =
		"SELECT * FROM menu";

	private static final String GET_BY_RESTAURANT_QUERY =
		    "SELECT * FROM menu WHERE restaurantId = ?";
	
	@Override
	public void addMenu(Menu menu) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {

			ps.setInt(1, menu.getRestaurantId());
			ps.setString(2, menu.getItemName());
			ps.setString(3, menu.getDescription());
			ps.setDouble(4, menu.getPrice());
			ps.setDouble(5, menu.getRatings());
			ps.setBoolean(6, menu.isAvailable());
			ps.setString(7, menu.getImagePath());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {

		Menu menu = null;

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(GET_QUERY)) {

			ps.setInt(1, menuId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				menu = extractMenu(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}

	@Override
	public void updateMenu(Menu menu) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY)) {

			ps.setInt(1, menu.getRestaurantId());
			ps.setString(2, menu.getItemName());
			ps.setString(3, menu.getDescription());
			ps.setDouble(4, menu.getPrice());
			ps.setDouble(5, menu.getRatings());
			ps.setBoolean(6, menu.isAvailable());
			ps.setString(7, menu.getImagePath());
			ps.setInt(8, menu.getMenuId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {

		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(DELETE_QUERY)) {

			ps.setInt(1, menuId);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getAllMenus() {

		List<Menu> list = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection();
			 Statement stmt = conn.createStatement()) {

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {
				list.add(extractMenu(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<Menu> getMenuByRestaurant(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(GET_BY_RESTAURANT_QUERY)) {

	        ps.setInt(1, restaurantId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            list.add(extractMenu(rs));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	private Menu extractMenu(ResultSet rs) throws SQLException {

		return new Menu(
				rs.getInt("menuId"),
				rs.getInt("restaurantId"),
				rs.getString("itemName"),
				rs.getString("description"),
				rs.getDouble("price"),
				rs.getDouble("ratings"),
				rs.getBoolean("isAvailable"),
				rs.getString("imagePath")
		);
	}
	
	
	
}
