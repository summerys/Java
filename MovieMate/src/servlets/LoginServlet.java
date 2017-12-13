package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import data.DataStorage;
import data.StringConstants;
import data.User;
import java.util.Map;
import java.util.Map.Entry;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DataStorage ds = (DataStorage) request.getSession().getAttribute(StringConstants.DATA);

		String username = (String)request.getParameter(StringConstants.USERNAME);
		String password = (String)request.getParameter(StringConstants.PASSWORD);
		
		System.out.println("username in login servlet is " + username + " and password is " + password);
		
		//if it is a valid username
		System.out.println(DataStorage.validUsername(username));
		
		if (DataStorage.validUsername(username)){
			//correct password
			if (DataStorage.correctPassword(username, password)){
				DataStorage.setLoggedInUser(username);
			}
			//incorrect password
			else{
				response.getWriter().write("Incorrect password");
			}
		}
		//invalid username
		else{
			response.getWriter().write("Invalid username");
		}	
	}
}
