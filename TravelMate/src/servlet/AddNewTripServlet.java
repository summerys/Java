package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import data.*;
/**
 * Servlet implementation class AddNewTripServlet
 */
@WebServlet("/AddNewTripServlet")
public class AddNewTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewTripServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String destination = request.getParameter("destination");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String organizer = DataStorage.loggedInUser;
		String max = request.getParameter("max");
		String housing = request.getParameter("housing");
		String descrip = request.getParameter("descrip");
		String messg = "";
		
		if(name.equals("") || location.equals("") || destination.equals("") || startdate.equals("") || enddate.equals("")){
			messg = "Please provide enough information";
			request.setAttribute("error",messg);
			request.getRequestDispatcher("jsp/NewTripPage.jsp").forward(request, response);
		}
		else{
			int MAX = Integer.parseInt(max);
			data.DataStorage.AddanEventhelper(name, location, destination, startdate, enddate, organizer, MAX, housing, descrip);
			request.getRequestDispatcher("jsp/Mytrip.jsp").forward(request, response);
		}
				
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}