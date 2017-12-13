package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataStorage;
import data.Event;

/**
 * Servlet implementation class EventPageServlet
 */
public class EventPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	String title = request.getParameter("title");
    	Event tempEvent;
    	for(Event value : DataStorage.eventsMap.values()){
    		if(value.name.equals(title)){
    			tempEvent = value;
    		}
    	}
    	HttpSession session = request.getSession();
    	session.setAttribute("title", title);
    	session.setAttribute("title", title);
    }
}
