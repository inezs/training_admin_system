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
package training.oop;

public class Main {

	public static void main(String[] args) {
		Dog Husky = new Dog("Husky", 3);
		Husky.setFood("Meat");
		System.out.println(Husky.eat());
		System.out.println(Husky.hasManyLegs());
		Husky.setLegs(4);
		System.out.println(Husky.hasManyLegs());
	}
}
