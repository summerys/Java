<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="data.Actor" %>
<%@ page import="data.Movie" %>
<%@ include file="navbar.jsp" %>
<%@ page import="data.DataStorage" %>
<html>
<% 
   Movie movie = DataStorage.getMovie(request.getParameter(StringConstants.TITLE));
%>
<head>
	<title>Movie Profile</title>
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/movie_profile.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
	<script src = "../js/movie_profile.js"></script>
	<script>
	
	var movieInfo = $.cookie('SearchResultsTemp'); 

 	function populateMovieProfile() {
 		if (movieInfo.Response == 'True') {
 			
 			var data = movieInfo;
 	        // Get all values and add to page
 
			$('#image').attr('title', data.Title);
			
			$('#movie_title').attr('title', data.Title);
			$('#movie_title').text(data.Title);
			$('#directors').text('Directors: ' + data.Directors);
			$('#actors').text('Actors: ' + data.Actors);
			$('#writers').text('Actors: ' + data.Writers);
			
			/* 
 	        $('#genre').text(movieInfo.Genre);
 	        $('#director').text(movieInfo.Director);
 	        $('#actors').text(movieInfo.Actors);
 	        $('#writers').text(movieInfo.Writer);
 	        $('#description').text(movieInfo.Plot);
	 */
 	        for (var i = 0; i < movieInfo.Ratings.length; i++) {
 	            var rating = movieInfo.Ratings[i];
 	            if (rating.Sourcse != null && rating.Source == 'Internet Movie Database') {
 	                $('#imdbRating').val(rating.Value);
 	                // call drawStars if not already happening here
 	            }
 	        }
 	    }
 		else // Movie not found {
 	        alert('Something went wrong! Try searching for a movie again!');
 	    }
 	}

 	function getActor(searchInput) {
 	    var movieInfoUrl = 'https://www.omdbapi.com/?t=' ;

 	    $.ajax(movieInfoUrl, {
 	        async: false,
 	        method: 'GET',
 	        success: function(data, textStatus, jqXHR) {
 	        	console.log('data -> ', data);
 	            parseMovie(data);
 	        },
 	        error: function(jqXHR, textStatus, errorThrown) {
 	      	console.log('error');
 	            console.log(textStatus);
 	            console.log(errorThrown);
 	        }
 	    });
 	}
 	
 	function populateActorProfiles() {
 		var actors = movieInfo.Actors.split(',');

 		for (var i = 0; actors.length; i++)
		{
 			var html = '<tr><td><img src="' 
 				+ ImageUrl 
 				+  '" title="' 
 				+ actor +  '">"></td><td>' 
 				+ actor + '</td></tr>'
			$('#cast_container').append(html);
 		}
 	}
 	
 	function drawStars(rating) {
 		
 		for (var i = 0; i < window.parseInt(rating); i++)
		{
 			$('#imdb_rating_stars').append('<span>★</span>');
 		}
 		
 		for (var j = 0; j < (10 - rating); j++)
 		{
 			$('#imdb_rating_stars').append('<span>☆</span>');
 		}
 	}
 	
 	function newEvent(action) {
 		var action = null;
 		
 		switch(action)
 		{
 		case 'w':
 			action = '<%=StringConstants.ACTION_WATCHED %>';
 			break;	
 		case 'l':
 			action = '<%=StringConstants.ACTION_LIKED %>';
 			break;
 		case 'd':
 			action = '<%=StringConstants.ACTION_DISLIKED %>';
 			break;
 		}
 		return newEvent(' + action + ',' + movieInfo.Title + ', "<%=StringConstants.TITLE%>", "<%=StringConstants.ACTION%>")';
 		
 	}
 	</script>
</head>
<body>
	<div id = "outer_movie_container">
		<div id = "movie_container">
			
			<img id="image" src="" title="">
			<div id = "movie_title"></div>
			<div id = "directors"></div>
			<div id = "actors"></div>
			<div id = "writers"></div>
			<div id = "movie_rating_container">
				<div id="imdb_rating_stars"></div>
					
				<div id = "average_movie_rating">			
				</div>
				<div id = "user_movie_rating">
<!-- 			display stars for the user rating ability
				set the id of each star to be what the rating is if it was cicked
				the rateMovie function takes in the current star element, the movie title, and the strings to be used as the keys for the title and rating parameters in the ajax url -->
				
				</div>
			</div>
			
			<br>
			<br>
			<br>
			<br>
			
			<div id = "description"></div>

			<br style = "clear: both">

			<div id = "movie_actions">
				<!-- pass in the action taken, the movie title, and the strings used as the parameter keys for the title and action in the ajax url -->
				<img id="watched" src = "../img/actions/watched.png" class = "clickable" title = "<%=StringConstants.ACTION_WATCHED %>" onclick = "return newEventWrapper())">
				<img id="liked" src = "../img/actions/liked.png" class = "clickable" title = "<%=StringConstants.ACTION_LIKED %>" onclick = "return newEventWrapper()">
				<img id="disliked" src = "../img/actions/disliked.png" class = "clickable" title = "<%=StringConstants.ACTION_DISLIKED%>" onclick = "return newEventWrapper()">
			</div>
		</div>

	</div>
	
	<br style = "clear: both">

	<div id = "cast_title">
		Cast
	</div>

	<table id = "cast_container">

	</table>
	
	<script>
	populateMovieProfile();
	//populateActorProfiles();
	
	</script>
</body>
