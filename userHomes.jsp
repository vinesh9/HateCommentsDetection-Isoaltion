<%@ page import="connection.*,java.sql.*" %>
<%!
Connection con=null;
Statement st=null;
ResultSet rs=null;
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="w3.css" />
</head>
<style>
nav{
font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>
<body class="w3-container">
<nav class=" w3-container w3-display-topmiddle">
<div class="w3-bar w3-white w3-round-large ">
<a href="userHomes.jsp" class="w3-bar-item w3-orange w3-button" >Profile</a>
<div class="w3-dropdown-hover">
<button class="w3-button w3-blue">Group</button>
<div class="w3-dropdown-content w3-bar-block w3-card-4">
<a href="add_grp.html" class="w3-bar-item w3-button w3-round-xlarge w3-hover-blue" > Create</a>
<a href="add_mem.jsp" class="w3-bar-item w3-button w3-round-xlarge w3-hover-blue" > Add_Members</a>
<a href="vmembers.jsp" class="w3-bar-item w3-button w3-round-xlarge w3-hover-blue" > View</a>
</div>
</div>
<div class="w3-dropdown-hover">
<button class="w3-button" >Blog</button>
<div class="w3-dropdown-content w3-bar-block w3-card-4">
<a href="add_blg.jsp" class="w3-bar-item w3-button w3-round-xlarge " > NewBlog</a>
<a href="postcomm1.jsp" class="w3-bar-item w3-button w3-round-xlarge" > Comment</a>
</div>
</div>
<a href="access.jsp" class="w3-bar-item w3-button w3-blue ">Access</a>
<a href="index.html" class="w3-bar-item w3-button w3-orange ">Logout</a>
</div>

</nav>
<header class="w3-container w3-cyan w3-border w3-round-xlarge" style="height:120px;" >
<div style="float:left;">
<img src="./images/logo.jpg" class="w3-round-xxlarge" />
</div>
<!--<div style="float:left;width:200px;height:200px;margin-left:2cm;">
<img src="./images/C1.png" style="width:820px;height:100px;margin-top:.01cm;" class="w3-round-xlarge" />
</div>-->
</header>
<section class=" w3-container  w3-border  w3-round-large w3-padding-16 w3-section" >
<p class="w3-panel w3-center w3-underline w3-xlarge w3-style-bold w3-cyan w3-text-white w3-round-xxlarge" >
User_Profile
</p>
<P CLASS="w3-padding-32 w3-center  w3-text-black w3-panel w3-white w3-round-xxlarge">
<%
try{
String uid=(String)session.getAttribute("slogid");

con=databasecon.getconnection();
st=con.createStatement();
rs=st.executeQuery("select *from userregn where usrid='"+uid+"'");
out.println("<table border=1>");
while(rs.next())
{
%><p><label>UserId:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(1) %></span> </p>
<p><label>UserName:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(3) %></span> </p>
<p><label>Password:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(2) %></span> </p>
<p><label>Contact:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(5) %></span> </p>
<p><label>Email:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(6) %></span> </p>
<p><label>Address:&nbsp;&nbsp;</label><span style='font-family:cursive;font-size:24px;'><%= rs.getString(4) %></span> </p>
<%
}
out.println("</table>");
con.close();

}
catch(Exception e)
{
out.println("Error-->"+e.getMessage());
}
%>
</P>
</section>
<footer class="w3-container w3-cyan w3-round-xxlarge" style="">
<div class=" w3-width-300 w3-round-large w3-hover-white w3-text-hover-blue w3-center">
<span style="font-size:18px;font-family:'Comic Sans MS';color:white;margin-top:1cm;">
Developed at Adroit Info com India Pvt Ltd.
</span>
</div>
</footer>
</body>
</html>