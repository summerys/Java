package data;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Random;
import java.util.Set;

import database.*;
public class DataStorage {
	
	public static Map<String, User> usersMap = new HashMap<>();//all users
	public static Map<String, Event> eventsMap = new HashMap<>();//all events
	public static Map<String, String> airportsMap = new HashMap<>();//all airports
	public static Map<String, String> countryMap = new HashMap<>();//all countries
	public static Set<String> destinationsList = new HashSet<String>();//all destinations
	public static String loggedInUser;
	public static User currUser;//curr logged in user
	public static String currEvent; 
	
	public DataStorage (){
		usersMap = new HashMap<>();	
		eventsMap = new HashMap<>();
		airportsMap = new HashMap<>();
		countryMap = new HashMap<>();
	}
	//need to create User and Event class here and push into the Map.
	
	public static void addCountryMap(String city, String country){
		countryMap.put(city, country);
	}
	
	public static void addAirportsMap(String city, String airport){
		airportsMap.put(city, airport);
	}
	
	public static void addUserMap(User u){
		usersMap.put(u.getUsername(), u);
	}
	
	public Map<String, User> getUserMap(){
		return usersMap;
	}
	
	public static void addEventMap(Event e){
		eventsMap.put(e.getName(), e);
	}
	
	public static Map<String, Event> getEventMap(){
		return eventsMap;
	}
	
	public static Event getEvent(String event){
		 return eventsMap.get(event);
	}
	
	public void addDestination(String Dest){
		destinationsList.add(Dest);
	}
	public void setLoggedInUser(String username){
		loggedInUser = usersMap.get(username).username;
	}
	
	public String getLoggedInUser(){
		return loggedInUser;
	}
	
	public User getCurrUser(){
		return currUser;
	}
	
	public void AddaUser(String username, String password, String nickname,
			int age, int gender, String email, String hobby,
			Boolean Alcohol, Boolean Partying, int BedTime, int WakeUpTime){
		User tempuser = new User(username,password,nickname,age,gender);
		usersMap.put(username, tempuser);
	
	}

	public ArrayList<Event> ReturnFourTripforMainPage(String loggedinusername){
	// my idea is that for the main page we should show four trip suggestions, which 
	// comes from the organizer's(from the logged-in user's joined trip) other started trip or joined trip
	ArrayList<Event> tempevent = new ArrayList<Event>();
	for (Event value : eventsMap.values()) {
	if(tempevent.size() <= 8){
		tempevent.add(value);
	}
	}
	
	return tempevent;
	}
	
	public int eventNum(){
	Object[] values = eventsMap.values().toArray();
	return values.length;
	}
	
	public static ArrayDeque<Event> search(String location, String destination, String startDate, String endDate){
	//need improvement for this search after we finish most of the work. 
	//because current search only works for complete match, but I think for this kind of search, 
	// the software should provide a list of event that match 50%-90% of the requirement. 
	ArrayDeque<Event> tempevent = new ArrayDeque<Event>();
	ArrayList<Integer> tempdate = new ArrayList<Integer>();
	Map<Integer, Queue<Event>> sortMap = new HashMap<>();
		for (Event value : eventsMap.values()) {
			if((location.equals("") || value.location.equalsIgnoreCase(location) || location.equals("\'\'")) &&
				(destination.equals("") || value.destination.equalsIgnoreCase(destination)) &&
				(startDate.equals("") || value.startDate.equalsIgnoreCase(startDate)  || startDate.equals("\'\'")) &&
				(endDate.equals("") || value.endDate.equalsIgnoreCase(endDate) || endDate.equals("\'\'"))) {
				String goodstart = "";
				goodstart += value.startDate.charAt(6);
				goodstart += value.startDate.charAt(7);
				goodstart += value.startDate.charAt(8);
				goodstart += value.startDate.charAt(9);
				goodstart += value.startDate.charAt(0);
				goodstart += value.startDate.charAt(1);
				goodstart += value.startDate.charAt(3);
				goodstart += value.startDate.charAt(4);
				if(sortMap.containsKey(Integer.parseInt(goodstart))) {
					sortMap.get(Integer.parseInt(goodstart)).add(value);
				} else {
					tempdate.add(Integer.parseInt(goodstart));
					Queue<Event> q = new LinkedList<Event>();
					q.add(value);
					sortMap.put(Integer.parseInt(goodstart), q);
				}
			}
		}	
		Collections.sort(tempdate);
		for(int a=0; a<tempdate.size(); a++) {
			Queue<Event> q = sortMap.get(tempdate.get(a));
			for(Event e : q){
			    tempevent.add(e);
			}
		}
		return tempevent;
	}
	
	public static ArrayList<Event> myTrip(){
		SqlDriver sqld = new SqlDriver();
		sqld.connect();
		sqld.getJoinersData();
		ArrayList<Event> temp = new ArrayList<Event>();
		for(Event value: eventsMap.values()){
			for(int a=0; a<value.Joiners.size(); a++) {
				if(value.Joiners.get(a).equals(loggedInUser)) {
					temp.add(value);
				}
			}
		}
		return temp;
	}
	
	public static String myTriphelper(){
		ArrayList<Event> tempsave = myTrip();
		String result = "";		
		for(int i=0; i<tempsave.size(); i++){
			result += "<div class=\"mytripdiv\">";
			result += "<a class=\"topic\"href = \"Event.jsp?title=" + tempsave.get(i).name + "\">" + tempsave.get(i).name + "</a>"
					+ "<p>" + "Starting Location:  " + tempsave.get(i).location
					+ "</p>" + "<p>" + "Destination:  " + tempsave.get(i).destination + "</p>" +
					"<p>" +"Starts from:  " + tempsave.get(i).startDate + "</p>" + "<p>" +
					"Ends at: " + tempsave.get(i).endDate + "</p>";
			result += "</div>";
		}
		
		
		return result;
	}
	
	public static void AddanEvent(String name, String location, String destination, String startDate, String endDate, String organizer, int Max, String housing, String descrip){
		Event newevent = new Event(name, location, destination, startDate,endDate, organizer, Max, housing, descrip);
		SqlDriver sqld = new SqlDriver();
		sqld.connect();
		sqld.addAnEvent(newevent);
	}
	 
	public static void AddanEventhelper(String name, String location, String destination, String startDate, String endDate, String organizer, int Max, String housing, String descrip){
		AddanEvent(name, location, destination, startDate,endDate, organizer, Max, housing, descrip);
	} 
	
	public static ArrayList<String> randomTrips() {
		ArrayList<String> temp = new ArrayList<String>();
		ArrayList<Integer> num = new ArrayList<Integer>();
			    			
		if(destinationsList.size()>=8) {
			for(int a=0; a<8; a++) {
				Random rand = new Random();
				int size = destinationsList.size(); 
				int item = rand.nextInt(size) + 0;
				int i = 0;
				while(num.contains(item)) {
					item = rand.nextInt(size) + 0; 
				}		
				for(String s : destinationsList)
				{
				    if (i == item) {
				    	num.add(item);
						temp.add(s);
				    }
				    i++;
				}
			}
		}
		return temp;
	}
}
