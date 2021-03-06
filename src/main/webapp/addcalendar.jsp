<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Calendar</title>

<style>
{
box-sizing
:
 
border-box
;


}
#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
	display:none;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">UTCalendar</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h1>Add Schedules</h1>
		<p>Select the schedule you want to add from the dropdown menu</p>
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for schedules.." title="Type in a name">

		<table id="myTable">
			<tr class="header">
				<th style="width: 60%;">Schedule</th>
				<th style="width: 30%;">Author</th>
				<th style="width: 10%;"></th>
			</tr>
			<tr>
				<td>Course Schedules</td>
				<td>Katelyn Ge</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Course Schedules')">Add</a> </td>
			</tr>
			<tr>
				<td>WECE Social Calendar</td>
				<td>Vidita Dixit</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'WECE Social Calendar')">Add</a> </td>
			</tr>
			<tr>
				<td>Theta Tau Events</td>
				<td>Kirtana Moorthy</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Theta Tau Events')">Add</a> </td>
			</tr>
			<tr>
				<td>SEEK Calendar</td>
				<td>Rebecca Jiang</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'SEEK Calendar')">Add</a> </td>
			</tr>
			<tr>
				<td>Office Fan Club</td>
				<td>Katelyn Ge</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Office Fan Club')">Add</a> </td>
			</tr>
			<tr>
				<td>Brooklyn 99 Fan Club</td>
				<td>Kirtana Moorthy</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Brooklyn 99 Fan Club')">Add</a> </td>
			</tr>
			<tr>
				<td>Liars Club</td>
				<td>Gunalan Karun</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Liars Club')">Add</a> </td>
			</tr>
			<tr>
				<td>Is There A Quiz Today</td>
				<td>Irfan Hasan</td>
				<td><a href="javascript:void(0)" onclick="addSchedule(1,'Is There A Quiz Today')">Add</a> </td>
			</tr>
		</table>

		<div id="mySchedule">
		</div>
		
		<script>
			function myFunction() {
				
				var input, filter, table, tr, td, i;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				table = document.getElementById("myTable");
				tr = table.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td")[0];
					if (td) {
						if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
						}
					}
				}
				if(input.value=="" || input.value=="Search for schedules.."){
					$("#myTable").hide();
				}
				else{ 
					$("#myTable").show();
				}
				
			}
			//NEED TO IMPLEMENT THIS
			function addSchedule(scheduleID, scheduleName){
				content=$("#mySchedule").html()+"<br>"+scheduleName;
				$("#mySchedule").html(content);
				//send request to server, add ID
				/*$.ajax({
					  url: "doAddSchedule.jsp?id="+scheduleID,
					}).done(function( data ) {
						  content=$("#mySchedule").html()+"<br>"+scheduleName;
							$("#mySchedule").html(content);
					  }); */
			}
		</script>


		<div class="col-sm-11" style="padding-bottom: 5px; padding-left: 50px">
			<button type="submit" class="btn btn-primary pull-left" onclick="location.href='newschedule.jsp'">Create
				New Schedule</button>
		</div>
		<div class="col-sm-11" style="padding-bottom: 5px; padding-left: 50px">
			<button type="submit" class="btn btn-primary pull-left" onclick="location.href='calendar.jsp'">Back To Calendar</button>
		</div>

	</div>
</body>



</html>