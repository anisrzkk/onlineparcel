<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<% String Parcel_Code = request.getParameter("edit"); %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Key In</title>
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
            
            display: flex;
            flex-direction: column;
            align-items: center;
        }
            .main {
  margin-left: 220px;
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
        
        h1{
           font-size: 30px;
            margin: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(97, 94, 94);
            text-align: center;
            color: black;
            user-select: none; 
        }

        .keyinform{
            background-color: #F6F7F8;
            border: 1px solid #D6D9DC;
            border-radius: 3px;
  
            width: 80%;
            margin: 0 0 40px 0;
            padding: 50px;
        }
        .form-row {
        margin-bottom: 40px;
        display: flex;
        justify-content: flex-start;
        flex-direction: column;
        flex-wrap: wrap;
        }

        .form-row input[type='text'] {
        background-color: #FFFFFF;
        border: 1px solid #D6D9DC;
        border-radius: 3px;
        width: 100%;
        padding: 7px;
        font-size: 14px;
        }

        .form-row label {
        margin-bottom: 15px;
        }
        @media only screen and (min-width: 700px) {
        .keyinform {
        width: 600px;
        }
            
        .form-row {
        flex-direction: row;
        align-items: flex-start;
        margin-bottom: 20px;
        }
        .form-row input[type='text'] {
        width: 250px;
        height: initial;
        }
        .form-row label {
        text-align: right;
        width: 150px;
        margin-top: 7px;
        padding-right: 20px;
        }
        }
        .legacy-form-row {
  border: none;
  margin-bottom: 40px;
}

.legacy-form-row legend {
  margin-bottom: 15px;
}

.legacy-form-row .radio-label {
  display: block;
  font-size: 14px;
  padding: 0 20px 0 10px;
}

.legacy-form-row input[type='radio'] {
  margin-top: 2px;
}
  
.legacy-form-row input[type='radio'] {
  float: left;
}
      @media only screen and (min-width: 700px) {
  /* ... */
  .legacy-form-row {
    margin-bottom: 10px;
  }
  .legacy-form-row legend {
    width: 130px;
    text-align: right;
    padding-right: 20px;
  }
  .legacy-form-row legend {
    float: left;
  }
}  
        .form-row button {
  font-size: 16px;
  font-weight: bold;

  color: #FFFFFF;
  background-color: #5995DA;

  border: none;
  border-radius: 3px;

  padding: 10px 40px;
  cursor: pointer;
}

.form-row button:hover {
  background-color: rgba(40,57,101,.9);
}

.form-row button:active {
  background-color:rgba(40,57,101,.9);
}
        @media only screen and (min-width: 700px) {
  /* ... */
  .form-row button {
    margin-left: 240px;
      
      background-color: rgba(40,57,101,.9);
  }
}
        
    </style>

</head>

<body style="background-color:#CBCCBB">

      <span class="material-icons-outlined" id="ham">
        menu
        </span>

    <div class="side-nav">

      
        <span class="material-icons-outlined" id="close">
            close
            </span>
        <header>PARCEL</header>
    <ul>
            <a href="ParcelPage.jsp" class="active" >
                <li><span class=" material-icons-outlined">
                        upload
                    </span> <span class="menu">Key In</span> </li>
            </a>
            <a href="RegisterStaff.jsp" >
                <li><span class="material-icons-outlined">
                    add
                    </span><span class="menu">Register Staff</span></li>
            </a>
            <a href="HistoryPage.jsp">
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
    
    
        <h1>Pick Up</h1> 
        <br>
        <form action='PickUp' method='post' class='keyinform'>
            <div class='form-row'>
            
            <%   
            
    try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
		
		Statement stmt = con.createStatement();
		
		
		String sql = "SELECT * FROM parcel WHERE Parcel_Code =" + Parcel_Code ;
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
    %>
    
     <label for='Parcel Code'>Parcel Code</label>
            <input style="background-color: #e8e8e8;"  id='Parcel code' name='Parcel_Code' type='text' value ="<%=rs.getString("Parcel_Code") %>" readonly="readonly"/>
                <br>  
   <label for='Parcel Code'>Staff ID</label>
            <input style="background-color: #e8e8e8;"  id='staff id' name='Staff_ID' type='text' value ="<%=rs.getString("Staff_ID") %>" readonly="readonly"/>
                <br>  
            <label  for='Student_ID'>Student ID</label>
            <input style="background-color: #e8e8e8;"  id='Student_ID' name='Student_ID' type='text' value ="<%=rs.getString("Student_ID") %>" readonly="readonly" />
                <br>     
                <label for='name'>Name</label>
            <input style="background-color: #e8e8e8;"  id='name' name='Name' type='text' value ="<%=rs.getString("Name") %>" readonly="readonly"/>
                <br>
                
            <label for='Contact Number'>Contact Number</label>
            <input style="background-color: #e8e8e8;"  id='Phone' name='Phone' type='text' value ="<%=rs.getString("Number_Phone") %>" readonly="readonly"/>
                <br>
                <label for='rID'>Receiver ID</label>
            <input id='rID' name='Receiver_ID' type='text'/>
                <br>
                <label for='rp'>Receiver Contact Number</label>
            <input id='rp' name='Receiver_Phone' type='text'/>
                <br>
                 <label for='PickUP Date'> Pick Up Date</label>
                  <input id='Date' name='Date' type='date' placeholder='yyyy-mm-dd' />
         
 
           
                <br>
                <br>
     
                <div class='form-row'>
  <button>Submit</button>
 
</div>
 
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

        </form>
    </div>
</body>
</html>