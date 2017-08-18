package java_training;

import java.sql.*;
import java.io.*;

public class database {
	private String dbhost = "jptrainingsql";
	private String dbname = "TAS_ThousandSunny";
	private String dbuname = "thousandsunny";
	private String dbpass = "b3tutuayaM";
	
	// Declare the JDBC objects.  
    Connection con = null; 
	
	private boolean initializeConnection(){
		// Create a variable for the connection string.  
	      String connectionUrl = "jdbc:sqlserver://"+this.dbhost+":1433;" +  
	         "databaseName="+dbname+";user="+dbuname+";password="+dbpass+";";   

	      try {  
	         // Establish the connection.  
	         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
	         con = DriverManager.getConnection(connectionUrl);  
	      }  

	      // Handle any errors that may have occurred.  
	      catch (Exception e) {  
	         e.printStackTrace();  
	      }  
	      return true;
	}
	
	private boolean closeConnection(){
	      if (con != null) try { con.close(); } catch(Exception e) {}  
	      return true;
	}
	
	public boolean insertEmployeeToDB(employee Employee){
		if (initializeConnection()){
			try{
				ByteArrayInputStream photo = new ByteArrayInputStream(Employee.getPhoto());
				Statement stm=null;
				PreparedStatement ps =null;
				String setIdentityOn = "SET IDENTITY_INSERT [EmployeeDummy] ON;";
				String setIdentityOff = "SET IDENTITY_INSERT [EmployeeDummy] OFF;";

				stm = con.createStatement();
				ps = con.prepareStatement("INSERT INTO [EmployeeDummy] (EmployeeDummyId, EmployeeDummyName, EmployeeDummyPhoto) VALUES (?, ?, ?);");
				stm.execute(setIdentityOn);
				ps.setInt(1, Employee.getId());
		        ps.setString(2, Employee.getName());
		        ps.setBinaryStream(3, photo, (int)Employee.getPhoto().length);
		        ps.executeUpdate();
		        ps.close();
		        stm.execute(setIdentityOff);
			}
			catch (Exception e) {  
		         e.printStackTrace();  
		    }
			finally {
				closeConnection();
			}
			return true;
		}
		else{
			return false;
		}
	}
	public int[] getAllEmployeeID(){
		int[] result =null;
		if (initializeConnection()){
			try{
				Statement stmt = null;
				stmt = con.createStatement(); 
				ResultSet rs = null;
				
				ResultSet rsSize = stmt.executeQuery("SELECT COUNT (*) FROM [EmployeeDummy]");
				int rsLength=0;
		        while (rsSize.next())
		        {
		        	rsLength = rsSize.getInt(1);
		        }
		        result = new int[rsLength];
		        
		        String SQL = "SELECT EmployeeDummyId FROM [EmployeeDummy]";
		        rs = stmt.executeQuery(SQL);
		        
		        int i = 0;
		        while (rs.next()){
		        	result[i]=rs.getInt(1);
		        	i++;
		        }
			}
			catch (Exception e) {  
		         e.printStackTrace();  
		    }
		}
		return result;
	}
	
	public employee getEmployeeFromDB(int EmployeeID){
		employee result = null;
		if (initializeConnection()){
			try{
				Statement select = null;
				ResultSet rs = null; 
				result = new employee();
				String SQL = "SELECT * FROM [EmployeeDummy] WHERE EmployeeDummyId = "+EmployeeID;
				select = con.createStatement(); 
				rs = select.executeQuery(SQL);
				while (rs.next()){
					result.set(rs.getInt(1), rs.getString(2), rs.getBytes(3));
				}
			}
			catch (Exception e) {  
		         e.printStackTrace();  
		    }
			finally {
				closeConnection();
			}
		}
		return result;
	}
}
