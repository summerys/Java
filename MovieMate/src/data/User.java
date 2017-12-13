package data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class User {
	private String userID;
	private String username;
	private String fname;
	private String lname;
	private String password;
	private String URL;
	private String image;
	private List<Event> feed = new ArrayList<>();
	private Set<String> following = new HashSet<>();;
	private Set<String> followers = new HashSet<>();;

	public User(String userID, String username, String password, String fname, String lname, String image
			, Set<String> followers, List<Event> feed) {
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.image = image;
		this.followers = followers;
		this.feed = feed;
		System.out.println("User Created");
	}

	public User(){}
	
	public String getUserID(){
		return userID;
	}
	//GETTERS
	public String getUsername() {
		return username;
	}
	
	public String getFullname(){
		return fname + " "+lname;
	}
	
	public String getImage(){
		return URL;
	}
	
	public String getLName(){
		return lname;
	}
	
	public String getFName() {
		return fname;
	}

	public String getPassword() {
		return password;
	}

	public List<Event> getFeed() {
		return feed;
	}

	public Set<String> getFollowing() {
		return following;
	}
	
	public Set<String> getFollowers(){
		return followers;
	}
	
	//SETTERS
	public void setFName(String fname){
		this.fname = fname;
	}
	
	public void setImage(String URL){
		this.URL = URL;
	}
	
	public void setLName(String lname){
		this.lname = lname;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFeed(List<Event> feed) {
		this.feed = feed;
	}

	public void setFollowing(Set<String> following) {
		this.following = following;
	}

	public void setFollowers(Set<String> set) {
		this.followers = set;
	}
	
	//METHODS
	public void addFollower(String username){
		followers.add(username);
	}
	
	public void addFollowing(String username){
		following.add(username);
	}
	
	public void addEvent(Event event){
		feed.add(event);
	}
}
