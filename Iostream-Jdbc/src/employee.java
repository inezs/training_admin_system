package java_training;

public class employee {
	private int id;
	private String name;
	private byte[] photo;
	
	public void set(int id, String name, byte[] photo){
		this.id = id;
		this.name = name;
		this.photo = photo;
	}
	
	public int getId(){
		return this.id;
	}
	
	public String getName(){
		return this.name;
	}
	
	public byte[] getPhoto(){
		return this.photo;
	}
}
