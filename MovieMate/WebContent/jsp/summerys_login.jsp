<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.StringConstants" %>
<%@ page import="database.MySql" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.FileNotFoundException" %>

<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pre-login.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
	<script src="../js/main.js" type="text/javascript"></script>
</head>
<body>
<%
//parse the config.txt file and get data from mysql. 

	String ipaddress = "";
	String db = "";
	String user = "";
	String password = "";

	File file = new File("/Users/summerseo/Documents/workspace/summerys_CSCI201_Assignment5/config.txt");
    
    try {

    	Scanner scanner = new Scanner(file);	
    	
        while (scanner.hasNextLine()) {
        	
        	String line = scanner.nextLine();
        	System.out.println("line is" + line);
        	
        	if(line.contains("ipaddress")){
        		ipaddress = line.substring(line.indexOf(" : ") + 1);
        		System.out.println(ipaddress);
        		String [] tokens = ipaddress.split ("\"");
        		String url = tokens[1];
        		System.out.println("ipaddress after tokens : " + ipaddress);
        	}else if(line.contains("db")){
        		db = line.substring(line.indexOf(" : ") + 1);
        		System.out.println(db);
        	}else if(line.contains("user")){
        		user = line.substring(line.indexOf(":") + 1);
        		System.out.println(user);
        	}else if(line.contains("password")){
        		password = line.substring(line.indexOf(":") + 1);
        		System.out.println(password);
        	}
        	
        }
        scanner.close();
    } 
    catch (FileNotFoundException e) {
        e.printStackTrace();
    }
	
	MySql mysql = new MySql( ipaddress, db , user, password );
    mysql.connect();
    mysql.getGenresData();
    mysql.getActionsData();
    mysql.getMoviesData();
    mysql.getUsersData();
    

    
    
%>
	<div id = "title_container">
		Cinemate
	</div>

	<div id = "welcome_text">
		Please log in.
	</div>
	<div id = "outer_container">
		<div id = "inner_container">
			<div id = "login_container">
					Username
					<br>
					<input type="text" name="<%= StringConstants.USERNAME%>" id = "<%=StringConstants.USERNAME%>">
					<br>
					Password
					<br>
					<input type="text" name="<%= StringConstants.PASSWORD%>" id = "<%=StringConstants.PASSWORD%>">
					<br><br>
					<input style = "margin-left: 5px;" type="submit" value="Log In" onclick = "return errorCheck('<%=StringConstants.LOGIN_SERVLET %>', '<%=StringConstants.BIG_FEED_JSP %>', ['<%=StringConstants.USERNAME %>', '<%=StringConstants.PASSWORD %>'], 2, 'error_message')">
				<form action = "${pageContext.request.contextPath}/jsp/sign_up.jsp">
					<input style = "margin-left: 5px;" type="submit" value="Sign Up">
				</form>
			</div>
			<div class=error_message id = "error_message"> </div>
		</div>
	</div>
</body>
</html>