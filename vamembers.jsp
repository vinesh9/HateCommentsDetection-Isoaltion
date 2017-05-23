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
<div class="w3-bar w3-white ">
<a href="vamembers.jsp" class="w3-bar-item w3-button w3-blue" >Groups</a>
<a href="vusers.jsp" class="w3-bar-item w3-button " >Users</a>
<a href="addDict.jsp" class="w3-bar-item w3-button w3-blue" >Words</a>
<a href="viewDict.jsp" class="w3-bar-item w3-button " >ViewWords</a>
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
<h3 class="w3-panel w3-blue w3-center w3-round-xxlarge">VIEW GROUP MEMBERS</h3><hr>
<%
//try
//{
tid=(String)session.getAttribute("slogid");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
Statement stmt=con.createStatement();
rs=stmt.executeQuery("select * from groups");
out.println("<form method=post action='vamembers2.jsp'>");
out.println("<table class='w3-table-all w3-centered' align=center><tr><td>Group ID</td><td><select name=gid style='width:130px;'>");
while(rs.next())
{
out.println("<option>" + rs.getString(1) + "</option>");
}
rs.close();
out.println("</select></td></tr>");
out.println("<tr><td></td><td><input type=submit value='Show Members'></td></tr></table></form>");
con.close();

/*}
catch(Exception ee)
{

out.println("<b>User ID should be Numeric or it already exists! To try again <a href='reg.htm'>click</a> here.");
}*/

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