

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Verify
 */
@WebServlet("/Verify")
public class Verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String error = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		String confirm;
		error = "";
		PrintWriter out = response.getWriter();
		if(type.equals("reg")){
			System.out.println("register");
			System.out.println(password);
			confirm = request.getParameter("confirm");
			System.out.println(confirm);
			if(password.equals(confirm)) {
				System.out.println("passwords match");
				if(!userExists(username)) {
					System.out.println("reg");
					reg(username, password);
				} //check if the user exists in the database, if they do error, if not add to database
				else {
					error = "This username is already taken";
				}
			}
			else {
				error = "The passwords do not match.";
			}
		}
		else {
			if(userExists(username)) {
				if(!(login(username, password))) { //check to see if user exists in the database, if not error, if password wrong error
					error = "Incorrect password.";
				}
			}
			else {
				error = "This user does not exist.";
			}
		}
		out.println(error);
    	out.close();
    	
    	String next = "/join_start.jsp";
    	RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
    	try {
    		dispatch.forward(request, response);
    	}catch(IOException e) {
    		e.printStackTrace();
    	}catch(ServletException e) {
    		e.printStackTrace();
    	}
	}
	protected boolean userExists(String username) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean output = false;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/musicparty?cloudSqlInstance=starry-hearth-259220:us-central1:musicparty01&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=musicparty&password=musicparty");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM users WHERE username ='"+ username +"'");
			if(!(rs.next())) {
				output = false;
			}
			else {
				output = true;
			}
		} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		} finally{
			try {
				if (rs!= null) {
					rs.close();
				}  
				if (st!= null) {          
					st.close();
				}        
				if (conn != null) {           
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
		return output;
	}
	protected void reg(String username, String password) {
		Connection conn = null;
		Statement st = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/musicparty?cloudSqlInstance=starry-hearth-259220:us-central1:musicparty01&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=true&user=musicparty&password=musicparty");
			st = conn.createStatement();
			st.executeUpdate("INSERT into users(username, password) values ('"+ username +"','"+ password +"')");
		} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		} finally{
			try { 
				if (st!= null) {          
					st.close();
				}        
				if (conn != null) {           
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
	}
	protected boolean login(String username, String password) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean correctInfo = false;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/musicparty?cloudSqlInstance=starry-hearth-259220:us-central1:musicparty01&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=true&user=musicparty&password=musicparty");
			st = conn.createStatement();
			rs = st.executeQuery("SELECT password FROM users WHERE username ='"+ username +"'");
			rs.next();
			String dataPassword = rs.getString(1);
			if(dataPassword.equals(password)) {
				correctInfo = true;
			}
			else {
				correctInfo = false;
			}
		} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		} finally{
			try {
				if (rs!= null) {
					rs.close();
				}  
				if (st!= null) {          
					st.close();
				}        
				if (conn != null) {           
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
		return correctInfo;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
