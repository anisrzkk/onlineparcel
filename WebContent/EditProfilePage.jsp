<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% String Staff_ID = request.getParameter("edit"); %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <!-- for google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- Now lets start styling -->
    <style>
        
        /* css untuk body */
        body {
           
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
            .main {
  margin-left: 250px;
                margin-right: 50px;
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
        
        /*edit account */
    
        .form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgba(40,57,101,.9);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: rgba(40,57,101,.9);
    box-shadow: none
}

.profile-button:active {
    background: rgba(40,57,101,.9);
    box-shadow: none
}

.back:hover {
    color:rgba(40,57,101,.9);
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
        
         .column {
  float: left;
  width: 40%;
  padding: 0 10px;
             
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
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
            <a href="KeyInPage.jsp" >
                <li><span class=" material-icons-outlined">
                        upload
                    </span> <span class="menu">Key In</span> </li>
            </a>
            
            <a href="RegisterStaff.jsp">
                <li><span class="material-icons-outlined">
                    add
                    </span><span class="menu">Register Staff</span></li>
            </a>
            
            <a href="HistoryPage.jsp">
                <li><span class="material-icons-outlined">
                        history
                    </span><span class="menu">History</span>
                    </li>
            </a>
            
            <a href="ProfileStaffPage.jsp" class="active">
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

        close_btn.addEventListener('click',()=>
        {
            nav.style.display = "none"
            ham.style.display = "block"
        })
        
        ham.addEventListener('click',()=>
        {
            nav.style.display = "block"
            ham.style.display = "none"

        })

        
    </script>
    
    
    <div class="main" >
        
  <div class="container rounded bg-white mt-5 mb-1">
    <div class="row">
       
        <%
                                
                                try {
                            		Class.forName("com.mysql.jdbc.Driver");
                            		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
                            		
                            	
                            		Statement stmt = con.createStatement();
                            		
                            		String sql = "SELECT * FROM staff WHERE Staff_ID =" + Staff_ID ;;
                            		ResultSet rs = stmt.executeQuery(sql);
                            		
                            		while(rs.next()) { 
                            		
                            	%>
       <div class="column">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="150px" src="person2.png">
            <span class="font-weight-bold"><%=rs.getString("Staff_Name") %></span>
            <span class="text-black-50"><%=rs.getString("Staff_Number") %></span></div>
       
        </div>
              	
        <div class="column">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
              
                  <form action='UpdateStaff' method='post' class='keyinform'>
            <div class="row mt-2" >
            <label for='Parcel Code'>Name</label>
            <br> 
            <input name='Name' class="form-control" type='text' value ="<%=rs.getString("Staff_Name") %>"/>
                <br>
                
                
            <label for='number'>Mobile Number</label>
            <br>  
            <input class="form-control" id='phone' name='Phone' type='text' value ="<%=rs.getString("Staff_Number") %>"/>
                <br>  
                  
            <label for='Student ID'>Student ID</label>
            <br>  
            <input class="form-control" id='Student_ID' name='Student_ID' type='text' value ="<%=rs.getString("Staff_ID") %>" readonly/>
            
                <br>    
                
            <label for='Name'>Password</label>
            <br>  
            <input class="form-control" id='Name' name='pass' type='text' value ="<%=rs.getString("Staff_Password") %>"/>
                <br>
                

                
                 
            
        
</div>
<br>
<br>
<div class="row">
  <div class="column" >
  <input type="submit" class="button" value="Save" style="color:white; background-color:black" >  
  </div>
  <div class="column" >
  <a href="deleteaccount.jsp?delete= <%=rs.getString("Staff_ID") %>"> 
              <input width="5%" style="color:white; background-color:black" class="button" type="button" value="Delete Account"> </a>
  </div>
  </div>
  
     
                 </form>
           
                 <%
                            		}
                                }
                            	catch (Exception e2)
                                {
                            		System.out.println(e2);
                                }
                                out.close();
                                %>
                
        </div>
        
    </div>
</div>
</div>

    </div>

</body>
</html>