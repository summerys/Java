package database;
import data.*;
import com.mysql.jdbc.Driver;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

public class MySql {
   
   private Connection conn;
   private Properties properties;   
   private static String db = "";
   private static String ipaddress = "";
   private static String user = "";
   private static String pw = "";

   private final static String getGenres = "SELECT * FROM Genres";
   private final static String getActions = "SELECT * FROM Actions";
   private final static String getMovies = "SELECT * FROM Movies"; 

   private final static String getUser = "SELECT * FROM Users";
    private final static String addUser = "INSERT INTO Users(username, password_ , fname, lname ) VALUES(?,?,?,?)";
    private final static String getActors =  "SELECT a.fname, a.lname, a.image FROM  summerys_cinemate.Actors a INNER JOIN  summerys_cinemate.Movies_Actor ma ON a.actorID = ma.actorID" + 
          " INNER JOIN  summerys_cinemate.Movies m ON ma.movieID = m.movieID AND m.movieID = ";
    private final static String getWriters = "SELECT w.writer FROM  summerys_cinemate.Writers w INNER JOIN  summerys_cinemate.Movies_Writer mw ON w.writerID = mw.writerID" + 
          " INNER JOIN  summerys_cinemate.Movies m ON mw.movieID = m.movieID AND m.movieID = ";
   private final static String addFollowing = "INSER INTO UserFollowing(userID, followingUserID) VALUES(?,?)";
   private final static String getFollowers = "SELECT u.username FROM UserFollowing uf INNER JOIN Users u " +
         "ON uf.followingUserID = u.userID AND uf.userID = ";
   private final static String getEvent = "SELECT a.action_, m.title, u.username, fe.rating " +
         "FROM FeedEvent fe INNER JOIN Users u ON fe.userID = u.userID INNER JOIN Movies m "+
         "ON fe.movieID = m.movieID INNER JOIN Actions a ON fe.actionID = a.actionID AND fe.userID = ";
            
   
   public MySql(String ipaddress, String db, String user, String pw){
   
   System.out.println("inside mysql");
   System.out.println("in my sql" + ipaddress);
   
    try {
           new com.mysql.jdbc.Driver();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
      this.db = db;
      this.ipaddress = ipaddress;
      this.user = user;
      this.pw = pw;
   }
   
   public MySql(){
     try {
           new com.mysql.jdbc.Driver();
         } catch (SQLException e) {
               e.printStackTrace();
         }    
   }
   
    public Connection connect() throws ClassNotFoundException {    
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://" + ipaddress + "/" 
                   + db + "?user=" + user +"&password=" + pw + "&useSSL=false");
                System.out.println("Connected");
            } catch ( SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
  
          // disconnect database
    public void disconnect() {
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }//disconnect
    

     public void getGenresData(){
        Statement st = null;
        ResultSet rs = null;
        try {
           
           st = conn.createStatement();
           rs = st.executeQuery(getGenres);
           while (rs.next()) {
              String genre = rs.getString("genre");
              System.out.println("genre is " + genre);
              DataStorage.addGenres(genre);
           }
        }
        catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
     }

     public void getActionsData(){
        Statement st = null;
        ResultSet rs = null;
        try {
           st = conn.createStatement();
           rs = st.executeQuery(getActions);
           while (rs.next()) {
              String action = rs.getString("action_");
              System.out.println("action is " + action);
              DataStorage.addActions(action);
           }
        }
        catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
     }

     public void getMoviesData() {
        Statement st = null;
        ResultSet rs = null;        
        
        try {
           st = conn.createStatement();
           rs = st.executeQuery(getMovies);
           Movie movie; 
           while (rs.next()) {
              
              String movieid = rs.getString("movieID");
              String title = rs.getString("title");
              String director = rs.getString("director");
              String image = rs.getString("image");
              String year_ = rs.getString("year_");
              String description = rs.getString("description");
              
              System.out.println("movie info is " + title + " " + director + " "+ year_ + " " + description);
              
              List<Actor> actors = getActorsData(movieid);
              System.out.println("after actorData");
              List<String> writers = getWritersData(movieid);
              System.out.println("afte rwriterData");
                
                
              movie = new Movie(title, director,image, description, year_, actors, writers);
              DataStorage.moviesMap.put(title, movie);
           }
        }
        catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
     }
     
     public List<Actor> getActorsData(String movieID){
        
        Statement st = null;
        ResultSet rs = null;
        Actor actor; 
      List<Actor> actors = new ArrayList<>();
        
        try{
           st = conn.createStatement();
         rs = st.executeQuery( getActors + movieID);
         
         while(rs.next()) {
            String fname = rs.getString("fname");
            System.out.println("fname is " + fname);
            String lname = rs.getString("lname");
            System.out.println("lname is " + lname);
            String image = rs.getString("image");
            System.out.println("image is " + image);
            System.out.println("Actor info is " + fname +" " + lname);
            actor = new Actor(fname, lname, image);
            actors.add(actor);
         }
        } catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
        
        return actors;
     }
     
     public List<String> getWritersData(String movieID){
        
        Statement st_writer = null;
        ResultSet rs_writer = null;
        List<String> writer_temp = new ArrayList<>();
        
        try{
           st_writer = conn.createStatement();
         rs_writer = st_writer.executeQuery(getWriters + movieID);
            
         while(rs_writer.next()) {
            String writer = rs_writer.getString("writer");
            System.out.println("Writer is " + writer);
            writer_temp.add(writer);
         }
        } catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
      
      return writer_temp;
     }
     

    public void getUsersData() {
          
        Statement st = null;
        ResultSet rs = null;
        
        Statement st_action = null;
        ResultSet rs_action = null;
        Statement st_rated = null;
        ResultSet rs_rated = null;
        
        try {
           st = conn.createStatement();
           rs = st.executeQuery(getUser);
           User user;
           while (rs.next()) {
              String userID = rs.getString("userID");
              String username = rs.getString("username");
              String password_ = rs.getString("password_");
              String fname = rs.getString("fname");
              String lname = rs.getString("lname");
              String image = rs.getString("image");
              System.out.println("user info is " + username + " " + password_ + " " + fname + " " + lname);
              
              Set<String>followers = getFollowers(userID);
              List<Event> feed = getEvent(userID);
              
              user = new User(userID, username, password_, fname, lname, image, followers, feed);
            DataStorage.usersMap.put(username, user);
         }
         
        }
        catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
     }   
    
//   public void addFollowing(User user, String username){
//      
//      try{
//         PreparedStatement ps = conn.prepareStatement(addFollowing);
//         ps.setInteger(1, user.getUserID());
//         ps.setString(, x);
//         
//         ps.executeUpdate();
//      } catch(SQLException e){
//         e.printStackTrace();
//      }
//   };
//   public void removeFollowing(User user, String username){};
    
//   public void addFollower(User user, String username){};
   
//   public void removeFollower(User user, String username){};
   
    public Set<String> getFollowers(String userID){
       
      Statement st = null;
        ResultSet rs = null;
        Set<String> followers = new HashSet<>();
        
        try{
         st = conn.createStatement();
         rs = st.executeQuery(getFollowers + userID);
         
         while(rs.next()) {
            String username_follower = rs.getString("username");
            System.out.println("follower : " + username_follower);
            followers.add(username_follower);
         }
         
        }catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
        
        return followers;
    }
    
    public List<Event> getEvent (String userID){
       
       Statement st = null;
       ResultSet rs = null;
       List<Event> feed = new ArrayList<>();
       
       Event event;
       
       try{
          st = conn.createStatement();
          rs = st.executeQuery(getEvent + userID);
          
          while(rs.next()) {
             
             String action = rs.getString("action_");
             String movieTitle = rs.getString("title");
             String username = rs.getString("username");
             int rating = rs.getInt("rating");
             String actionIcon ="";
             
             switch(action){
                case "liked" : actionIcon = "liked.png";
                            break;
                case "disliked" : actionIcon = "disliked.png";
                               break;
                case "watched" : actionIcon = "watched.png";
                              break;
             }
             
             switch(rating){
                case -1 : actionIcon = "rating0.png";
                         break;
                case 1: actionIcon = "rating1.png";
                        break;
                case 2: actionIcon = "rating2.png";
                        break;
                case 3: actionIcon = "rating3.png";
                        break;
                case 4: actionIcon = "rating4.png";
                       break;
                case 5: actionIcon = "rating5.png";
                         break;
             }
             System.out.println("Event : " + action + " " + movieTitle + " "+ username
                   + " " + rating + " " + actionIcon);
             Movie movie = DataStorage.getMovie(movieTitle);
             event = new Event(action, movie, movieTitle, username, rating, actionIcon);
             feed.add(event);
          }
       }catch (SQLException sqle) {
              System.out.println(sqle.getMessage());
        }
       
      return feed; 
    }
           
    public void addUser(User user){
        try{
           PreparedStatement ps = conn.prepareStatement(addUser);
           ps.setString(1, user.getUsername());
           ps.setString(2, user.getPassword());
           ps.setString(3, user.getFName());
           ps.setString(4, user.getLName());
           ps.executeUpdate();
        }
        catch (SQLException sqle) {
           System.out.println(sqle.getMessage());
        }
     }
}