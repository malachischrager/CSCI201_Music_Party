import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;
import java.util.Vector;

import message.Message;


public class Server{
	public static Scanner in;
	//private static Vector<MusicRoom> games;
	private Vector<ServerThread> serverThreadsS;
	private Vector<MusicRoom> musicroom;
	
	public Server (){
		System.out.print("Trying to connect to server...");
		System.out.print("hi");
		System.out.print("hi");
		musicroom = new Vector<MusicRoom>();
		try {
			ServerSocket ss = new ServerSocket(6789);
			System.out.print("Connected!\n");
			serverThreadsS = new Vector<ServerThread>();
			while(true) {
				Socket s = ss.accept(); // blocking
				System.out.println("Connection from: " + s.getInetAddress());
				ServerThread st = new ServerThread(s, this);
				serverThreadsS.add(st);
			}
		} catch (IOException ioe) {
			System.out.println("Unable to connect to server " + "localhost" + " on port 6789");
			ioe.printStackTrace();
		}
	}
	public void addSong(Vector<String>input, ServerThread st) {
		String output = "";
		String songName = input.get(0);
		String roomCode = input.get(1);
		String username = input.get(2);
		MusicRoom r = null;
		System.out.println("addSong");
		
		for(int i = 0; i < musicroom.size(); i++) {
			if(musicroom.get(i).getRoomName().equals(roomCode)) {
				r = musicroom.get(i);
			}
		}
		if(null == r) { //room does not exist
			r = new MusicRoom(roomCode);
			musicroom.add(r);
			if(!r.findUser(username)) { //if user is not there
				r.addUser(username, st);
			} 
			r.addSong(songName);
		} 
		else { //room is found
			if(!r.findUser(username)) { //if user is not there
				r.addUser(username, st);
			}
			r.addSong(songName);
		}
		Vector<String> allSongs = r.getAllSongs();
		for(int i = 0; i < allSongs.size(); i++) {
			output += allSongs.get(i) + ",";
		}
		System.out.println("ADD SONG: " + output);
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		Vector<ServerThread> serverT = new Vector<ServerThread>();
		serverT = r.allSt();
		System.out.println("NEW SIZE IS " + serverT.size());
		for(int i = 0; i < serverT.size(); i++) {
			Message m = new Message("output", outputSongs);
			st.sendMessage(m);
		}
	}
	
	
	public void removeSong(Vector<String> input, ServerThread st) {
		String output = "";
		String roomCode = input.get(0);
		String username = input.get(1);
		String songName = input.get(2);
		MusicRoom r = null;
		System.out.println("removeSong");
		System.out.println(roomCode);
		System.out.println(username);
		System.out.println(songName);
		for(int i = 0; i < musicroom.size(); i++) {
			if(musicroom.get(i).getRoomName().equals(roomCode)) {
				r = musicroom.get(i);
			}
		}
		System.out.println("remove song size:" + musicroom.size());
		r = musicroom.get(0);
		System.out.println("GOING TO DeLETE SONGFROM MUSICROOM");
		r.removeSong(songName);
		Vector<String> allSongs = r.getAllSongs();
		// append it shorter
		for(int i = 0; i < allSongs.size(); i++) {
			output += allSongs.get(i) + ",";
		}
		System.out.println("music room OUTPUT STRING: " + output);
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		Vector<ServerThread> serverT = new Vector<ServerThread>();
		serverT = r.allSt();
		System.out.println("music room NEW SIZE IS " + serverT.size());
		for(int i = 0; i < serverT.size(); i++) {
			Message m = new Message("output", outputSongs);
			st.sendMessage(m);
		}
	}
	
	public void addST(Vector<String>input, ServerThread st) {
		String username = input.get(0);
		MusicRoom r = musicroom.get(0); //JUST GOT THE 1ST ROOM, WOULD NEED CHANGING IF DONE A BETTER WAY
		r.addUser(username, st);
		Vector<ServerThread> serverT = new Vector<ServerThread>();
		serverT = r.allSt();
		System.out.println("NEW SIZE IS " + serverT.size());
		return;
	}
	
	public void upVote(Vector<String>input, ServerThread st) {
		String output = "";
		String songName = input.get(0);
		MusicRoom r = musicroom.get(0);
		r.upVote(songName);
		System.out.println("upVote in SERVER");
		Vector<String> allSongs = r.getAllSongs();
		for(int i = 0; i < allSongs.size(); i++) {
			output += allSongs.get(i) + ",";
		}
		System.out.println("upVote: " + output);
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		Message m = new Message("output", outputSongs);
		st.sendMessage(m);
	}
	
	public void upVoteF(Vector<String>input, ServerThread st) {
		String output = "";
		String songName = input.get(0);
		MusicRoom r = musicroom.get(0);
		r.upVoteF(songName);
		Vector<String> allSongs = r.getAllSongs();
		for(int i = 0; i < allSongs.size(); i++) {
			output += allSongs.get(i) + ",";
		}
		System.out.println("upVoteF: " + output);
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		Message m = new Message("output", outputSongs);
		st.sendMessage(m);
	}
	
	
	public void updateSong(Vector<String> vector, ServerThread st) {
		if(musicroom.size() == 0) {
			MusicRoom n = new MusicRoom("U45XYgJk");
			musicroom.add(n);
		}
		MusicRoom r = musicroom.get(0);
		String output = "";
		System.out.println("UPDATE SONG SERVER:");
		Vector<String> allSongs = r.getAllSongs();
		for(int i = 0; i < allSongs.size(); i++) {
			output += allSongs.get(i) + ",";
		}
		System.out.println("server song " + output);
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		Message m = new Message("output", outputSongs);
		st.sendMessage(m);
	}
	
	public void getNum(Vector<String>input, ServerThread st) {
		String output = ""; 
		MusicRoom r = musicroom.get(0);
		String username = input.get(0);
		output = r.getNum();
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		//System.out.println(username);
		//System.out.println("NUM : " + output);
		Message m = new Message("output", outputSongs);
		st.sendMessage(m);
	}
	
	public void getNumF(Vector<String>input, ServerThread st) {
		String output = ""; 
		MusicRoom r = musicroom.get(0);
		String username = input.get(0);
		output = r.getNum();
		Vector<String> outputSongs = new Vector<String>();
		outputSongs.add(output);
		//System.out.println(username);
		//System.out.println("NUM : " + output);
		Message m = new Message("output", outputSongs);
		st.sendMessage(m);
	}
	
	public static void main(String [] args) {
		Server cr = new Server();
	}
}
