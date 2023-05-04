<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page isELIgnored="false"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat"%>
<%@ page import = "connection.DB"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700');

$base-spacing-unit: 24px;
$half-spacing-unit: $base-spacing-unit / 2;

$color-alpha: #1772FF;
$color-form-highlight: #EEEEEE;

*, *:before, *:after {
	box-sizing:border-box;
}

body {
	padding:$base-spacing-unit;
	font-family:'Source Sans Pro', sans-serif;
	margin:0;
}

h1,h2,h3,h4,h5,h6 {
	margin:0;
}

.container {
	margin-top:0px;
	max-width: 1500px;
	margin-right:auto;
	margin-left:auto;
	display:flex;
	justify-content:center;
	align-items:center;
}

.table {
	width:100%;
	border:100px solid $color-form-highlight;
}

.table-header {
	display:flex;
	width:100%;
	background:#000;
	padding:($half-spacing-unit * 1.5) 0;
	justify-content:center;
     	align-items:center;
     	
}
.table-header{
     height:10vh;
     	width:100%;
     
     	justify-content:center;
     	align-items:center;
     


}
.table-row {
	display:flex;
	    
	
	width:100%;
	padding:($half-spacing-unit * 1.5) 0;
	
	&:nth-of-type(odd) {
		background:$color-form-highlight;
	}
}
.table-row{
   height:30vh;
   width:100%;
   color:white;
   	background:grey;
   	justify-content:center;
     	align-items:center;
   padding-bottom: 60px;
}

.divScroll
{
Width-5px;
Height-10 px;
Overflow-x:scroll;
}

.table-data, .header__item {
	flex: 1 1 20%;
	text-align:center;
}

.header__item {
	text-transform:uppercase;
}
.table-data{
padding-right: 0px;
	padding-left: 0px;

}

.filter__link {
	color:white;
	text-decoration: none;
	position:relative;
	display:inline-block;
	padding-left:$base-spacing-unit;
	padding-right:$base-spacing-unit;
	
	&::after {
		content:'';
		position:absolute;
		right:-($half-spacing-unit * 1.5);
		color:white;
		font-size:$half-spacing-unit;
		top: 50%;
		transform: translateY(-50%);
	}
	
	&.desc::after {
		content: '(desc)';
	}

	&.asc::after {
		content: '(asc)';
	}
	
}
.button{
  background: #FF4742;
  border: 1px solid #FF4742;
  border-radius: 6px;
  box-shadow: rgba(0, 0, 0, 0.1) 1px 2px 4px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  font-family: nunito,roboto,proxima-nova,"proxima nova",sans-serif;
  font-size: 16px;
  font-weight: 800;
  line-height: 16px;
  min-height: 40px;
  outline: 0;
  padding: 12px 14px;
  text-align: center;
  text-rendering: geometricprecision;
  text-transform: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: middle;
  margin-left: 15px;
}

.button:hover,
.button:active {
  background-color: grey;
  background-position: 0 0;
  color: white;
}

