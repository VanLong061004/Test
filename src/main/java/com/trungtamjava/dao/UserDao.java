package com.trungtamjava.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.trungtamjava.model.User;

public class UserDao {
	public List<User> getAllUsers(){
		List<User> users=new ArrayList<User>();
		Connection connection =JDBCconnection.getJDBCConnection();
		String sql="SELECT * FROM USER";
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setFavourites(rs.getString("favourites"));
				user.setRole(rs.getString("role"));
				users.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return users;
	}
	public User getAllUserById(int id){
		Connection connection =JDBCconnection.getJDBCConnection();
		String sql="SELECT * FROM USER WHERE id = ?" ;
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setFavourites(rs.getString("favourites"));
				user.setRole(rs.getString("role"));
				return user;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public void addUser(User user){
		Connection connection =JDBCconnection.getJDBCConnection();
		String sql="INSERT INTO USER(name, phone, username, password, about, favourites, role) VALUE(?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPhone());
			preparedStatement.setString(3, user.getUsername());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getAbout());
			preparedStatement.setString(6, user.getFavourites());
			preparedStatement.setString(7, user.getRole());
			int rs=preparedStatement.executeUpdate();
			System.out.println(rs);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void updateUser(User user){
		Connection connection =JDBCconnection.getJDBCConnection();
		String sql = "UPDATE USER SET name=?, phone=?, username=?, password=?, about=?, favourites=?, role=? WHERE id=?";

		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPhone());
			preparedStatement.setString(3, user.getUsername());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getAbout());
			preparedStatement.setString(6, user.getFavourites());
			preparedStatement.setString(7, user.getRole());
			preparedStatement.setInt(8, user.getId());
			int rs=preparedStatement.executeUpdate();
			System.out.println(rs);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void deleteUser(int id){
		Connection connection =JDBCconnection.getJDBCConnection();
		String sql="DELETE FROM USER WHERE id=?";
		try {
	        // Chuẩn bị câu lệnh SQL
	        PreparedStatement preparedStatement = connection.prepareStatement(sql);

	        // Thiết lập tham số cho câu truy vấn
	        preparedStatement.setInt(1, id);

	        // Thực thi câu lệnh DELETE
	        int rowsDeleted = preparedStatement.executeUpdate();

	        // Kiểm tra xem có bản ghi nào bị xóa không
	        if (rowsDeleted > 0) {
	            System.out.println("User with id " + id + " was deleted successfully!");
	        } else {
	            System.out.println("No user found with id " + id);
	        }

	    } catch (Exception e) {
	        // Xử lý ngoại lệ SQL
	        e.printStackTrace();
	    } 
		
	}
}
