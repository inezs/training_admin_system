/* @(#) $Header: Main.java, v 1.0 2017/08/14 Yuliawan Rizka Syafaat $
*
* Classname Main.java
* * Copyright (c) 2017, PT. Mitrais, Sanur, Bali, Indonesia.
* All rights reserved.
*
* Revision History
* 14-Aug-2017 Yuliawan Rizka Syafaat [1.0]-Initial Coding
*
*/
package training.fundamental;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Set;
import java.util.Map;


public class Main extends IOException {

	public static void main(String[] args) throws IOException {		
		try{
			byte a = 1;
			short b = 2;
			int c = 10;
			long d = 58;
			float e = 0.25f;
			double f = 0.25;
			boolean g = false;
			char[] h = {'A','B'};
			
			System.out.println("(byte) 1 + (short) 2 = " + ( a + b ));
			System.out.println("(int) 10 + (long) 58 = " + ( c + d ));
			System.out.println("(float) 0.25f + (double) 0.25 = " + ( e + f ));
			System.out.println(g);
			System.out.println(h);
			
			for(int i=0; i<10; i++){
				System.out.println("Print ke-"+(i+1));
			}
			List<String> var = new LinkedList<String>();
			var.add("Saya");
			var.add("Disini");
			var.add("Saya");
			System.out.println("List:");
			System.out.println(var);
			
			Set<String> var2 = new HashSet<String>();
			var2.add("Saya");
			var2.add("Disini");
			var2.add("Saya");
			System.out.println("Set:");
			System.out.println(var2);
			
			Map<String, String> var3 = new HashMap<String, String>();
			var3.put("Saya","11");
			var3.put("Disini", "11");
			var3.put("Saya", "20");
			System.out.println("Map:");
			System.out.println(var3);
			
			ArrayList al = new ArrayList();
		      
		    al.add("C");
		    al.add("A");
		    al.add("E");
		    al.add("B");
		    al.add("D");
		    al.add("F");

		    System.out.print("Original contents of al: ");
		    Iterator itr = al.iterator();
		      
		    while(itr.hasNext()) {
		    	Object element = itr.next();
		        System.out.print(element + " ");
		    }
		    System.out.println();
		      
		    ListIterator litr = al.listIterator();
		      
		    while(litr.hasNext()) {
		        Object element = litr.next();
		        litr.set(element + "+");
		    }
		    System.out.print("Modified contents of al: ");
		    itr = al.iterator();
		      
		    while(itr.hasNext()) {
		        Object element = itr.next();
		        System.out.print(element + " ");
		    }
		    System.out.println();

		    System.out.print("Modified list backwards: ");
		      
		    while(litr.hasPrevious()) {
		        Object element = litr.previous();
		        System.out.print(element + " ");
		    }
		    System.out.println();
			
		}
		finally
		{
			System.out.println("HAHAHA");
		}
	}
}