.button:active {
  opacity: .5;
}
a:link, a:visited {
  background-color: #f44336;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: red;
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('images/1.jpg');">
<center><h2 style="color:white;background-color:black;font-size:46px; margin-top: 100px;"> FILTER MATERIALS</h2></center><br>
<form action="Adindex.html">
<button class="button">BACK</button><br>
</form><br>
<div class="container">
	
	<div class="table">
		<div class="table-header">
			<div class="header__item"><a style="background-color: black;" id="wins" class="filter__link filter__link--number" href="#">CementCompany</a></div>
			<div class="header__item"><a  style="background-color: black;" id="losses" class="filter__link filter__link--number" href="#">SteelCompany</a></div>
			<div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">BrickItem</a></div>
		    <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">SandItems</a></div>
			  <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">WoodItem</a></div>
			 <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">TilesItem</a></div>
			 <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">AggregateItem</a></div>
			 <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">ProjectDetails</a></div>
			 <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">ProjectDetails</a></div>
			 <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">ProjectDetails</a></div>
		     <div class="header__item"><a  style="background-color: black;" id="total" class="filter__link filter__link--number" href="#">Action</a></div>
		     
		</div><br>
		
		 <% 	 
		// HttpSession session1 = request.getSession();
		  String budget1 = request.getParameter("budget");
		  String budget2 = request.getParameter("budget");
		  String budgettype5 = request.getParameter("budgettype4");

	//	  System.out.println(budget1);
	//	  System.out.println(budgettype5);
        
 	//	  int budget2 = Integer.parseInt(budget1);
		//	 session.setAttribute("budget", budget);
  
        //     int budget1 =9990000; 
        	try{
				 	
					 Connection con=DB.getConnection();  
		             Statement stmt = con.createStatement();  
		            // if(budget2 == 9990000){
		             ResultSet rs = stmt.executeQuery("SELECT * FROM fixedmaterials ");  
		             
				 		while(rs.next())
				  		{
				  			%>
		<div class="table-content">	
			<div class="table-row">		
				<div class="table-data"><%=rs.getString("cementcompany") %><br><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("cementprice")  %></div>
				<div class="table-data"><%=rs.getString("steelcompany") %><br><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("steelprice") %></div>
				<div class="table-data"><%=rs.getString("brickitems") %><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("brickprice") %></div>
				<div class="table-data"><%=rs.getString("sanditems") %><br><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("sandprice") %></div>
				<div class="table-data"><%=rs.getString("wooditems") %><br><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("woodprice") %></div>
				<div class="table-data"><%=rs.getString("tilesitems") %><br><br><br>
				<h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("tilesprice") %></div>
			    <div class="table-data"><%=rs.getString("aggregateitems") %><br><br><br>
			    <h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("aggregateprice") %></div>
				<div class="table-data"> project Budget<br><br><br><br>
			    <h4 style="color: black;">PRICE:</h4>
				<%=rs.getString("projectbudget") %></div>
				<div class="table-data">Budget Type<br><br><br><br>
			    <h4 style="color: black;">Type:</h4>
				<%=rs.getString("budgettype") %></div>
				<div class="table-data">Square Feet<br><br><br><br>
			    <h4 style="color: black;">value:</h4>
				<%=rs.getString("squarefeet") %></div>
				
			<div class="table-data">
				<button > <td style=padding-left:30px;font-size:20px;><a href="estimation1.jsp?budget2=<%=rs.getString("projectbudget")  %>&&squarefeet2=<%=rs.getString("squarefeet") %>&&budgettype4=<%=rs.getString("budgettype") %>" class="btn btn-warning">DETAILS</a></td></button>
                 </div>
			</div>
		</div>	
		<%
					    }
		          //   }
		             
		             
		             
					    	}catch(Exception e)
					    {
					    		System.out.println(e);
					    }
      
				
					    	%>
					    	
				
					    	
					    	
					    	
	</div>
</div>
<script>
var properties = [
	'name',
	'wins',
	'draws',
	'losses',
	'total',
];

$.each( properties, function( i, val ) {
	
	var orderClass = '';

	$("#" + val).click(function(e){
		e.preventDefault();
		$('.filter__link.filter__link--active').not(this).removeClass('filter__link--active');
  		$(this).toggleClass('filter__link--active');
   		$('.filter__link').removeClass('asc desc');

   		if(orderClass == 'desc' || orderClass == '') {
    			$(this).addClass('asc');
    			orderClass = 'asc';
       	} else {
       		$(this).addClass('desc');
       		orderClass = 'desc';
       	}

		var parent = $(this).closest('.header__item');
    		var index = $(".header__item").index(parent);
		var $table = $('.table-content');
		var rows = $table.find('.table-row').get();
		var isSelected = $(this).hasClass('filter__link--active');
		var isNumber = $(this).hasClass('filter__link--number');
			
		rows.sort(function(a, b){

			var x = $(a).find('.table-data').eq(index).text();
    			var y = $(b).find('.table-data').eq(index).text();
				
			if(isNumber == true) {
    					
				if(isSelected) {
					return x - y;
				} else {
					return y - x;
				}

			} else {
			
				if(isSelected) {		
					if(x < y) return -1;
					if(x > y) return 1;
					return 0;
				} else {
					if(x > y) return -1;
					if(x < y) return 1;
					return 0;
				}
			}
    		});

		$.each(rows, function(index,row) {
			$table.append(row);
		});

		return false;
	});

});

</script>
</body>
</html>