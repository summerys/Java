package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.*;

@WebServlet("/ProfileEditServlet")
public class ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileEditServlet() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("In Profile Edit Servlet");
    	String currentuser = DataStorage.loggedInUser;
    	User user= DataStorage.usersMap.get(currentuser);
    	
		String password = (String)request.getParameter("password");
		String nickname = (String)request.getParameter("nickname");
		String age = (String)request.getParameter("age");
		String gender = (String)request.getParameter("gender");
		String email = (String)request.getParameter("email");
		
		System.out.println(password);
		System.out.println(nickname);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(email);
		
		if( password != null ){
			user.setPassword(password);
		}
		
		if( nickname != null ){
			//need to check if nickname exist or not. 
			user.setNickname(nickname);
		}
		if( age != null ){
			int age_input = Integer.parseInt(age.trim());
			System.out.println(age_input);
			user.setAge(age_input);
		}
		if( gender != null ){
			if(gender.equals("F")){
			user.setGender(0); }
			else{ user.setGender(1); }
		}
		if( email != null ){
			user.setEmail(email);
		}	
	}

}