<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	if(username.equals("") || password.equals("") || nickname.equals("") || age.equals("") || gender.equals("")){
%>
	Please provide enough information
<%
	}
	else if(!gender.trim().equalsIgnoreCase("Male") && !gender.trim().equalsIgnoreCase("M") && !gender.trim().equalsIgnoreCase("Female") && !gender.trim().equalsIgnoreCase("F")) {
%>
	Please provide correct gender information		
<%
	}
	else {
		int genderint = 0;
		if(gender.trim().equalsIgnoreCase("Male") || gender.trim().equalsIgnoreCase("M")) {
			genderint = 1; 
		} else if(gender.trim().equalsIgnoreCase("Female") || gender.trim().equalsIgnoreCase("F")) {
			genderint = 0;
		}
		User newuser = new User(username, password, nickname, Integer.parseInt(age), genderint);
		SqlDriver sqld = new SqlDriver();
		sqld.connect();
		sqld.addAUser(newuser);
	}
%>