<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% String a = request.getParameter("search");%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    <!-- for google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 


    <!-- Now lets start styling -->
   <style>
        
        /* css untuk body */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
            .main {
  margin-left: 220px;
                margin-top: 2%;
                margin-right: 5%;
                
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
     /* tutup css body */   
        
        /* css untuk menu tepi */
        
        .side-nav {
            height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
        }
    
        .sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}
        #close{
            position: relative;
            color: white;
            top: -3%;
            left: 81%;
        }
        #close:hover, #ham:hover{
            color: gray;
            cursor: pointer;

        }
        #ham{
            position: absolute;
            top: 3%;
            left: 3%;
            color: white;
            background-color: #191b1f;
            border-radius: 25px;
            padding: 8px;
            display: none;
        }
        
        .menu {
            margin-left: 15px;
        }
        
        ul {
            display: flex;
            flex-direction: column;
            padding: 0;
            margin: 0;
            width: 100%;
        }
        
        a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 0 20px;
            border-bottom: 1px solid rgb(97, 94, 94);
        }
        
        a:hover {
            background-color: rgb(19, 18, 18);
            color: rgb(148, 145, 145);
        }
        
        li {
            list-style-type: none;
            display: flex;
            align-items: center;
            margin: 15px auto;
        }
        
        .material-icons-outlined {
            font-size: 30px;
        }
        
        header {
            font-size: 30px;
            margin: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(97, 94, 94);
            text-align: center;
            color: white;
            user-select: none;
        }
        @media screen and (max-width:600px) {
            .side-nav{
                display: none;
            }
            #ham{
                display: block;
            }
        }
        /* tutup css menu */
        
        
        
         /* table for parcel */
 


/*perkataan list parcel */
.tm-block-title {
  font-size: 2.0rem;
  color: #333;
  margin-bottom: 10px;
}
table
        {
         
    margin-top:1%;
}   
        }
/* button add new parcel*/
.btn-small {
  padding: 10px 24px;
}

.btn-primary {
  background-color: rgba(40,57,101,.9);
  color: white;
  
  border-color: #999999;
}



.tm-bg-gray {
  background-color: rgba(40,57,101,.9);
}
        

.material-icons-outlined {
  color: #6e6c6c;
  cursor: pointer;
}

.material-icons-outlined:hover {
  color: #9f1321;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr
    
    {background-color: #f2f2f2}

th {
  background-color: rgba(40,57,101,.9);
  color: white;
}
    
 /* tutup table */
       
        * {
  box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
 padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 20%;
  background: #f2f2f2;
 margin-left:560px;
}

/* Style the submit button */
form.example button {
 float: left;
  width: 5%;
  padding: 10px;
  background: darkblue;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
        
    </style>


</head>

<body style="background-color:#CBCCBB">

    <!-- Lets start making our side navigation menu -->

      <!-- now lets add a hamburger btn -->
      <span class="material-icons-outlined" id="ham">
        menu
        </span>

    <div class="side-nav">

      
        <span class="material-icons-outlined" id="close">
            close
            </span>
        <header>PARCEL</header>
      <ul>
            <a href="ParcelPage.jsp"  >
                <li><span class=" material-icons-outlined">
                        upload
                    </span> <span class="menu">Key In</span> </li>
            </a>
            <a href="RegisterStaff.jsp" >
                <li><span class="material-icons-outlined">
                    add
                    </span><span class="menu">Register Staff</span></li>
            </a>
            <a href="HistoryPage.jsp" class="active">
                <li><span class="material-icons-outlined">
                        history
                    </span><span class="menu">History</span></li>
            </a>
            <a href="ProfileStaffPage.jsp">
                <li><span class="material-icons-outlined">
                        account_circle
                    </span><span class="menu">Profile</span></li>
            </a>
            <a href="LoginIndex.jsp">
                <li><span class="material-icons-outlined">
                        logout
                    </span><span class="menu">Log out</span></li>
            </a>
           

        </ul>

        
    </div>

    <!-- lets add some javascript -->
    <script>
        let close_btn = document.querySelector('#close')
        let ham = document.querySelector('#ham')

        let nav = document.querySelector('.side-nav')

        close_btn.addEventListener('click',()=>{
            nav.style.display = "none"
            ham.style.display = "block"

        })
        ham.addEventListener('click',()=>{
            nav.style.display = "block"
            ham.style.display = "none"

        })

        
    </script>
    
    
    <div class="main">
     <%
                                
                                try {
                            		Class.forName("com.mysql.jdbc.Driver");
                            		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
                            		
                
                            		Statement stmt = con.createStatement();
                            		
                            		String sql = "SELECT * FROM history WHERE  Parcel_code =" + a;
                            		ResultSet rs = stmt.executeQuery(sql);
                            		 
                            		%>
                            		
             
        <h1>History</h1> 
        <form class="example" action="search.jsp" method="post">
  <input type='text' placeholder='Search..' name='search'>
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
        <br>
        <table>
        
        <tr class="tm-bg-gray">
            <th>Parcel Code</th>
            <th>Staff ID </th>
            <th>Student ID</th>
            <th>Name</th>
            <th>Contact Number</th>
            <th>Receiver Student ID</th>
            <th>Receiver Number</th>
            <th>Pickup Date</th>
             <th scope="col">Delete</th>
             
            </tr>
            
             
                            		<%
                            		while(rs.next()) { 
                            		
                            	%>
                            	
        <tr class="tm-bg-white">
            <th><%=rs.getString("Parcel_code") %></th>
            <th><%=rs.getString("Staff_ID") %></th>
            <th><%=rs.getString("Student_ID") %></th>
            <th><%=rs.getString("Name") %></th>
            <th><%=rs.getString("Phone") %></th>
            <th><%=rs.getString("Receiver_ID") %></th>
            <th><%=rs.getString("Receiver_Phone") %></th>
            <th><%=rs.getString("Date") %></th>
           <th><a class="material-icons-outlined" href="deletehistory.jsp?delete= <%=rs.getString("Parcel_Code") %>">delete</a></th>
           
            </tr>
            
            	  <%
                            		}
                                }
                            	catch (Exception e2)
                                {
                            		System.out.println(e2);
                                }
                                out.close();
                                
                            			  %>
       
        </table>
        
    </div>
</body>
</html>