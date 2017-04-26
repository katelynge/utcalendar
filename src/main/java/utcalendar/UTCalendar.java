package utcalendar;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.googlecode.objectify.ObjectifyService;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;

public class UTCalendar extends HttpServlet {
	
	private static final long serialVersionUID = 7873689382144069751L;

	static {
        ObjectifyService.register(User.class);
        ObjectifyService.register(Calendar.class);
        ObjectifyService.register(Schedule.class);
        ObjectifyService.register(Event.class);
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = "";
		
		List<User> users=ObjectifyService.ofy().load().type(User.class).list();
		
		boolean user = false;
		
		for (User u : users) {
			if (u.getEmail().equals(username)) {
				if (u.getPassword().equals(password)) {
					name = u.getName();
					request.setAttribute("user", u);
					request.setAttribute("name", u.getName());
					request.setAttribute("toDoList", u.toDoList);
					user = true;
					break;
				}
			}
		}
		
		if (user) {
			response.sendRedirect("/calendar.jsp?user=" + name);
		} else {
			response.sendRedirect("/login.jsp");
		}
	}
}