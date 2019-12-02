


import servlet.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Vector;


import java.io.IOException;
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
						System.out.println(songName);
						try {
							allSongs = c.addSong(songName,roomCode, username);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					if(type.equals("REMOVE_SONG")) {
						System.out.println("INSIDE OF MAINSERVER: ENTERED REMOVE_SONG OPTION");
						String songName = request.getParameter("songName");
						Client c = people.get(username);
						System.out.println(songName + " is being removed from the queue");
						try {
							allSongs = c.removeSong(roomCode, username, songName);
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}
					}
					if(type.equals("UP_VOTE")) {
						System.out.println("upVote in servlet");
						String songName = request.getParameter("songName");
						Client c = people.get(username);
						try {
							allSongs = c.upVoteU(songName);
							System.out.println(allSongs + " UPVOTE OUTPUT");
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
					if(type.contentEquals("UPDATE_SONG")) {
						Client c = people.get(username);
						//System.out.println("in update_song");
						try {
							allSongs = c.getUpdate();
							//System.out.println(allSongs + " UPDATE OUTPUT");
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} 
					
					if(type.equals("GET_NUMF")) {
						//System.out.println("mainServlet getNum1");
						Client c = people.get(username);
						try {
							allSongs = c.getNumF(username);
							System.out.println(allSongs + " OUTPUT");
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					if(type.equals("GET_NUM")) {
						System.out.println("mainServlet getNum1");
						Client c = people.get(username);
						try {
							allSongs = c.getNumF(username);
							System.out.println(allSongs + " OUTPUT");
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
						System.out.println(songName);
						try {
							allSongs = c.addSong(songName, roomCode, username);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
					if(type.equals("UP_VOTE")) {
						System.out.println("mainServlet UP_VOTE");
						String songName = request.getParameter("songName");
						Client c = people.get(username);
						System.out.println(songName);
						try {
							allSongs = c.upVoteU(songName);
							System.out.println("UP_VOTE OUTPUT:" + allSongs);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
					if(type.equals("GET_NUM")) {
						System.out.println("mainServlet GETNUM2");
						Client c = people.get(username);
						try {
							allSongs = c.getNum(username);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
					if(type.contentEquals("UPDATE_SONG")) {
						Client c = people.get(username);
						//System.out.println("in update_song");
						try {
							allSongs = c.getUpdate();
							//System.out.println(allSongs + " UPDATE OUTPUT");
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} 
					
				}
			}
			else { //playlist is not there
				System.out.println("playlist is not there");
				playlists.add(roomCode); 
					if(null != people.get(username)){ //user is there
						System.out.println("else: user is there");
						if(type.equals("ADD_SONG")) {
							
							String songName = request.getParameter("songName");
							Client c = people.get(username);
							System.out.println(songName);
							try {
								allSongs = c.addSong(songName,roomCode, username);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						
						if(type.equals("UP_VOTE")) {
							
							String songName = request.getParameter("songName");
							Client c = people.get(username);
							System.out.println(songName);
							try {
								allSongs = c.upVoteU(songName);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						
						if(type.equals("GET_NUM")) {
							Client c = people.get(username);
							try {
								allSongs = c.getNum(username);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						if(type.contentEquals("UPDATE_SONG")) {
							Client c = people.get(username);
							String getUpdates = null;
							try {
								getUpdates = c.getUpdate();
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							//System.out.println("getUpdates" + getUpdates);
							out.println(getUpdates);
							out.close();
						}
						
					}
					else { //need to add user to playlist
						System.out.println("else: need to add user to playlist");
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
								allSongs = c.addSong(songName, roomCode, username);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						
						
						if(type.equals("UP_VOTE")) {
							
							String songName = request.getParameter("songName");
							Client c = people.get(username);
							System.out.println(songName);
							try {
								allSongs = c.upVoteU(songName);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						
						if(type.equals("GET_NUM")) {
							Client c = people.get(username);
							try {
								allSongs = c.getNum(username);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}
						if(type.contentEquals("UPDATE_SONG")) {
							Client c = people.get(username);
							String getUpdates = null;
							try {
								getUpdates = c.getUpdate();
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							//System.out.println("getUpdates" + getUpdates);
							out.println(getUpdates);
							out.close();
						}
						
					}
			
				}
			//System.out.println("ALL SONGS " + allSongs);
			out.println(allSongs);
			out.close();
		}
		
		
		
		else {
			if(type.contentEquals("addST")) {
				if(null != people.get(username)){ //user is there
					
						Client c = people.get(username);
						c.addST(username);
						
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
							
							Client c = people.get(username);
							c.addST(username);
							
						
						
					}
				
			}
			if(type.contentEquals("UPDATE_SONG")) {
				Client c = people.get(username);
				String getUpdates = null;
				try {
					getUpdates = c.getUpdate();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//System.out.println("getUpdates" + getUpdates);
				out.println(getUpdates);
				out.close();
			}
			
			
			if(type.equals("UP_VOTE")) {
				
				String songName = request.getParameter("songName");
				Client c = people.get(username);
				System.out.println(songName);
				try {
					allSongs = c.upVoteU(songName);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			if(type.equals("GET_NUMF")) {
				Client c = people.get(username);
				try {
					allSongs = c.getNumF(username);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.println(allSongs);
				out.close();
			}
		}
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

