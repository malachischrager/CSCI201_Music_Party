

import servlet.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Vector;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Client> people = new HashMap<String, Client>();
	private Vector<String> playlists = new Vector<String>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pageName = request.getParameter("pageName");
		String username = request.getParameter("username");
		String type = request.getParameter("type");
		String roomCode = request.getParameter("playList");
		PrintWriter out = response.getWriter();
		String allSongs = null;
		if(pageName.contentEquals("start")) {
			if(playlists.contains(roomCode)) { //playlist is there
				if(null != people.get(username)){ //user is there
					
					if(type.equals("ADD_SONG")) {
						
						String songName = request.getParameter("songName");
						Client c = people.get(username);
						
						try {
							allSongs = c.addSong(roomCode, songName, username);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
				}
				else { //need to add user to playlist
					
					Client nc = null;
					try {
						nc = new Client ("localhost", 6789);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					people.put(username, nc);
					
					if(type.equals("ADD_SONG")) {
						
						String songName = request.getParameter("songName");
						Client c = people.get(username);
						
						try {
							allSongs = c.addSong(roomCode, songName, username);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
					
				}
			}
			else { //playlist is not there
				playlists.add(roomCode); 
			}
			
		}
		out.println(allSongs);
		out.close();
		return;
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
