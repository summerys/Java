package servlet;
import data.*;
import database.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NavbarServlet
 */

public class NavbarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //public static DataStorage ds = new DataStorage();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavbarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	System.out.println("IN servlet");
    	if(DataStorage.usersMap.isEmpty()){
    		SqlDriver sqld = new SqlDriver();
    		sqld.connect();
    		sqld.getUsersData();
    		sqld.getEventsData();
    		sqld.getJoinersData();
    	}
    	String username = (String)request.getParameter("username");
    	String pw = (String)request.getParameter("password");
    	boolean usernameExist = DataStorage.usersMap.containsKey(username);
    	if(usernameExist == true){
    		User temp_User = DataStorage.usersMap.get(username);
    		if(pw.equals(temp_User.getPassword())){
    			String passed = "passed";
    			DataStorage.loggedInUser = username;
    			DataStorage.currUser = temp_User;
    			response.getWriter().write(passed);
    		}
    		else{
    			String notpassed = "notpassed";
    			response.getWriter().write(notpassed);
    		}
    	}
    	else{
    		String notexist = "notexist";
    		response.getWriter().write(notexist);
    	}
    }
}
