import java.util.Vector;

public class MusicRoom {
	Vector<ServerThread> serverThreads;
	Vector<String> users;
	Vector<String> songNames;
 	String roomName;
	public MusicRoom(String roomName){
		this.roomName = roomName;
	}
	public void addUser(String username, ServerThread st) {
		users.add(username);
		serverThreads.add(st);
	}
	
	public String getRoomName() {
		return roomName;
	}
	
	public void addSong(String song) {
		songNames.add(song);
	}
	
	public Vector<String> getAllSongs(){
		return songNames;
	}
	
	public boolean findUser(String user) {
		for(int i = 0; i < users.size(); i++) {
			if(user.contentEquals(users.get(i))) {
				return true;
			}
		}
		return false;
	}
}
