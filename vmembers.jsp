<%@ page import="java.sql.*" %>

<%!
Connection con=null;
ResultSet rs=null;
String tid="";
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
</header>
<section class=" w3-container  w3-border  w3-round-large w3-padding-16 w3-section" >
<h3 class="w3-panel w3-blue w3-center w3-round-xxlarge">View Members</h3><hr>

<%
try
{
tid=(String)session.getAttribute("slogid");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
Statement stmt=con.createStatement();
rs=stmt.executeQuery("select * from groups where ownid in("+ tid+ ")");
out.println("<form method=post action='vmembers2.jsp'>");
out.println("<table align=center><tr><td>Group ID</td><td><select name=gid>");
while(rs.next())
{
out.println("<option>" + rs.getString(1) + "</option>");
}
rs.close();
out.println("</select></td></tr>");
out.println("<tr><td></td><td><input type=submit value='Show Members'></td></tr></table></form>");
con.close();
}
catch(Exception ee)
{
out.println("<b>User ID should be Numeric or it already exists! To try again <a href='reg.htm'>click</a> here.");
}

%>
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