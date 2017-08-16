package training.jte;

public class Main extends Thread {
	private Thread t;
	private String threadName;
	
	Main(String name) {
	   threadName = name;
	   System.out.println("Creating " +  threadName );
	}
	   
	public void run() {
	   System.out.println("Running " +  threadName );
	   //emulating the progress run in a system
	   try {
	      for(int i = 4; i > 0; i--) {
	         System.out.println(threadName + ": " + i);
	         Thread.sleep(50);
	      }
	   }catch (InterruptedException e) {
		 //if there is an interruption, don't crash. just tell me it happened.
		   System.out.println(threadName + " interrupted.");
	   }
	   System.out.println(threadName + " exiting.");
	}
	   
	public void start () {
	   System.out.println("Starting " +  threadName );
	   //checking if the thread is spawned or not
	   if (t == null) {
	      t = new Thread (this, threadName);
	      t.start ();
	   }
	}
	public static void main(String[] args) {
		//spawn Thread 1
		Main T1 = new Main("Thread-1");
	    T1.start();
	    
	    //spawn Thread 2
	    Main T2 = new Main("Thread-2");
	    T2.start();
	    
	    //spawn Thread 3
	    Main T3 = new Main("Thread-3");
	    T3.start();
	    
	    //spawn Thread 4
	    Main T4 = new Main("Thread-4");
	    T4.start();
	   }   
		
	}

