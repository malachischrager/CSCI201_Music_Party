import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import message.Message;

public class ServerThread extends Thread{
private ObjectInputStream ois;
private ObjectOutputStream oos;
private Socket s;
private Server server;

public ServerThread(Socket s, Server server){
	try {
	// to do --> store them somewhere, you will need them later 
	oos = new ObjectOutputStream(s.getOutputStream());
	ois = new ObjectInputStream(s.getInputStream());
	this.s = s;
	this.server = server;
	// to do --> complete the implementation for the constructor
	this.start();
	
	
	} catch (IOException ioe) {
		System.out.println("ioe in ServerThread constructor: " + ioe.getMessage());
	}
}
public void sendMessage(Message m) {
	try {
		System.out.println("sendMessST");
		oos.writeObject(m);
		oos.flush();
	} catch (IOException ioe) {
		System.out.println("ioe: " + ioe.getMessage());
	}
}
	public void run(){
		try {
			while(true) {
				System.out.println("addSongST");
				Message m = (Message) ois.readObject();
				if (m != null) {
					if(m.getType().equals("ADD_SONG")) {
						server.addSong(m.getInput(), this);
					}
					if(m.getType().equals("UPDATE_SONG")) {
						server.addSong(m.getInput(), this);
					}
					if(m.getType().contentEquals("ADD_ST")) {
						server.addST(m.getInput(), this);
					}
				}
			}
		} catch (ClassNotFoundException | IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}
	}