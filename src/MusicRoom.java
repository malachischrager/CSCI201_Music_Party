import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Vector;

public class MusicRoom {
	Vector<ServerThread> serverThreads;
	Vector<String> users;
	Vector<String> songNames;
 	String roomName;
 	HashMap<String, Integer> map;
 	
	public MusicRoom(String roomName){
		this.roomName = roomName;
		users = new Vector<String>();
		songNames = new Vector<String>();
		serverThreads = new Vector<ServerThread>();
		map = new HashMap<>();
	}
	public void addUser(String username, ServerThread st) {
		users.add(username);
		serverThreads.add(st);
	}
	
	public String getRoomName() {
		return roomName;
	}
	
	public void addSong(String song) {
		//songNames.add(song);
		songNames.clear();
		map.put(song, 0);
		System.out.println("MUSIC ROOM ADD SONG:");
		map = sortByValue(map);
		if (map.containsKey(song)) { 
            Integer a = map.get(song); 
            System.out.println(a);
        } 
		System.out.println("MUSIC ROOM ADD SONG after");
		for (Entry<String, Integer> entry : map.entrySet())  {
            songNames.add(entry.getKey());
            System.out.println(entry.getKey());
    	} 
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
	public Vector<ServerThread> allSt(){
		return serverThreads;
	}
	
	public static HashMap<String, Integer> sortByValue(HashMap<String, Integer> hm) 
    { 
        // Create a list from elements of HashMap 
        List<Map.Entry<String, Integer> > list = 
               new LinkedList<Map.Entry<String, Integer> >(hm.entrySet()); 
  
        // Sort the list 
        Collections.sort(list, new Comparator<Map.Entry<String, Integer> >() { 
            public int compare(Map.Entry<String, Integer> o1,  
                               Map.Entry<String, Integer> o2) 
            { 
                return (o2.getValue()).compareTo(o1.getValue()); 
            } 
        }); 
          
        // put data from sorted list to hashmap  
        HashMap<String, Integer> temp = new LinkedHashMap<String, Integer>(); 
        for (Map.Entry<String, Integer> aa : list) { 
            temp.put(aa.getKey(), aa.getValue()); 
        } 
        return temp; 
    } 
	
	public void upVote(String name) {
		System.out.println("MUSIC ROOM " + name);
		if (map.containsKey(name)) { 
            Integer a = map.get(name); 
            a += 1;
            System.out.println(a);
            map.put(name, a);
        } 
		map = sortByValue(map);
		songNames.clear();
		for (Entry<String, Integer> entry : map.entrySet())  {
            songNames.add(entry.getKey());
    	}
		
	}
	public String getNum() {
		// TODO Auto-generated method stub
		String output = "";
		for (Entry<String, Integer> entry : map.entrySet())  {
			System.out.println(entry.getKey() + entry.getValue());
            output += entry.getValue() + ",";
    	} 
		System.out.println("MUSIC ROOM NUM: " + output);
		return output;
	}
}
