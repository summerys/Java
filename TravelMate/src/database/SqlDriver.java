package database;
//import data.User;
import data.*;

import com.mysql.jdbc.Driver;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class SqlDriver {

    private Connection conn;
    private final static String getUsers = "SELECT * FROM Users";
    private final static String getEvents = "SELECT * FROM Events";
    private final static String getJoiners = "SELECT * FROM Joiners";
    private final static String getAirports = "SELECT * FROM Airports";
    private final static String addUser = "INSERT INTO Users(Username, Pw, NickName, Age, Gender) VALUES(?,?,?,?,?)";
    private final static String addEvent = 
    			"INSERT INTO Events(Title, Location, Destination, StartingDate, EndingDate, MaxTraveler, Housing, Description, Username) VALUES(?,?,?,?,?,?,?,?,?)";
    private final static String addJoiner = "INSERT INTO Joiners(EventName, JoinerName) VALUES (?,?)";
    private final static String deleteJoiner = "DELETE from Joiners WHERE EventName=? and JoinerName=?";
    private final static String updatePassword = "UPDATE Users SET Pw=? where Username=?";
    private final static String updateNickname = "UPDATE Users SET Nickname=? where Username=?";
    private final static String updateAge = "UPDATE Users SET Age=? where Username=?";
    private final static String updateGender = "UPDATE Users SET Gender=? where Username=?";
    private final static String updateDestination = "update Events SET Destination=? where Title=?";
    private final static String updateLocation = "update Events SET Location=? where Title=?";
    private final static String updateStart = "update Events SET StartingDate=? where Title=?";
    private final static String updateEnd = "update Events SET EndingDate=? where Title=?";
    private final static String updateMax = "update Events SET MaxTraveler=? where Title=?";
    private final static String updateHousing = "update Events SET Housing=? where Title=?";
    private final static String updateDes = "update Events SET Description=? where Title=?";
    
    public void UpdateDestination(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.destination = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateDestination);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateLocation(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.location = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateLocation);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateStart(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.startDate = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateStart);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateEnd(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.endDate = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateEnd);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateMax(int toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.maxTraveler = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateMax);
    		ps.setInt(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateHousing(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.housing = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateHousing);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void UpdateDes(String toUpdate, String EventName){
    	for(Event value: DataStorage.eventsMap.values()){
    		if(value.name.equals(EventName)){
    			value.description = toUpdate;
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateDes);
    		ps.setString(1, toUpdate);
    		ps.setString(2, EventName);
    		ps.executeUpdate();
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void updatePw(String UpdateContent, String Username){
    	for(User value : DataStorage.usersMap.values()){
    		if(value.getUsername().equals(Username)){
    			value.setPassword(UpdateContent);
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updatePassword);
    		ps.setString(1, UpdateContent);
    		ps.setString(2, Username);
    		ps.executeUpdate();
    		
    	} catch(SQLException sqle){
    		sqle.printStackTrace();
    	}
    }
    
    public void updateNickname(String UpdateContent, String Username){
    	for(User value : DataStorage.usersMap.values()){
    		if(value.getUsername().equals(Username)){
    			value.setNickname(UpdateContent);
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateNickname);
    		ps.setString(1, UpdateContent);
    		ps.setString(2, Username);
    		ps.executeUpdate();
    		
    	} catch(SQLException sqle){
    		sqle.printStackTrace();
    	}
    }
    
    public void updateAge(int UpdateContent, String Username){
    	for(User value : DataStorage.usersMap.values()){
    		if(value.getUsername().equals(Username)){
    			value.setAge(UpdateContent);
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateAge);
    		ps.setInt(1, UpdateContent);
    		ps.setString(2, Username);
    		ps.executeUpdate();
    		
    	} catch(SQLException sqle){
    		sqle.printStackTrace();
    	}
    }
    
    public void updateGender(int UpdateContent, String Username){
    	for(User value : DataStorage.usersMap.values()){
    		if(value.getUsername().equals(Username)){
    			value.setGender(UpdateContent);
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(updateGender);
    		ps.setInt(1, UpdateContent);
    		ps.setString(2, Username);
    		ps.executeUpdate();
    		
    	} catch(SQLException sqle){
    		sqle.printStackTrace();
    	}
    }
    
    public SqlDriver() {
        try {
           new com.mysql.jdbc.Driver();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void connect() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TarvelMate?user=root&password=student&useSSL=false");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void stop() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addAJoiner(String Username, String Eventname){//add a joiner to the database event table
    	try{
    		PreparedStatement ps = conn.prepareStatement(addJoiner);
    		ps.setString(1, Eventname);
    		ps.setString(2, Username);
    		ps.executeUpdate();
    		for(Event value : DataStorage.eventsMap.values()){
    			if(value.name.equals(Eventname)){
    				value.Joiners.add(Username);
    			}
    		}
    		System.out.println("Adding" + Username + "from event" + Eventname);
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }
    
    public void deleteJoiner(String JoinertoDelete, String FromEvent){
    	for(Event value: DataStorage.eventsMap.values()){
    		for(int i=0; i<value.Joiners.size(); ++i){
    			if(value.Joiners.get(i).equals(JoinertoDelete)){
    				value.Joiners.remove(JoinertoDelete);
    			}
    		}
    	}
    	try{
    		PreparedStatement ps = conn.prepareStatement(deleteJoiner);
    		ps.setString(1,FromEvent);
    		ps.setString(2, JoinertoDelete);
    		ps.executeUpdate();
    		System.out.println("Deleting" + JoinertoDelete + "from event" + FromEvent);
    	} catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void addAUser(User user) {//add a user to the database User table
        try {
            PreparedStatement ps = conn.prepareStatement(addUser);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getNickname());
            ps.setInt(4, user.getAge());
            ps.setInt(5, user.getGender());

            ps.executeUpdate();
            DataStorage.usersMap.put(user.getUsername(), user);
            System.out.println("Adding user to table");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void addAnEvent(Event event){//add an event to the database Event table
    	try{
    		PreparedStatement ps = conn.prepareStatement(addEvent);
    		ps.setString(1, event.getName());
    		ps.setString(2, event.getLocation());
    		ps.setString(3, event.getDestination());
    		ps.setString(4, event.getStartDate());
    		ps.setString(5, event.getEndDate());
    		ps.setInt(6, event.maxTraveler);
    		ps.setString(7, event.housing);
    		ps.setString(8, event.description);
    		ps.setString(9, event.organizer);
    		
    		ps.executeUpdate();
    		DataStorage.eventsMap.put(event.getName(), event);
    		DataStorage.destinationsList.add(event.getDestination());
    		addAJoiner(DataStorage.loggedInUser, event.getName());
            System.out.println("Adding event to table");
    	} catch(SQLException e){
    		e.printStackTrace();
    	}
    }

    public void getAirportsData() {
    	Statement st = null;
        ResultSet rs = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(getAirports);
            while (rs.next()) {
                String city = rs.getString("CityName");
                String airport = rs.getString("AirportCode");
                String country = rs.getString("CountryName");
                DataStorage.addAirportsMap(city, airport); 
                DataStorage.addCountryMap(city, country); 
            }
        }
        catch (SQLException sqle) {
            System.out.println (sqle.getMessage());
        }     	
    }
    
    public void getUsersData(){//get Users data from the database table
    	Statement st = null;
        ResultSet rs = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(getUsers);
            User user;
            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Pw");
                String nickname = rs.getString("NickName");
                int age = rs.getInt("Age");
                int gender = rs.getInt("Gender");

                user = new User(username, password, nickname, age, gender);
                DataStorage.addUserMap(user); 
            }
        }
        catch (SQLException sqle) {
            System.out.println (sqle.getMessage());
        } 
        /*finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (st != null) {
                        st.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException sqle) {
                    System.out.println(sqle.getMessage());
                }
         }*/
    }
    public void getEventsData(){
    	Statement st = null;
        ResultSet rs = null;
        try{
        	st = conn.createStatement();
            rs = st.executeQuery(getEvents);
            
            Event event;
            while (rs.next()){
            	String ename = rs.getString("Title");
            	String edestination = rs.getString("Destination");
            	String elocation = rs.getString("Location");
            	String estart = rs.getString("StartingDate");
            	String eend = rs.getString("EndingDate");
            	int emaxTraveler = rs.getInt("MaxTraveler");
            	String ehousing = rs.getString("Housing");
            	String edescrip = rs.getString("Description");
            	String eOrganizer = rs.getString("Username");
            	event = new Event(ename, elocation, edestination, estart, eend, eOrganizer, emaxTraveler, ehousing, edescrip);
            	
            	DataStorage.eventsMap.put(ename, event);
            	DataStorage.destinationsList.add(edestination);
            }
        } catch(SQLException sqle){
        	System.out.println (sqle.getMessage());
        } /*finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException sqle) {
                System.out.println(sqle.getMessage());
            }
     }*/
    }
    
    public void getJoinersData(){
    	for(Event value: DataStorage.eventsMap.values()){
    		value.Joiners.clear();
    	}
    	Statement st = null;
        ResultSet rs = null;
        try{
        	st = conn.createStatement();
            rs = st.executeQuery(getJoiners);
            while (rs.next()){
            	String tempEventName = rs.getString("EventName");
            	String tempJoinerName = rs.getString("JoinerName");
            	for(Event value: DataStorage.eventsMap.values()){
            		if(value.name.equals(tempEventName)){
            			value.Joiners.add(tempJoinerName);
            		}
            	}
            }
        } catch(SQLException sqle){
        	System.out.println (sqle.getMessage());
        } /*finally {
        try {
        if (rs != null) {
            rs.close();
        }
        if (st != null) {
            st.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException sqle) {
        System.out.println(sqle.getMessage());
    }
}*/
    }
    
}
