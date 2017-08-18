package java_training;

import java.io.*;
import org.apache.commons.io.IOUtils;

public class Main {
	public static void main(String[] args) {
		employee inputEmployee = new employee ();
		try{
			FileInputStream inputPhoto = new FileInputStream("E:/images.jpg");
			inputEmployee.set(3, "Jhonny", IOUtils.toByteArray(inputPhoto));
			database db = new database();
			db.insertEmployeeToDB(inputEmployee);
			System.out.println("Process executed successfully");
		}
		catch(Exception e) {  
	         e.printStackTrace();  
	    }
	}  
}
