package data;

import java.util.ArrayList;

public class Event {
	public String name;
	public String destination;
	public String location;
	public String startDate;
	public String endDate;
	public String organizer;
	public int maxTraveler;
	public String housing;
	public String description;
	public ArrayList<String> Joiners = new ArrayList<String>();

    public Event(String name, String location, String destination, String startDate, String endDate, String organizer, int Max, String housing, String descrip) {
        this.name = name;
    	this.location = location;
        this.destination = destination;
        this.startDate = startDate;
        this.endDate = endDate;
        this.organizer = organizer;
        this.maxTraveler = Max;
        this.housing = housing;
        this.description = descrip;
    }
    
    public Event(){}
    
    public String getName(){
    	return name;
    }
    
    public String getDestination(){
    	return destination;
    }
    
    public String getLocation(){
    	return location;
    }
    
    public String getDate(){
    	return startDate + " ~ " + endDate;
    }
    
    public String getStartDate(){
    	return startDate ;
    }

    public String getEndDate(){
    	return endDate ;
    }
    
    public String getHousing(){
    	return housing ;
    }
    
    public String getDescription(){
    	return description ;
    }
    
    public int getMaxTraveler(){
    	return maxTraveler;
    }
    
    public void setMaxTraveler(int maxTraveler1) {
        this.maxTraveler = maxTraveler1;
    }

    public void setHousing(String housing1) {
        this.housing = housing1;
    }

    public void setDescription(String description1) {
        this.description = description1;
    }
    
    public String getOrganizer(){
    	return organizer;
    }
    
    public String getShortInfo(){
    	String newLine = System.getProperty("line.separator");
    	return "From " + location + " To " + destination + newLine + startDate + " ~ " + endDate;
    			
    }
    
    public void setDestination(String destination){
    	this.destination = destination;
    }
    
    public void setLocation(String location){
    	this.location = location;
    }
    
    public void setStartDate(String startDate){
    	this.startDate = startDate;
    }
    
    public void setEndDate(String endDate){
    	this.endDate = endDate;
    }
}

//public class Event {
//	String name;
//    String destination;
//    String location;
//    int startDate;
//    int endDate;
//    User organizer;
//    int maxTraveler;
//    String housing;
//    String description;
//
//    public Event(String name, String location, String destination, int startDate, int endDate, User organizer) {
//        this.name = name;
//    	this.location = location;
//        this.destination = destination;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.organizer = organizer;
//    }
//    
//    public Event(){}
//    
//    public String getName(){
//    	return name;
//    }
//    
//    public String getDestination(){
//    	return destination;
//    }
//    
//    public String getDate(){
//    	return startDate + " ~ " + endDate;
//    }
//
//    public void setMaxTraveler(int maxTraveler1) {
//        this.maxTraveler = maxTraveler1;
//    }
//
//    public void setHousing(String housing1) {
//        this.housing = housing1;
//    }
//
//    public void setDescription(String description1) {
//        this.description = description1;
//    }
//}



