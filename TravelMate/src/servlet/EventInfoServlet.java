package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.*;

/**
 * Servlet implementation class EventInfoServlet
 */
@WebServlet("/EventInfoServlet")
public class EventInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

 protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	
    	String event = request.getParameter("eventName");
    	System.out.println("inside event edit" + event);
    	Event e = DataStorage.getEvent(event);
    			
    	String destination = (String)request.getParameter("destination");
		String location = (String)request.getParameter("location");
		String startDate = (String)request.getParameter("startDate");
		String endDate = (String)request.getParameter("endDate");
		String maxTraveler = (String)request.getParameter("maxTraveler");
		String housing  = (String)request.getParameter("housing");
		String description = (String)request.getParameter("description");
		
		System.out.println(destination);
		System.out.println(location);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(maxTraveler);
		System.out.println(housing);
		System.out.println(description);
		
		if( destination != null ){
			e.setDestination(destination);
		}
		
		if( location != null ){
			//need to check if nickname exist or not. 
			e.setLocation(location);
		}
		if( startDate != null ){
			e.setStartDate(startDate);
		}
		if( endDate != null ){
			e.setEndDate(endDate);
		}
		if( maxTraveler != null ){
			int maxT = Integer.parseInt(maxTraveler);
			e.setMaxTraveler(maxT);
		}	
		if( housing != null ){
			e.setHousing(housing);
		}
		if( description != null ){
			e.setDescription(description);
		}
    	
    	String next = "/jsp/Event_Edit.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request,response);
    }

}
