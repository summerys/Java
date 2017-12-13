package servlet;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.*;
import sun.misc.Queue;

/**
 * Servlet implementation class NavbarMemberServlet
 */

public class NavbarMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NavbarMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In navbarmember servlet");
		String location = (String)request.getParameter("location");
		String destination = (String)request.getParameter("destination");
		String startdate = (String)request.getParameter("startdate");
		String enddate = (String)request.getParameter("enddate");
		System.out.println(location);
		System.out.println(destination);
		System.out.println(startdate);
		System.out.println(enddate);
		
		ArrayList<Event> tempsave = DataStorage.search(location,destination,startdate,enddate);
		String result = "";
		for(int i=0; i<tempsave.size(); i++){
			result += "<a href = \"EventPageServlet?name=" + tempsave.get(i).name + "\"\\>" +
					tempsave.get(i).name + "  " + "trip start from " + tempsave.get(i).startDate + 
					" to " + tempsave.get(i).endDate + "</a>";
		}
		
		result = "<li>" + result + "</li>";
		System.out.println(result);
		request.setAttribute("info", result);
		request.getRequestDispatcher("../Search.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}*/
	
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		System.out.println("In navbarmember servlet");
		String location = (String)request.getParameter("from");
		String destination = (String)request.getParameter("to");
		String startdate = (String)request.getParameter("startdate");
		String enddate = (String)request.getParameter("enddate");
		System.out.println(location);
		System.out.println(destination);
		System.out.println(startdate);
		System.out.println(enddate);
		System.out.println(location.equals(""));
		System.out.println(destination.equals(""));
		System.out.println(startdate.equals("10/10/2017"));
		System.out.println(enddate.equals(""));
		
		ArrayDeque<Event> tempsave = DataStorage.search(location,destination,startdate,enddate);
		String result = "";
		for(Event e : tempsave){
			result += "<a href = \"EventPageServlet?title=" + e.name + "\"\\>" +
					e.name + "  " + "trip start from " + e.startDate + 
					" to " + e.endDate + "</a>";
		}
		
		result = "<li>" + result + "</li>";
		System.out.println(result);
		HttpSession session = request.getSession();
		session.setAttribute("info", result);
		response.sendRedirect(request.getContextPath() + "/jsp/Search.jsp");
	}

}