<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="workFlow.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
String userid=request.getParameter("usr");

String pwd=request.getParameter("pwd");

try{
	
	AesUse aes=new AesUse("Ar1234567890chit");
	String str=aes.encrypt(pwd);
	
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from info where email='"+userid+"'");
if(rs.next())
{
 if(rs.getString(2).equals(str))
	 {
		 out.println("welcome");
		 out.println(rs.getString(4));		 	
	 }
 
 else
 	{
	 out.println("Invalid Password Try again");
 	}
}
}
catch(Exception e)
{
	out.println(e);	
}
%>
<br/>
<a href="index.html">Home</a>

</body>
</html>