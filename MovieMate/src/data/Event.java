package data;

public class Event {

	private String action;
	private Movie movie;
	private String movieTitle;
	private String username;
	private int rating;
	private String actionIcon;
	
	public Event(String action, Movie movie, 
			String movieTitle, String username, int rating, 
			String actionIcon){

		this.action = action;
		this.movie = movie;
		this.movieTitle = movieTitle;
		this.username = username;
		this.rating = rating;
		this.actionIcon = actionIcon;
		System.out.println("created Event");
	}
	
	public Event(){}
	
	//SETTERS
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setAction(String action){
		this.action = action;
	}

	public void setActionIcon(String actionIcon){
		this.actionIcon = actionIcon;
	}
	
	public void setRating(int rating){
		this.rating = rating;
	}
	
	public void setMovie(Movie movie){
		this.movie = movie;
		this.movieTitle = movie.getTitle();
	}
	
	//GETTERS
	public String getAction() {
		return action;
	}

	public String getActionIcon(){
		return actionIcon;
	}
	
	public Movie getMovie() {
		return movie;
	}

	public String getUsername() {
		return username;
	}
	
	public double getRating(){
		return rating;
	}
	
	public String getMovieTitle(){
		return movieTitle;
	}
	
	public String getRatingToDisplay(){
		Double halvedRating = (double)rating/ (double)2;
		return Long.toString(Math.round(halvedRating));
	}
	
}
