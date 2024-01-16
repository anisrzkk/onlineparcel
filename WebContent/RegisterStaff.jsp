<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Staff</title>
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

        .registerform{
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
        .registerform {
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
  background-color: #76AEED;
}

.form-row button:active {
  background-color: #407FC7;
}
        @media only screen and (min-width: 700px) {
  /* ... */
  .form-row button {
    margin-left: 240px;
      
  }
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
            <a href="ParcelPage.jsp" >
                <li><span class=" material-icons-outlined">
                        upload
                    </span> <span class="menu">Key In</span> </li>
            </a>
            
            <a href="RegisterStaff.jsp" class="active">
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
    
    
    <div class="main">
        <h1>Register Staff</h1> 
        <br>
        <form action='RegisterStaff' method='post' class='registerform'>
            <div class='form-row'>
            
             <label for='Staff ID'>Staff_ID</label>
            <input id='Staff_ID' name='staff_id' type='text'/>
                <br>
            <label for='Name'>Name</label>
            <input id='Name' name='Name' type='text'/>
                <br>
            <label for='Contact Number'>Contact Number</label>
            <input id='Contact Number' name='Contact Number' type='text'/>
                <br>  
                <label for='Password'>Password</label>
            <input id='Password' name='Password' type='text'/>
            <br>  
           
            
                <div class='form-row'>
 
 <button type="submit" value="Submit">Submit</button>
</div>
</div>
        </form>
        
    </div>
</body>
</html>