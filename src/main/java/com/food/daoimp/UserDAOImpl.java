package com.food.daoimp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;

public class UserDAOImpl implements UserDAO{

	private static final String INSERT_USER_QUERY = "INSERT into `user` (`name`, `username`, `password`, `email`, `phone`, `address`, `role`) values (?,?,?,?,?,?,?)";
	private static final String GET_USER_QUERY = "SELECT * FROM `user` WHERE `userId` = ?";
	private static final String UPDATE_USER_QUERY =
			"UPDATE `user` SET name=?, password=?, phone=?, address=?, role=? WHERE userId=?";
	private static final String DELETE_USER_QUERY = "DELETE FROM `user` WHERE `userId` = ?";
	private static final String GET_ALL_USERS_QUERY = "SELECT * FROM `user`";
	private static final String LOGIN_QUERY =
		    "SELECT * FROM user WHERE username = ? AND password = ?";
	
	@Override
	public void addUser(User user) {
		
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(INSERT_USER_QUERY);)
		{
			prepareStatement.setString(1, user.getName());
			prepareStatement.setString(2, user.getUsername());
			prepareStatement.setString(3, user.getPassword());
			prepareStatement.setString(4, user.getEmail());
			prepareStatement.setString(5, user.getPhone());
			prepareStatement.setString(6, user.getAddress());
			prepareStatement.setString(7, user.getRole());
			
			int executeUpdate = prepareStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(int userId) {
		
		User user = null;
		
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(GET_USER_QUERY);	)
		{
			prepareStatement.setInt(1, userId);
			
			ResultSet resultSet = prepareStatement.executeQuery();
			
			if(resultSet.next()){
			user = extractUser(resultSet);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public void updateUser(User user) {
		
		Connection connection = null;
		PreparedStatement prepareStatement;
		
		try{
			connection = DBConnection.getConnection();
			prepareStatement = connection.prepareStatement(UPDATE_USER_QUERY);
			
			prepareStatement.setString(1, user.getName());
			prepareStatement.setString(2, user.getPassword());
			prepareStatement.setString(3, user.getPhone());
			prepareStatement.setString(4, user.getAddress());
			prepareStatement.setString(5, user.getRole());
			prepareStatement.setInt(6, user.getUserId());
			
			prepareStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}

	@Override
	public void deleteUser(int userId) {

		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(DELETE_USER_QUERY);
	
			prepareStatement.setInt(1, userId);
			
			 prepareStatement.executeUpdate();
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}

	@Override
	public List<User> getAllUser() {
		
		ArrayList<User> usersList = new ArrayList<User>();
		
		try {
			Connection connection = DBConnection.getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet result = statement.executeQuery(GET_ALL_USERS_QUERY);
			
			while (result.next())
			{
				User user = extractUser(result);
				usersList.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return usersList;
	}
	
	User extractUser(ResultSet result) throws SQLException
	{
		int userId = result.getInt("userId");
		String name = result.getString("name");
		String username = result.getString("username");
		String password = result.getString("password");
		String email = result.getString("email");
		String phone = result.getString("phone");
		String address = result.getString("address");
		String role = result.getString("role");
		
		User user = new User(userId, name, username, password, email, phone, address, role, null, null);
		
		return user;
		
	}
	
	@Override
	public User getUserByUsernameAndPassword(String username, String password) {

	    User user = null;

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(LOGIN_QUERY)) {

	        ps.setString(1, username);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            user = extractUser(rs);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	
	

}
