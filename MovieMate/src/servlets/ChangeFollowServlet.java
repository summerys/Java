package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataStorage;
import data.StringConstants;
import database.MySql;

/**
 * Servlet implementation class ChangeFollowServlet
 */
@WebServlet("/ChangeFollowServlet")
public class ChangeFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter(StringConstants.USERNAME);
		Boolean toFollow = Boolean.parseBoolean(request.getParameter(StringConstants.TO_FOLLOW));
		
		DataStorage ds = (DataStorage) request.getSession().getAttribute(StringConstants.DATA);
		//if the logged in user wants to follow this username
		MySql mysql = new MySql();
//		mysql.connect();
//		
//		if (toFollow) { ds.addFollowing(username); 
//		//	mysql.addFollowing(ds.getLoggedInUser(), username);
//			//mysql.addFollower(ds.getUser(username), ds.getLoggedInUser().getUsername());
//		}
//		//else the logged in user wants to unfollow this username
//		else { ds.removeFollowing(username); 
//		//	mysql.removeFollowing(ds.getLoggedInUser(), username);
//			//mysql.removeFollower(ds.getUser(username), ds.getLoggedInUser().getUsername());
		}
	}
