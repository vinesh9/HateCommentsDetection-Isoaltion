<%@ page import="java.sql.*,connection.*" %>
<%!
Connection con=null;
Statement st=null;
ResultSet rs=null;
%>
<%
//try{
String usid=request.getParameter("usid");
String pwd=request.getParameter("uspwd");
String utype=request.getParameter("utype");

session.setAttribute("slogid",usid);

con=databasecon.getconnection();
st=con.createStatement();

if(utype.equals("admin"))
{
//check in admin table
rs=st.executeQuery("select *from admins where usrid='"+usid+"' and uspwd='"+pwd+"' ");
}
else if(utype.equals("user"))
{
//check in user_info table
rs=st.executeQuery("select *from userregn where usrid='"+usid+"' and uspwd='"+pwd+"' ");
}

if(rs.next())
{
if(utype.equals("admin")){
response.sendRedirect("./adminHome.jsp");
con.close();
return;
}
else if(utype.equals("user")){
response.sendRedirect("./userHome.jsp");
con.close();
return;
}
con.close();
}

/*}catch(Exception e)
{
out.println("Error-->"+e);
}*/


%>