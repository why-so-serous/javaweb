package cn.edu.swu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class register extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException
	{
		String username = request.getParameter("user");
		String password = request.getParameter("passwd");

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		PrintWriter out = response.getWriter();
		try{
			out.println("connecting database...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql:///user_test";
			String user = "root";
			String password2 = "xia199815";
			connection = DriverManager.getConnection(url,user,password2);
			out.println("connect database successful");
			String sql = "insert into xyq values(?,?,?)";
			statement = connection.prepareStatement(sql);
			statement.setNull(1,java.sql.Types.INTEGER);
			statement.setString(2,username);
			statement.setString(3,password);
			out.println("Register...");
			statement.executeUpdate();
			out.println("Register successful!Coming soon to the login page...");
			response.setHeader("refresh","3;../../../javaweb/login.jsp");
		} catch(Exception e){
			out.println("Sorry,Register failed");
			e.printStackTrace();
		}finally{
			try{
				if(resultSet != null){
					resultSet.close();
				}
			}catch (Exception e){
				e.printStackTrace();
			}
			try{
				if(statement != null){
					statement.close();
				}
			}catch (Exception e){
				e.printStackTrace();
			}
			try{
				if(connection != null){
					connection.close();
				}
			}catch (Exception e){
				e.printStackTrace();
			}
		}
	}
}
