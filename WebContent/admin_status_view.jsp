<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page isELIgnored="false"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat"%>
<%@ page import = "connection.DB"%>


<!doctype html>
<html lang="en">
  <head>
  <style>
table th {
  color:red;
  background-color:black;
}
table td {
  border: 1px solid black;
  
  
}
 #overflowTest {

  color: green;
  padding: 15px;
  width: 80%;
  height: 80px;
  overflow: scroll;
  border: 1px solid #ccc;
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
  
  margin-left: -840px;
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
  	<title>Table 09</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="assets13/css/style.css">

	</head>
	<body style="background-image: url('images/1.jpg');">
	<section class="ftco-section">
		<div class="container">
		      <center><h2 style="color:white;background-color:black;font-size:46px;"> Project Status</h2></center><br>
	  
          <tbody>
						    

						    <tr style="margin:0;padding-left:0;color: white;">
						    
						        
					<%-- 	       <td><form method="post" action="Admingenkey">
                                     <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                     <button style="background:green", "cursor:pointer">generate key</button>
                                     </form></td>  --%>
						    </tr>
						    </thead>
						   
            
		
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
				</div>
				<form action="Adindex.html">
<button class="button">BACK</button><br>
</form><br><br>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-striped">
						  <thead>
						    <tr style="color: white;font-size:20px;">
						       <th style="color: white;font-size:20px;">Date</th>
						      <th style="color: white;font-size:20px;">Project Status</th>
						 
						      	  
						      
						      <th></th>
						      <th></th>
						      
						    </tr>
						  </thead>
						  <% 	 
			     			HttpSession session1 = request.getSession();
						  String budget1=null,squarefeet1=null;
						  String type = request.getParameter("type");
							String budgettype = request.getParameter("budgettype");

							
							 session.setAttribute("type", type);
							 session.setAttribute("budgettype", budgettype);



				try{
				 	
					 Connection con=DB.getConnection();  
		             Statement stmt = con.createStatement();  
		             ResultSet rs = stmt.executeQuery("SELECT * FROM projectstatusup");  
				  
				 		while(rs.next())
				  		{
				 			
				  			%>
          <tbody>
						    

						    <tr style="margin:0;padding-left:0;color: white;">
						      <td style=padding-left:30px;font-size:20px;><%=rs.getString("date") %></td>
						      <td style=padding-left:30px;font-size:20px;><%=rs.getString("status") %></td>
						     
						        
					<%-- 	       <td><form method="post" action="Admingenkey">
                                     <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                     <button style="background:green", "cursor:pointer">generate key</button>
                                     </form></td>  --%>
						    </tr>
						    </thead>
						    <%
					    }
					    		
					    	}catch(Exception e)
					    {
					    		System.out.println(e);
					    }
					    	%>
            
          </tbody>
						   
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="assets13/js/jquery.min.js"></script>
  <script src="assets13/js/popper.js"></script>
  <script src="assets13/js/bootstrap.min.js"></script>
  <script src="assets13/js/main.js"></script>

	</body>
</html>

