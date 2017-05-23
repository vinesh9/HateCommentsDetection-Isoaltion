<%@ page import="java.sql.*" %>

<%!
String bid="";
String bname="";  
Connection con=null;
ResultSet rs=null;
String tid="";
String tbid="";
String btitle="";
String ucomm="";
String tgid="";
String tfilt="";
int slno=1;
String dictwrds="";
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
ucomm=request.getParameter("ucomm");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
Statement stmt=con.createStatement();
rs=stmt.executeQuery("select max(slno) from usercomms");
try{
if(rs.next())
{
slno=Integer.parseInt(rs.getString(1));
if(slno==0)
slno=1;
else
slno=slno+1;
}
}
catch(Exception slex)
{
slno=1;
}
rs.close();


rs=stmt.executeQuery("select gid from blogs where bid=" + bid + " and btitle='" + bname + "'");
if(rs.next())
tgid=rs.getString(1);
rs.close();

rs=stmt.executeQuery("select filter from blogs where bid=" + bid + " and btitle='" + bname + "'");
if(rs.next())
{
tfilt=rs.getString(1);
}
rs.close();
if(!tfilt.equals("Manual"))
{
rs=stmt.executeQuery("select * from dict");
while(rs.next())
{
dictwrds = dictwrds + rs.getString(1).toLowerCase() + " ";
}
rs.close();
//out.println(dictwrds);
String []tucomm=ucomm.split(" ");
int dfg=0;
for(int i=0;i<tucomm.length;i++)
{
//out.println("<br>"+ tucomm[i]);
if(dictwrds.indexOf(tucomm[i].toLowerCase())>=0)
dfg=1;
}

if(dfg==0)
tfilt="Clear";
else
tfilt="Manual";
}

stmt.executeUpdate("insert into usercomms values(" + bid + ",'" + bname + "','" + ucomm + "'," + tid + ",'" + tgid  + "','" + tfilt + "','-'," + slno + ")");

out.println("<p class='w3-panel w3-center' style='font-family:cursive;font-size:25px;'>Comment Posted</p>");
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