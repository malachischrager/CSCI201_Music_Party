

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addSongServlet
 */
@WebServlet("/addSongServlet")
public class addSongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSongServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String songName = request.getParameter("song-name");
		
		System.out.println(songName);
		
		Connection conn = null;
		Statement st = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/musicparty?cloudSqlInstance=starry-hearth-259220:us-central1:musicparty01&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=true&user=musicparty&password=musicparty");
			String sql = "INSERT INTO rooms (owner, songID) VALUES (?,?)";
			
			//find the songName's id in the database, then insert it into room
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("username"));
			ps.setInt(2, Integer.parseInt(songName));
			ps.executeUpdate();
			System.out.println("Added a song to the queue");

		} catch (SQLException sqle) {
			sqle.printStackTrace();
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
