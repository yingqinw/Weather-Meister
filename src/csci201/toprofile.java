package csci201;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class toprofile
 */
@WebServlet("/toprofile")
public class toprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username=(String)session.getAttribute("username");
		Connection conn=null;
		PreparedStatement ps=null;
		PreparedStatement ps2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		ArrayList<String> history=new ArrayList<String>();
		String nextPage ="/profile.jsp";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//throw class not found exception
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment3?user=root&password=Yingqinw1999");//use the driver that we specify, have to specify which database we are connecting to in the url
			//after the // is the hostname, the computer that run the database
			ps=conn.prepareStatement("SELECT * FROM User WHERE username=?");//specify the variable that the user type
			ps.setString(1, username);//set the first question mark be the value of the variable that the user type
			rs=ps.executeQuery();//is a table
			if(rs.next()) {
				int userID = rs.getInt("userID");
				ps2=conn.prepareStatement("SELECT * FROM SearchResult WHERE userID=?");//specify the variable that the user type
				ps2.setInt(1, userID);//set the first question mark be the value of the variable that the user type
				rs2=ps2.executeQuery();//is a table
				while(rs2.next()) {
					String item=rs2.getString("SearchValue");
					history.add(item);
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
				if(rs2!=null) {rs2.close();}
				if(ps!=null) {ps.close();}
				if(ps2!=null) {ps2.close();}
				if(conn!=null) {conn.close(); }
			}catch(SQLException sqle) {
				System.out.println("sqle closing stuff: "+sqle.getMessage());
			}
			
			
		}
		request.setAttribute("history", history);
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
