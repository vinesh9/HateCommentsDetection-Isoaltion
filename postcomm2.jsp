<%@ page import="java.sql.*" %>

<%!
String bid="";
String bname="";  
Connection con=null;
Connection con1=null;
ResultSet rs=null;
String tid="";
String tbid="";
String title="";
String comm="";
String tgid="";
int ofg=0;
String tfilt="";
String sl="";
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
<h3 class="w3-panel w3-blue w3-center w3-round-xxlarge">POST COMMENTS</h3><hr>

<%
tid=(String)session.getAttribute("slogid");
bid=request.getParameter("bid");
bname=request.getParameter("btitle");

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
Statement stmt=con.createStatement();
con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
Statement stmt1=con1.createStatement();

out.println("<form method=post action='postcomm3.jsp'>");
// select gid from members where usrid=tid and status='Allow'
rs=stmt.executeQuery("select bid,btitle,comm from blogs where bid='" + bid + "' and btitle='" + bname + "'");
out.println("<table align=center>");
if(rs.next())
{
tbid=rs.getString(1);
title=rs.getString(2);
comm=rs.getString(3);
out.println("<tr><td>User ID</td><td><input type=text name=usid value='"+tid+"' size=7 readonly></td></tr>");
out.println("<tr><td>Blog ID</td><td><input type=text name=bid value='"+tbid+"' size=7 readonly></td></tr>");
out.println("<tr><td>Blog Title</td><td><input type=text name=btitle value='"+title+"'></td></tr>");
out.println("<tr><td>Desc</td><td><textarea name=bcomm rows=5 cols=50>"+comm+"</textarea></td></tr>");
}
rs.close();
rs=stmt.executeQuery("select status from members where gid=(select gid from blogs where bid=" + bid + " and btitle='" + bname + "') and usrid=" + tid + " and status='Allow'");
if(rs.next())
{
out.println("<tr><td>Your Comment</td><td><textarea name=ucomm rows=5 cols=50 required=required></textarea></td></tr>");
}
else
out.println("<tr><td>Your Comment</td><td><textarea name=ucomm rows=5 cols=50 disabled></textarea>");
rs.close();
////If owner of the blog - Manual & Automatic
out.println("<tr><td></tr><tr><td></td><td><input type=submit value='Post Comment'></form></td></tr>");
out.println("</table>");
///Is the user owner of the group
rs=stmt.executeQuery("select ownid,gid from groups where gid=(select gid from blogs where bid=" + bid + " and btitle='" + bname + "') and ownid=" + tid);
if(rs.next())
{
ofg=1;
tgid=rs.getString(2);
}
//out.println(ofg);
if(ofg==1)
{
rs=stmt.executeQuery("select * from usercomms where bid=" + bid + " and btitle='" + bname + "'");
int mft=1;
int fnd=0;
while(rs.next())
{

String dbid=rs.getString(1);
String dbtitle=rs.getString(2);
String ducomm=rs.getString(3);
String dusid=rs.getString(4);
String dgid=rs.getString(5);
tfilt=rs.getString(6);
sl=rs.getString(8);
//out.println(tfilt);
if(tfilt.equals("Manual"))
{
if(mft==1)
{
out.println("<p class='w3-panel w3-lime w3-display-right w3-round-xxlarge w3-padding-16' style='margin-top:4cm;margin-right:1cm;'>Manual Filtering<table border=1 align=center>");
mft=2;
}
out.println("<tr><td>" + dusid + "</td><td>" + ducomm + "</td><td><a href='setstatus.jsp?slno="+sl+"&stat=Clear'>Accept</a> | <a href='setstatus.jsp?slno="+sl+"&stat=Reject'>Reject</a>" + "</td></tr>");
fnd=1;
}


}
if(tfilt.equals("Manual") && fnd==1)
out.println("</table>");

rs.close();
////////////////////////Cleared Comments
rs=stmt.executeQuery("select * from usercomms where bid='"+bid+"' and btitle='"+bname+"' and filter='Clear' order by usrid");
out.println("<p class='w3-panel w3-lime w3-display-right w3-round-xxlarge w3-padding-16' style='margin-top:1cm;margin-right:1cm;'>Look what others have to say<table border class='w3-table-all' >");

while(rs.next())
{
String dbid=rs.getString(1);
String dbtitle=rs.getString(2);
String ducomm=rs.getString(3);
String dusid=rs.getString(4);
String dgid=rs.getString(5);
tfilt=rs.getString(6);
sl=rs.getString(8);

out.println("<tr><td>" + dusid + "</td><td>" + ducomm + "</td></tr>");

}
out.println("</table>");
rs.close();
}
else   //ofg=0 not owner
{
rs=stmt.executeQuery("select * from usercomms where bid='"+bid+"' and btitle='" + bname + "' and filter='Clear'");
out.println("<p class='w3-panel w3-lime w3-display-right w3-round-xxlarge w3-padding-16' style='margin-top:4cm;margin-right:1cm;'>Look what others have to say<table border>");

while(rs.next())
{
String dbid=rs.getString(1);
String dbtitle=rs.getString(2);
String ducomm=rs.getString(3);
String dusid=rs.getString(4);
String dgid=rs.getString(5);
tfilt=rs.getString(6);
sl=rs.getString(8);

out.println("<tr><td>" + dusid + "</td><td>" + ducomm + "</td></tr>");

}
out.println("</table>");
rs.close();
}
///////////////////////

con.close();

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