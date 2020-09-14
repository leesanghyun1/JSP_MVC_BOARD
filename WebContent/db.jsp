<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%!
    	Connection connection;
    	Statement statement;
    	ResultSet resultSet;
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@dogbag-PC:1522:xe";
    	String uid = "lee";
    	String upw = "oracle";
    	String query = "select * from members"; 
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			System.out.println("1");
			while(resultSet.next()){
				
				String id = resultSet.getString("u_id");
				String pw = resultSet.getString("u_pw");
				String name = resultSet.getString("u_name");
				
				System.out.println("id:"+ id+ " pw:"+pw+" name:"+name);
			}
			
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}catch(Exception e){
			}
		}
	%>
</body>
</html>