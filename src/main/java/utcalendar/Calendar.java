package utcalendar;

import java.util.ArrayList;
import java.util.Date;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.annotation.Index;


import java.lang.String;

@Entity
public class Calendar {
	
	@Parent Key<User> UserDatabase;
	@Id public Long id;
	@Index public Date currentDate;
	ArrayList<Schedule> schedules;
	
	public Calendar() {
		this.currentDate = new Date();
		
	}
	
	public void addSchedule(Schedule schedule) {
		schedules.add(schedule);
	}
	
	public void updateSchedule(Schedule schedule) {
		for (int i = 0; i < schedules.size(); i++) {
			if (schedules.get(i).getTitle().equals(schedule.getTitle())) {
				schedules.remove(i);
				schedules.add(schedule);
				break;
			}
		}
	}
	
	public void deleteSchedule(Schedule schedule) {
		schedules.remove(schedule);
	}
	
}
