
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Set" %>
<%@ page import="data.Movie" %>
<%@ include file="navbar.jsp" %>
<%@ page import="data.DataStorage" %>
<html>

<head>
	<title>Search</title>
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/pre-login.css">
	<link rel="stylesheet" href="../css/search.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
  			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  			crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
 	<script>

 	function parseMovie(movieInfo) {
 	    if (movieInfo.Response == 'True') {
 	        // Get all values and add to page
 	        var title = movieInfo.Title;
			console.log('Response -> true', movieInfo);
 	        $('#genre').text(movieInfo.Genre);
 	        $('#director').text(movieInfo.Director);
 	        $('#actors').text(movieInfo.Actors);
 	        $('#writers').text(movieInfo.Writer);
	
 	        for (var i = 0; i < movieInfo.Ratings.length; i++) {
 	            var rating = movieInfo.Ratings[i];
 	            if (rating.Sourcse != null && rating.Source == 'Internet Movie Database') {
 	                $('#imdbRating').val(rating.Value);
 	                // call drawStars if not already happening here
 	            }
 	        }

 	        $('#plot').val(movieInfo.Plot);
 	    } 
 	    else // Movie not found
 	    {
 	    	
 	    console.log('Response -> false', movieInfo);
 	        alert('No movie found!');
 	    }
 	}

 	function parseResults(data) {
 		// set title
	 	var title = data.Title;
		var hrefUrl = "${pageContext.request.contextPath}/jsp/movie_profile.jsp?<%=StringConstants.TITLE %>=" + title;
		
		// if multiple
		var html = '<tr><td><a href=' + hrefUrl + '>' + title + '</a></td></tr>';
		console.log(hrefUrl);
		console.log(html);
		console.log($('#searchResults'))
		$('#searchResults').append(html);
 	}	
 	
 	function getSearchResults(searchInput) {
 	    var movieInfoUrl = 'https://www.omdbapi.com/?t=' + searchInput;

 	    $.ajax(movieInfoUrl, {
 	        async: false,
 	        method: 'GET',
 	        success: function(data, textStatus, jqXHR) {
 	        	console.log('data -> ', data);
 	            parseResults(data);
 	            $.cookie('SearchResultsTemp', data);
 	        },
 	        error: function(jqXHR, textStatus, errorThrown) {
 	      	console.log('error');
 	            console.log(textStatus);
 	            console.log(errorThrown);
 	        }
 	    });
 	}  
 	</script>
</head>
<body>
	<div id = "outer_container">
		<div id = "inner_container">
			
			<div id = "search">

				<table>
					<thead >
						<tr>
							<td>Search Results</td>
						</tr>
					</thead>
					<tbody id='searchResults'>
					
					<!-- if it is a user search and we have results -->
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%
	//holds whether this is a user search
	Boolean userSearch = request.getParameter("search_type").equals(StringConstants.USER);
	//get the search input from the request and split it
	String[] splitSearch = request.getParameter(StringConstants.SEARCH_PARAM).split(":");
	Set<Movie> movieResults = null;
	Set<User> userResults = null;

	if (userSearch){
		userResults = DataStorage.searchForUser(splitSearch[0].trim());
		if (userSearch && userResults != null) {			
			for (User result : userResults) { %>			
			<script>$('#searchResults').append('<tr><td><a href = "${pageContext.request.contextPath}/jsp/user_profile.jsp?<%=StringConstants.USERNAME %>=<%= result.getUsername() %>"><%= result.getUsername()%></a></td></tr>');</script>
			<% }
		}	
	}
	else
	{
		String search = (splitSearch[0].trim()).replace(' ', '+');
		System.out.println(search);
		%> 
			<script>getSearchResults("<%=search%>");</script>
		<%
	}
%>
</body>
</html>