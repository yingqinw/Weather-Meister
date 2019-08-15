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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String confirm=request.getParameter("confirm");
		HttpSession session = request.getSession();
		Connection conn=null;
		PreparedStatement ps=null;
		PreparedStatement ps2=null;
		ResultSet rs=null;
		String nextPage ="/homepage.jsp";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//throw class not found exception
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment3?user=root&password=Yingqinw1999");//use the driver that we specify, have to specify which database we are connecting to in the url
			//after the // is the hostname, the computer that run the database
			ps=conn.prepareStatement("SELECT * FROM User WHERE username=?");//specify the variable that the user type
			ps.setString(1, username);//set the first questionmark be the value of the variable that the user type
			rs=ps.executeQuery();//is a table
			
			if(rs.next()) {
				request.setAttribute("registererror", "This username is already taken.");
				nextPage="/register.jsp";
			}
			else {
				if(!password.equals(confirm)) {
					request.setAttribute("registererror", "The passwords do not match.");
					nextPage="/register.jsp";
					
				}
				else {
					ps2=conn.prepareStatement("INSERT INTO User (username,password) VALUES(?,?)");
					ps2.setString(1,username);
					ps2.setString(2, password);
					ps2.executeUpdate();
					session.setAttribute("username",username);
				}
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
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
