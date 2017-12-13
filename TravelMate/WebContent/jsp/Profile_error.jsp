<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%  
	String currentuser = DataStorage.loggedInUser;
	User user= DataStorage.usersMap.get(currentuser);
	
	String password = request.getParameter("password");
	String confirmedPassword = request.getParameter("confirmedpassword");
	String nickname = request.getParameter("nickname");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");

 
if( !password.equals(confirmedPassword) ){
%>
<font color="red"><strong>password and confirmed password do not match.</strong></font><br />
<% 
}
if(!age.equals("")){
	if((Integer.parseInt(age) < 0 || Integer.parseInt(age) > 130) ) {
%>
<font color="red"><strong>Please put correct age. (Age range from 0 ~ 130) </strong></font><br />
<% 
	}
}
if(!gender.equals("") && (!gender.trim().equalsIgnoreCase("Male") && !gender.trim().equalsIgnoreCase("M") && !gender.trim().equalsIgnoreCase("Female") && !gender.trim().equalsIgnoreCase("F"))) {
%>
<font color="red"><strong>Please provide correct gender information. </strong></font><br />
<%
}
else {
	SqlDriver sqld = new SqlDriver();
	sqld.connect();
	if( !password.equals("") && password.equals(confirmedPassword)){
		user.setPassword(password);
		sqld.updatePw(password, DataStorage.loggedInUser);
	}
	
	if( !nickname.equals("") ){
		//need to check if nickname exist or not. 
		user.setNickname(nickname);
		sqld.updateNickname(nickname, DataStorage.loggedInUser);
	}
	if( !age.equals("") ){
		int age_input = Integer.parseInt(age.trim());
		user.setAge(age_input);
		sqld.updateAge(age_input, DataStorage.loggedInUser);
	}
	if( !gender.equals("") ){
		if(gender.trim().equalsIgnoreCase("Male") || gender.trim().equalsIgnoreCase("M")){
			user.setGender(1); 
			sqld.updateGender(1, DataStorage.loggedInUser);
		}
		else{ 
			user.setGender(0); 
			sqld.updateGender(0, DataStorage.loggedInUser);
		}		
	}
}
%>

