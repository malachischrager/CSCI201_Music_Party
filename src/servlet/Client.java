package servlet;
import java.io.IOException;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;
import java.util.Vector;

import message.Message;

public class Client {
	
	private ObjectOutputStream oos;
	private ObjectInputStream ois;

	
	public Client(String host, int p) throws ClassNotFoundException {
		
		
		try {
			System.out.println("Trying to connect to server...Connected!");
			Socket s = new Socket(host, p);
			this.oos = new ObjectOutputStream(s.getOutputStream());
			this.ois = new ObjectInputStream(s.getInputStream());
//			this.br = new BufferedReader(new InputStreamReader(s.getInputStream()));
//			this.ps = new PrintWriter(s.getOutputStream());
			

		} catch (IOException ioe) {
			System.out.println("ioe in client constructor: " + ioe.getMessage());
		}
	}
	
	
	
	public String addSong(String songName, String roomCode, String username) throws ClassNotFoundException, IOException {
		
		Vector<String> input = new Vector<String>();
		input.add(songName);
		input.add(roomCode);
		input.add(username);
		
		Message m = new Message("ADD_SONG", input);
		
		this.sendMessage(m);
		
		Message mr = (Message)ois.readObject();
		
		return mr.getInput().get(0);
		
		
		
	}
	
	public void addST(String username) {
		Vector<String> input = new Vector<String>();
		input.add(username);
		Message m = new Message("ADD_ST", input);
		
		this.sendMessage(m);
		
		return;
	}
	
	public void sendMessage(Message cm) {

		try {
			oos.writeObject(cm);
			oos.flush();
		} catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage());
		}
	}



	public String getUpdate() throws ClassNotFoundException, IOException {
		// TODO Auto-generated method stub
		Message mr = (Message)ois.readObject();
		return mr.getInput().get(0);
	}
}


