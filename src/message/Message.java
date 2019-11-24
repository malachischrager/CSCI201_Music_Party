package message;

import java.io.Serializable;
import java.util.Vector;

public class Message implements Serializable{
	String type;
	Vector<String> inputs;
	
	public Message() {
	
	}
	
	public Message(String type, Vector<String> input) {
		this.type = type;
		inputs = new Vector<String>();
		for(int i = 0; i < input.size(); i++) {
			inputs.add(input.get(i));
		}
	}
	public String getType() {
		return type;
	}
	
	public Vector<String> getInput() {
		return inputs;
	}
}