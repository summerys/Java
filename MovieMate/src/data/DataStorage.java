package data;

import database.MySql;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

//extends DataParsing class which holds on the data structures and parses the xml file
public class DataStorage{
 	
 	//Adding data from Dataparsing
	public static Map<String, User> usersMap = new HashMap<>();;
	//maps a movie title to a movie object
	public static Map<String, Movie> moviesMap = new HashMap<>();;
	//maps a case insensitive username to a list of case sensitive matches
	protected static Map<String, Set<User>> usernameToUsers = new HashMap<>();;
	protected static Map<String, Set<User>> firstNameToUsers = new HashMap<>();;
	protected static Map<String, Set<User>> lastNameToUsers = new HashMap<>();;
	//maps a username to a list of followers
	private static Map<String, Set<String>> usernameToFollowers = new HashMap<>();;
	//maps an actor to a list of movies
	protected static Map<String, Set<Movie>> actorToMovies = new HashMap<>();;
	//maps a genre to a list of movies
	protected static Map<String, Set<Movie>> genreToMovies = new HashMap<>();;
	//maps a case insensitive movie title to a list of case sensitive matches
	protected static Map<String, Set<Movie>> titleToMovies = new HashMap<>();;
//	protected Map<String, Movie> titleToMovie = new HashMap<>();
	//genres
	private static List<String> genresList = new ArrayList<>();;
	//actions
	private static List<String> actionsList = new ArrayList<>();;
	//maps an action to the icon associated with it
	//unfortunately doing this makes the assumption we only have the actions: rated, liked, disliked and watched
	protected static Map<String, String> actionToIcon  = new HashMap<>();;

	private static User loggedInUser;
	//class with methods to alter the XML file
	private static DataSaving dataSaving;
	
	public DataStorage(){
		//super(filepath);
		//dataSaving = new DataSaving(doc, filepath);

	}

	public static void addGenres(String genre){
		genresList.add(genre);
	}

	public static void addActions(String action){
		actionsList.add(action);
	}
	
	//search methods
	public static Set<Movie> searchByGenre(String genre){
		return genreToMovies.get(genre.toLowerCase());
	}
	
	public static Set<Movie> searchByTitle(String title){
		return titleToMovies.get(title.toLowerCase());
	}
	
	public static Set<Movie> searchByActor(String actor){
		return actorToMovies.get(actor.toLowerCase());
	}
	
	//retrieve all users with matching username, fname or lname
	public static Set<User> searchForUser(String username){
		Set<User> userSets = new HashSet<>();
		Set<User> usernames = usernameToUsers.get(username.toLowerCase());
		Set<User> fnames = firstNameToUsers.get(username.toLowerCase());
		Set<User> lnames = lastNameToUsers.get(username.toLowerCase());
		
		if (usernames != null) userSets.addAll(usernames);
		if(fnames != null) userSets.addAll(fnames);
		if (lnames != null) userSets.addAll(lnames);
		
		return userSets;
	}

	
	//getters
	public static User getUser(String usernanme){
		return usersMap.get(usernanme);
	}
	
	public static User getLoggedInUser(){
		return DataStorage.loggedInUser;
	}
	
	public static Movie getMovie(String title){
		return moviesMap.get(title);
	}
	
	//setters
	public static void setLoggedInUser(String username){
		loggedInUser = usersMap.get(username);
		DataSaving.setLoggedInUser(loggedInUser);
	}
	
	//validation methods
	
	//check if a username is valid
	public static Boolean validUsername(String username){
		System.out.println("checking username " + username);
		System.out.println(usersMap.containsKey(username));
		return usersMap.containsKey(username);
	}
	//check if a password is correct
	public static Boolean correctPassword(String username, String password){
		return usersMap.get(username).getPassword().equals(password);
	}
	
	//modify data methods
	public static void addEvent(String actionTaken, String title, Integer ratingGiven){
		//save the newe event to the xml file
		dataSaving.addEvent(actionTaken, title, ratingGiven);
		//create event object and add it to logged in user's feed
		Event event = new Event();
		event.setAction(actionTaken);
		event.setMovie(moviesMap.get(title));
		
		if (ratingGiven != null){
			event.setRating(ratingGiven);
		}
		
		event.setUsername(loggedInUser.getUsername());

		if (event.getAction().equals(StringConstants.ACTION_RATED)){
			event.setActionIcon(actionToIcon.get(event.getRatingToDisplay()+StringConstants.ACTION_RATED));
		}
		else{
			event.setActionIcon(actionToIcon.get(event.getAction()));
		}
		
		loggedInUser.getFeed().add(event);
	}
	
	public static void removeFollowing(String username){
		dataSaving.removeFollowing(getUser(username));
	}
	
	public static void addFollowing(String username){
		dataSaving.addFollowing(getUser(username));
	}
	
	public static void addUser(User user) throws ClassNotFoundException{
		//add the new user to all the appropriate maps
		usersMap.put(user.getUsername(), user);
//		addObjectToMap(usernameToUsers, user.getUsername().toLowerCase(), user);
//		addObjectToMap(firstNameToUsers, user.getFName().toLowerCase(), user);
//		addObjectToMap(lastNameToUsers, user.getLName().toLowerCase(), user);

		//save the new user to the xml file
		MySql sqld = new MySql();
		sqld.connect();
		sqld.addUser(user);
		
		try {
			dataSaving.createNewUser(user);
		} catch (ParserConfigurationException | SAXException | IOException e) {
			System.out.println("Exception thrown in creating user "+e.getMessage());
		}
	}
	
	//change the average rating of the movie
	public static void changeRating(String title, Integer rating){
		//add a rated event to the logged in user
		addEvent(StringConstants.ACTION_RATED, title, rating);
		//update the rating of the movie object
		Movie movie = moviesMap.get(title);
		movie.incrementRatingCount();
		movie.updateRatingTotal(rating);
		//save the rating changes to the xml file
		dataSaving.changeRating(title, movie);
	}

}