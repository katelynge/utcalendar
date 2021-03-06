package utcalendar;

import java.util.ArrayList;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;


import java.lang.String;


@Entity
public class User {
	
	@Id Long id;
	public String name;
	private String email;
	private String password;
	public ArrayList<String> toDoList;
	
	Calendar calendar;
	
	public User(){
		
	}
	
	public User(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;
		calendar = new Calendar();
		toDoList = new ArrayList<String>();
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void editName(String newName) {
		this.name = newName;
	}
	
	public void editEmail(String newEmail) {
		this.email = newEmail;
	}
	
	public void editPassword(String newPassword) {
		this.password = newPassword;
	}
	
	public void addItem(String item) {
		toDoList.add(item);
	}
	
	public void deleteItem(String item) {
		toDoList.remove(item);
	}
	
	public void updateCalendar(Schedule schedule) {
		this.calendar.updateSchedule(schedule);
	}
	
	public String toString() {
		return this.name;
	}
}
