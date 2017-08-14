/* @(#) $Header: Dog.java, v 1.0 2017/08/14 Yuliawan Rizka Syafaat $
*
* Classname Dog.java
* * Copyright (c) 2017, PT. Mitrais, Sanur, Bali, Indonesia.
* All rights reserved.
*
* Revision History
* 14-Aug-2017 Yuliawan Rizka Syafaat [1.0]-Initial Coding
*
*/
package training.oop;

public class Dog extends Creature implements Animal {
	/**
	 * Initialize the Dog with name and leg count.
	 * @param name		set name of the dog
	 * @param legCount	set leg count of the dog
	 */
	Dog(String name, int legCount){
		this.name = name;
		this.legCount = legCount;
	}
	/**
	 * This function is for showing the value of food from a creature.
	 * @return A string with format "[creature name] eating [this food]"
	 */
	public String eat(){
		return this.name + " eating " + this.food;
	}
	/**
	 * This function is for set the leg value of a creature.
	 * @param foodName	This is the parameter to set legs value of creature.
	 */
	public void setLegs(int legCount){
		this.legCount = legCount;
	}
}
