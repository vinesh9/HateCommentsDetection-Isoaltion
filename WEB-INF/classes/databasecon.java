	package connection;
	import java.sql.*;
	public class databasecon
	{
	public static Connection con;
		public static Connection  getconnection()
		{
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","comments","comments");
			}
				catch(Exception e)
					{
						System.out.println("error-->"+e.getMessage());
					}
		return con;
		}
	}