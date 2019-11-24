

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String username = request.getParameter("username");
		System.out.println("song name is " +songName);
		System.out.println("username is " + request.getParameter("username"));
		
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
			
			String findSong = "SELECT songID FROM rooms where owner = ?";
			PreparedStatement pre = conn.prepareStatement(findSong);
			pre.setString(1, username);
			ResultSet songResult = pre.executeQuery();
			String answer = "";
			while(songResult.next()) {
				int songid = songResult.getInt(1);
				answer += Integer.toString(songid)+"&";
			}
			PrintWriter out = response.getWriter();
			out.println(answer);
			out.close();

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
		
		//find all of the songs from the database
		//printwriter, 1&2
		
		
		
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
