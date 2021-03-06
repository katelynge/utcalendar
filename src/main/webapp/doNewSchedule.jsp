<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utcalendar.User" %>
<%@ page import="utcalendar.Calendar" %>
<%@ page import="utcalendar.Schedule" %>
<%@ page import="utcalendar.Event" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.googlecode.objectify.annotation.Entity" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Integer" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Schedule to Database</title>

</head>
<body>

<table>
<%  //need to parse parameters so events are together in table
	//scheduleName, access, timeto#, timefrom#, validemail, date#, name#,
	Enumeration parameters = request.getParameterNames();
	ArrayList<String> ScheduleList = new ArrayList<String>(100);
	for(int i=0; i< 100; i++){
		ScheduleList.add("empty");
	}
	System.out.println(ScheduleList.size());
	while(parameters.hasMoreElements()){
		String parameterName = (String)parameters.nextElement();
		String parameterValue = request.getParameter(parameterName);
		if(parameterName.equals("scheduleName")){
			ScheduleList.set(0,parameterValue);
		}
		else if(parameterName.equals("access")){
			ScheduleList.set(1,parameterValue);
		}
		else if(parameterName.equals("validemail")){
			ScheduleList.set(2,parameterValue);
		}
		else{ //events
			int arrayIndex=0;
			int eventnum= Integer.parseInt(parameterName.substring(parameterName.length()-1));
			String parameter=parameterName.substring(0,parameterName.length()-1);
			if(parameter.equals("name")){
				arrayIndex=(eventnum*4)-1;
			}
			else if(parameter.equals("date")){
				arrayIndex=eventnum*4;
			}
			else if(parameter.equals("timefrom")){
				arrayIndex=(eventnum*4)+1;
			}
			else if(parameter.equals("timeto")){
				arrayIndex=(eventnum*4)+2;
			}
			ScheduleList.set(arrayIndex,parameterValue);
		}	
	}
	int endOfList=ScheduleList.indexOf("empty");
	ArrayList<String> newScheduleData = new ArrayList<String>();
	newScheduleData.addAll(ScheduleList.subList(0, endOfList));
	System.out.println(newScheduleData.toString());
	Schedule newSchedule = new Schedule();
	newSchedule.setTitle(newScheduleData.get(0)); //set name
	newSchedule.setAccess(newScheduleData.get(1)); //set access
	
	String emailString=newScheduleData.get(2);
	String[] emails=emailString.split("\\s+"); //set emails
	System.out.println(Arrays.asList(emails));
	for(int i=0; i<emails.length;i++){
		System.out.println(emails[i]);
		newSchedule.addStudent(emails[i].toString());
	}
	for(int i=3; i<newScheduleData.size();i=i+4){ //set events
		Event newEvent = new Event(newScheduleData.get(i), newScheduleData.get(i+1), newScheduleData.get(i+2), newScheduleData.get(i+3));
		newSchedule.addEvent(newEvent.getId());
		ObjectifyService.ofy().save().entity(newEvent).now();
	}
 /*   while(parameters.hasMoreElements()){
        String parameterName = (String)parameters.nextElement();
        String parameterValue = request.getParameter(parameterName); 
        if(parameterName.equals("scheduleName")){
        	newSchedule.setTitle(parameterValue);
        	
        }
        if(parameterName.equals("access")){
        	newSchedule.setAccess(parameterValue);
        }
        if(parameterName.equals("timeto1")){
        	
        } 
        out.write("<TR>");
            out.write("<TD>"+parameterName+"</TD>");
           out.write("<TD>"+parameterValue+"</TD>");
       out.write("</TR>");
  	} */
    ObjectifyService.ofy().save().entity(newSchedule).now(); //create new schedule in objectify
 %>
</table>
<%
	response.sendRedirect("addcalendar.jsp");
%>

</body>
</html>