package data;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by summerseo on 4/4/17.
 */

//public class User {
//    private String username;
//    private String password;
//    private String nickname;
//    private int age;
//    private int gender;
//    //String email;
//    //String hobby;
//    //Boolean Alcohol;
//    //Boolean Smoking;
//    //Boolean Partying;
//    //int BedTime;
//    //int WakeUpTime;
//
//    private List<Event> events;

    //username, password, name and age are basic requirements

//    public User(){}
//    
//    public User(String username, String password, String nickname, int age, int gender) {
//        this.username = username;
//        this.password = password;
//        this.nickname = nickname;
//        this.age = age;
//        this.gender = gender;
//        //this.email = email;
//
//        events = new ArrayList<Event>();
//    }
//
//    public String getUsername() { 
//    	return username; 
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public String getNickname() {
//        return nickname;
//    }
//
//    public int getAge() {
//        return age;
//    }
//
//    public int getGender() {
//        return gender;
//    }
//    public boolean CheckLoginStatus(String username_, String password_){
//    	if(!username_.equals(username) || !password_.equals(password)){
//    		return false;
//    	}
//    	else{
//    		return true;
//    	}
//    }
    
//    public void AddanEvent(String location, String destination, int startDate, int endDate, User organizer){
//    	Event newevent = new Event(location,destination,startDate,endDate,organizer);
//    	events.add(newevent);
//    }
    
    
    /*public ArrayList<Event> ReturnUserOwnTrip(){  // return trip that the user started.
    	
    	ArrayList<Event> tempdata = new ArrayList<Event>();
    	for(int i=0; i<events.size(); i++){
    		if(events.get(i).organizer.equals(username)){
    			tempdata.add(events.get(i));
    		}
    	}
    	
    	return tempdata;
    }*/
    
    public class User {
        String username;
        String password;
        String nickname;
        int age;
        int gender;
        String email;
        String hobby;
        Boolean Alcohol;
        Boolean Partying;
        int BedTime;
        int WakeUpTime;
        boolean Ifisguest;

        private ArrayList<String> events;

        //username, password, name and age are basic requirements

        public User(){
        	//for guest
        	this.username = "guest";
        	this.password = "";
        	this.nickname = "guest";
        	this.age = 0;
        	this.gender = -1;
        	Ifisguest = true;
        }
        
        public User(String username, String password, String nickname, int age, int gender) {
            this.username = username;
            this.password = password;
            this.nickname = nickname;
            this.age = age;
            this.gender = gender;
          //  this.email = email;
            Ifisguest = false;
            events = new ArrayList<String>();
        }

        public void setUsername(String input) 
        { this.username = input; }

        public void setPassword(String input) {
            this.password = input;
        }

        public void setNickname(String input) {
            this.nickname = input;
        }

        public void setAge(int input) {
            this.age = input;
        }

        public void setGender(int input) {
            this.gender = input;
        }
        public void setEmail(String input){
        	this.email = input;
        }
        public void setHobby(String input){
        	this.hobby = input;
        }
        public void setAlcohol(boolean input){
        	this.Alcohol = input;
        }
        public void setPartying(boolean input){
        	this.Partying = input;
        }
        public void setBedTime(int input){
        	this.BedTime = input;
        }
        public void setWakeUpTime(int input){
        	this.WakeUpTime = input;
        }
        
        public ArrayList<String> getEvent(){
        	return events;
        }
        
        public void addEvent(String input){
        	events.add(input);
        }
        
        public String getUsername() { return username; }

        public String getPassword() {
            return password;
        }

        public String getNickname() {
            return nickname;
        }

        public int getAge() {
            return age;
        }

        public int getGender() {
            return gender;
        }
        public String getEmail(){
        	return email;
        }
        public String getHobby(){
        	return hobby;
        }
        public boolean getAlcohol(){
        	return Alcohol;
        }
        public boolean getPartying(){
        	return Partying;
        }
        public int getBedTime(){
        	return BedTime;
        }
        public int getWakeUpTime(){
        	return WakeUpTime;
        }
        
        public boolean CheckLoginStatus(String username_, String password_){
        	if(!username_.equals(username) || !password_.equals(password)){
        		return false;
        	}
        	else{
        		return true;
        	}
        }
        
        
        public ArrayList<String> ReturnUserOwnTrip(){  // return trip that the user started.
        	
        	
        	
        	return events;
        }
        
         public void SetUserName(String input){
        	 this.username = input;
         }
         
         public boolean isGuest(){
        	 if(this.username.equals("guest") && this.nickname.equals("guest")){
        		 return true;
        	 }
        	 else{
        		 return false;
        	 }
         }
    
    

}
