package csci201;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cityname=request.getParameter("name");
		String Latitude=request.getParameter("Latitude");
		String Longtitude=request.getParameter("Longtitude");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");	
		
		boolean ifCity=false;
		boolean ifLocation=false;
		String nextPage ="/all.jsp";
		
		
		if((cityname==null || cityname.trim().length()==0) && (Latitude==null || Latitude.trim().length()==0) && (Longtitude==null || Longtitude.trim().length()==0)) {
			request.setAttribute("inputError", "Needs to give a cityname or Location!");//can send any object to the page, suggest pass the weather object
		}
		else if(!(cityname==null || cityname.trim().length()==0)){
			ifCity=true;
			request.setAttribute("cityname", cityname);
			
			if(username!=null && username.trim().length()!=0) {
				Connection conn=null;
				PreparedStatement ps=null;
				PreparedStatement ps2=null;
				ResultSet rs=null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");//throw class not found exception
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment3?user=root&password=Yingqinw1999");//use the driver that we specify, have to specify which database we are connecting to in the url
					//after the // is the hostname, the computer that run the database
					ps=conn.prepareStatement("SELECT * FROM User WHERE username=?");//specify the variable that the user type
					ps.setString(1, username);//set the first question mark be the value of the variable that the user type
					rs=ps.executeQuery();//is a table
					if(rs.next()) {
						int userID = rs.getInt("userID");
						ps2 = conn.prepareStatement("INSERT INTO SearchResult (userID,SearchValue) VALUES(?,?)");
						ps2.setInt(1,userID);
						ps2.setString(2, cityname);
						ps2.executeUpdate();
					}
					
				}catch(SQLException sqle) {
					System.out.println(sqle.getStackTrace());
					System.out.println("sqle: "+sqle.getMessage());
				}catch(ClassNotFoundException cnfe) {
					System.out.println("cnfe: "+cnfe.getMessage());
				}finally {
					try {
						if(rs!=null) {rs.close();}
						if(ps!=null) {ps.close();}
						if(ps2!=null){ps2.close();}
						if(conn!=null) {conn.close(); }
					}catch(SQLException sqle) {
						System.out.println("sqle closing stuff: "+sqle.getMessage());
					}	
				}
			}
		}
		else if((Latitude==null || Latitude.trim().length()==0) || (Longtitude==null || Longtitude.trim().length()==0)) {
			request.setAttribute("LocationError", "Needs to give both longtitude and latitude!");//can send any object to the page, suggest pass the weather object
		}
		else {
			ifLocation=true;
			request.setAttribute("Longtitude", Longtitude);
			request.setAttribute("Latitude", Latitude);	
			
			if(username!=null && username.trim().length()!=0) {
				Connection conn=null;
				PreparedStatement ps=null;
				PreparedStatement ps2=null;
				ResultSet rs=null;
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");//throw class not found exception
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment3?user=root&password=Yingqinw1999");//use the driver that we specify, have to specify which database we are connecting to in the url
					//after the // is the hostname, the computer that run the database
					ps=conn.prepareStatement("SELECT * FROM User WHERE username=?");//specify the variable that the user type
					ps.setString(1, username);//set the first question mark be the value of the variable that the user type
					rs=ps.executeQuery();//is a table
					if(rs.next()) {
						int userID = rs.getInt("userID");
						ps2 = conn.prepareStatement("INSERT INTO SearchResult (userID,SearchValue) VALUES(?,?)");
						ps2.setInt(1,userID);
						String citydata = "("+Latitude+","+Longtitude+")";
						ps2.setString(2, citydata);
						ps2.executeUpdate();
					}
					
				}catch(SQLException sqle) {
					System.out.println(sqle.getStackTrace());
					System.out.println("sqle: "+sqle.getMessage());
				}catch(ClassNotFoundException cnfe) {
					System.out.println("cnfe: "+cnfe.getMessage());
				}finally {
					try {
						if(rs!=null) {rs.close();}
						if(ps!=null) {ps.close();}
						if(ps2!=null) {ps2.close();}
						if(conn!=null) {conn.close(); }
					}catch(SQLException sqle) {
						System.out.println("sqle closing stuff: "+sqle.getMessage());
					}	
				}
			}
		}
		
		request.setAttribute("ifCity", ifCity);
		request.setAttribute("ifLocation", ifLocation);
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request,  response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
