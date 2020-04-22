<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="workFlow.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	String user=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	
	try{
	
		AesUse aes=new AesUse("Ar1234567890chit");
		String str=aes.encrypt(pwd);
		
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st=con.createStatement();
	ResultSet rs;
	int i=st.executeUpdate("insert into info values('"+user+"','"+str+"','"+email+"','"+name+"')");
	out.println("Registered");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
<br/>
<a href="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>