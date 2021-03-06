package utcalendar;

import java.util.ArrayList;
import java.lang.String;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;


@Entity
public class Schedule {

	@Parent Key<Calendar> CalendarDatabase;
	@Id Long id;
	String title;
	boolean access; //public = true, private = false
	private ArrayList<String> studentList;
	public ArrayList<Long> events;
	
	public Schedule(){
		this.studentList=new ArrayList<String>();
		this.events= new ArrayList<Long>();
	}
	
	public Schedule(String title, ArrayList<String> students, boolean access, ArrayList<Long> events) {
		this.title = title;
	/*	if (access) {
			this.studentList = new ArrayList<String>();
			
		} else {
			this.studentList = students;
		}*/
		this.studentList=new ArrayList<String>();
		this.events = events;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public void setTitle(String title){
		this.title= title;
	}
	
	public void setAccess(String access){
		if(access.equals("public")){
			this.access=true;
		}
		else if(access.equals("private")){
			this.access=false;
		}
	}
	
	public void addStudent(String user) {
		this.studentList.add(user);
	}
	
	public void deleteStudent(String user) {
		this.studentList.remove(user);
	}
	
	public void addEvent(Long event) {
		this.events.add(event);
	}
	
	public void deleteEvent(Long event) {
		this.events.remove(event);
	}
	
}
