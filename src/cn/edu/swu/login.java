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

public class login extends HttpServlet {
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
		//out.println(username+"  "+password);
		try{
			out.println("connecting database...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql:///user_test";
			String user = "root";
			String password2 = "xia199815";
			connection = DriverManager.getConnection(url,user,password2);
			String sql = "select count(id) from xyq where user = ?" + "and password = ?";

			statement = connection.prepareStatement(sql);
			statement.setString(1,username);
			statement.setString(2,password);

			resultSet = statement.executeQuery();
			if(resultSet.next()){
				int count = resultSet.getInt(1);
				if(count > 0){
					out.println("Hello: " + username);
					response.sendRedirect("http://47.106.32.3");
				}else{
					out.println("Sorry: " + username);
				}
			}
		} catch(Exception e){
			out.println("catch");
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
					resultSet.close();
				}
			}catch (Exception e){
				e.printStackTrace();
			}
			try{
				if(connection != null){
					resultSet.close();
				}
			}catch (Exception e){
				e.printStackTrace();
			}
		}
	}
}
