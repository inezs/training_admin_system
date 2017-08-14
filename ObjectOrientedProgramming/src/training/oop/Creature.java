/* @(#) $Header: Creature.java, v 1.0 2017/08/14 Yuliawan Rizka Syafaat $
*
* Classname Creature.java
* * Copyright (c) 2017, PT. Mitrais, Sanur, Bali, Indonesia.
* All rights reserved.
*
* Revision History
* 14-Aug-2017 Yuliawan Rizka Syafaat [1.0]-Initial Coding
*
*/
package training.oop;
/**
 * 
 * This class represent the initial value of Creature.
 *
 */
public class Creature {
	protected int legCount = 0;
	protected String food = "?";
	protected String name = "?";
	
	/**
	 * This function is for set the food name of a creature.
	 * @param foodName	This is the parameter to set food of creature.
	 */
	public void setFood(String foodName){
		this.food = foodName;
	}
	/**
	 * This function is for showing the value of legs from a creature.
	 * @return A string with format "[creature name] has [this many] Legs"
	 */
	public String hasManyLegs(){
		return this.name + " has " + this.legCount + " Legs";
	}
}
