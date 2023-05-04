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
  margin-left:15px;
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
	<script>
	alert("successfully Estimated");
	</script>
	<div class="table">
		<div class="table-header">
			<div class="header__item"><a id="wins" class="filter__link filter__link--number" href="#">Cement</a></div>
			<div class="header__item"><a id="losses" class="filter__link filter__link--number" href="#">Steel</a></div>
			<div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">Brick</a></div>
		    <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">Sand</a></div>
			 <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">Tiles</a></div>
			 <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">Fittings</a></div>
			 <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">ArchitectureCost</a></div>
			 <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">LabourCost</a></div>
			 <div class="header__item"><a id="total" class="filter__link filter__link--number" href="#">TotalCost</a></div>
		     
		</div><br>
		
		 <% 	 
					// HttpSession session1 = request.getSession();
					  String budget1 = request.getParameter("budget");
					  String squarefeet1 = request.getParameter("squarefeet");
					  String budgettype5 = request.getParameter("budgettype4");
			          
					  int squarefeet2 = Integer.parseInt(squarefeet1);
			    //      double cementq = squarefeet1 * cement;
					  System.out.println(budget1);
					  System.out.println(squarefeet1);
					  System.out.println(budgettype5);
					  int lowtotal = squarefeet2 * 800; 
					  int medtotal = squarefeet2 * 1000;
					  int higtotal = squarefeet2 * 1200;
			        %>
			        
			        <%
			        if (budgettype5.equals("mediumbudget")){
			        	double val1 = (12.8/100) * (medtotal);
			        	double val2 = (11.0/100) * (medtotal);
			        	double val3 = (4.0/100) * (medtotal);
			        	double val4 = (6.2/100) * (medtotal);
			        	double val5 = (10.0/100) * (medtotal);
			        	double val6 = (8.0/100) * (medtotal);
			        	double val7 = (10.0/100) * (medtotal);
			        	double val8 = (37.0/100) * (medtotal);
			        	double val9 = (val1+val2+val3+val4+val5+val6+val7+val8);
        	try{
				 	
					 Connection con=DB.getConnection();  
		             Statement stmt = con.createStatement();  
		            // if(budget2 == 9990000){
          String sql="insert into materialcost(cement,steel,brick,sand,tiles,fittings,Architecture,labour,total,budget,budgettype,squarefeet) values(?,?,?,?,?,?,?,?,?,?,?,?)";
          PreparedStatement ps=con.prepareStatement(sql);
      	ps.setDouble(1, val1);
      	ps.setDouble(2, val2);
      	ps.setDouble(3, val3);
      	ps.setDouble(4, val4);
      	ps.setDouble(5, val5);
      	ps.setDouble(6, val6);
      	ps.setDouble(7, val7);
      	ps.setDouble(8, val8);
      	ps.setDouble(9, val9);
      	ps.setString(10, budget1);
      	ps.setString(11, budgettype5);
      	ps.setString(12, squarefeet1);
      	
      	int aa=ps.executeUpdate();
		            	ResultSet rs = stmt.executeQuery("SELECT * FROM fixedmaterials ");  
		             
				 		while(rs.next())
				  		{
				  			%>
		<div class="table-content">	
			<div class="table-row">		
				<div class="table-data"><%=rs.getString("cementcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 12.8%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val1 %> </div>
							<div class="table-data"><%=rs.getString("steelcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 11%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val2 %> </div>
							<div class="table-data"><%=rs.getString("brickitems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 4%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val3  %> </div>
							<div class="table-data"><%=rs.getString("sanditems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 6.2</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val4  %></div>
							
							<div class="table-data">Flooring, Painting, Tiles & Gravel <br><br><br>
							<h4 style="color: black;">QUANTITY: 10%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val5%></div>
						    <div class="table-data">Fittings <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 8%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val6%></div>
							<div class="table-data">Architecture Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 10%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val7 %></div>
				            <div class="table-data">Labour Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 37%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val8 %></div>
							<div class="table-data">Total Cost <br><br><br><br>
						    <h4 style="color: black;">PRICE</h4>
							<%=val9 %></div>
				
			
			</div>
		</div>	
		<%
					    }
		          //   }
		             
		             
		             
					    	}catch(Exception e)
					    {
					    		System.out.println(e);
					    }
      
			        }
					    	%>
					    	
				
				 <%
			        if (budgettype5.equals("lowbuget")){
			        	double val1 = (12.8/100) * (lowtotal);
			        	double val2 = (11.0/100) * (lowtotal);
			        	double val3 = (4.0/100) * (lowtotal);
			        	double val4 = (6.2/100) * (lowtotal);
			        	double val5 = (10.0/100) * (lowtotal);
			        	double val6 = (8.0/100) * (lowtotal);
			        	double val7 = (10.0/100) * (lowtotal);
			        	double val8 = (37.0/100) * (lowtotal);
			        	double val9 = (val1+val2+val3+val4+val5+val6+val7+val8);
        	try{
				 	
					 Connection con=DB.getConnection();  
		             Statement stmt = con.createStatement();  
		            // if(budget2 == 9990000){
		            	String sql="insert into materialcost(cement,steel,brick,sand,tiles,fittings,Architecture,labour,total,budget,budgettype,squarefeet) values(?,?,?,?,?,?,?,?,?,?,?,?)";
          PreparedStatement ps=con.prepareStatement(sql);
      	ps.setDouble(1, val1);
      	ps.setDouble(2, val2);
      	ps.setDouble(3, val3);
      	ps.setDouble(4, val4);
      	ps.setDouble(5, val5);
      	ps.setDouble(6, val6);
      	ps.setDouble(7, val7);
      	ps.setDouble(8, val8);
      	ps.setDouble(9, val9);
      	ps.setString(10, budget1);
      	ps.setString(11, budgettype5);
      	ps.setString(12, squarefeet1);
      	int aa=ps.executeUpdate();
		             ResultSet rs = stmt.executeQuery("SELECT * FROM fixedmaterials ");  
		             
				 		while(rs.next())
				  		{
				  			%>
		<div class="table-content">	
			<div class="table-row">		
				<div class="table-data"><%=rs.getString("cementcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 12.8%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val1 %> </div>
							<div class="table-data"><%=rs.getString("steelcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 11%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val2 %> </div>
							<div class="table-data"><%=rs.getString("brickitems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 4%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val3  %> </div>
							<div class="table-data"><%=rs.getString("sanditems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 6.2%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val4  %></div>
							
							<div class="table-data">Flooring, Painting, Tiles & Gravel <br><br><br>
							<h4 style="color: black;">QUANTITY: 10%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val5%></div>
						    <div class="table-data">Fittings <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 8%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val6%></div>
							<div class="table-data">Architecture Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 10%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val7 %></div>
				            <div class="table-data">Labour Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 37%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val8 %></div>
							<div class="table-data">Total Cost <br><br><br><br>
						    <h4 style="color: black;">PRICE</h4>
							<%=val9 %></div>
				
			<div class="table-data">
				<button class="button"> <td style=padding-left:30px;font-size:20px;><a href="estimation1.jsp?budget2=<%=rs.getString("projectbudget")  %>&&squarefeet2=<%=rs.getString("squarefeet") %>&&budgettype4=<%=rs.getString("budgettype") %>" class="btn btn-warning">GO</a></td></button>
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
      
			        }
					    	%>	    	
					    	
					  <%
			        if (budgettype5.equals("highbudget")){
			        	double val1 = (12.8/100) * (higtotal);
			        	double val2 = (11.0/100) * (higtotal);
			        	double val3 = (4.0/100) * (higtotal);
			        	double val4 = (6.2/100) * (higtotal);
			        	double val5 = (10.0/100) * (higtotal);
			        	double val6 = (8.0/100) * (higtotal);
			        	double val7 = (10.0/100) * (higtotal);
			        	double val8 = (37.0/100) * (higtotal);
			        	double val9 = (val1+val2+val3+val4+val5+val6+val7+val8);
        	try{
				 	
					 Connection con=DB.getConnection();  
		             Statement stmt = con.createStatement();  
		            // if(budget2 == 9990000){
		            	String sql="insert into materialcost(cement,steel,brick,sand,tiles,fittings,Architecture,labour,total,budget,budgettype,squarefeet) values(?,?,?,?,?,?,?,?,?,?,?,?)";
          PreparedStatement ps=con.prepareStatement(sql);
      	ps.setDouble(1, val1);
      	ps.setDouble(2, val2);
      	ps.setDouble(3, val3);
      	ps.setDouble(4, val4);
      	ps.setDouble(5, val5);
      	ps.setDouble(6, val6);
      	ps.setDouble(7, val7);
      	ps.setDouble(8, val8);
      	ps.setDouble(9, val9);
      	ps.setString(10, budget1);
      	ps.setString(11, budgettype5);
      	ps.setString(12, squarefeet1);
      	int aa=ps.executeUpdate();
		             ResultSet rs = stmt.executeQuery("SELECT * FROM fixedmaterials ");  
		             
				 		while(rs.next())
				  		{
				  			%>
		<div class="table-content">	
			<div class="table-row">		
				<div class="table-data"><%=rs.getString("cementcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY:12.8%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val1 %> </div>
							<div class="table-data"><%=rs.getString("steelcompany") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 11%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val2 %> </div>
							<div class="table-data"><%=rs.getString("brickitems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 4%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val3  %> </div>
							<div class="table-data"><%=rs.getString("sanditems") %><br><br><br><br>
							<h4 style="color: black;">QUANTITY: 6.2%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val4  %></div>
							
							<div class="table-data">Flooring, Painting, Tiles & Gravel <br><br><br>
							<h4 style="color: black;">QUANTITY: 10%</h4>
							<h4 style="color: black;">PRICE</h4>
							<%=val5%></div>
						    <div class="table-data">Fittings <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 8%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val6%></div>
							<div class="table-data">Architecture Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 10%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val7 %></div>
				            <div class="table-data">Labour Cost <br><br><br><br>
						    <h4 style="color: black;">QUANTITY: 37%</h4>
						    <h4 style="color: black;">PRICE</h4>
							<%=val8 %></div>
							<div class="table-data">Total Cost <br><br><br><br>
						    <h4 style="color: black;">PRICE</h4>
							<%=val9 %></div>
				
			<div class="table-data">
				<button class="button"> <td style=padding-left:30px;font-size:20px;><a href="estimation1.jsp?budget2=<%=rs.getString("projectbudget")  %>&&squarefeet2=<%=rs.getString("squarefeet") %>&&budgettype4=<%=rs.getString("budgettype") %>" class="btn btn-warning">GO</a></td></button>
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