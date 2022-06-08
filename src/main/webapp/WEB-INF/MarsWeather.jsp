<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mars Weather</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.rtl.min.css" integrity="sha384-trxYGD5BY4TyBTvU5H23FalSCYwpLA0vWEvXXGm5eytyztxb+97WzzY+IWDOSbav" crossorigin="anonymous">
	<script src= 'http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="bg-dark bg-gradient">
		<h1 class="text-danger">Mars Weather</h1>
		
		<iframe src='https://mars.nasa.gov/layout/embed/image/mslweather/' width='1200' height='600'  scrolling='no' frameborder='0'></iframe>
		
		
		<h2 class="text-danger"> Search pictures from the day</h2>
		<br>
		<p class="text-danger">* sol date = how many Martian days the rover has been on the planet *</p>
		<a href="" class="refresh btn btn-danger mt-4 mb-2">Different Date?</a>
		
		<div class="search">
		<input id="searchVal" class="form-control mb-4" type="text" placeholder="Sol Date">
            
            <button id="searchBtn" class="btn btn-warning mb-4">Search</button>
            
        </div>
		<div class="results">
		
		
        </div>
	</div>
</body>

<script type="text/javascript">
    $(document).ready(function(){
        console.log("helllo there")
        
        $('#searchBtn').click(function(){
            $('.search').hide()
            $('.refresh').show()
            
            var searchVal = document.getElementById("searchVal").value;
            
            $.get("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=" + searchVal + "&page=1&api_key=8oRT62bZA7MbyHEseXRJNZKfzUu9SLe2aa6rOliz").done(function(photos) {
            	
            		console.log("success got data", photos); 

            // if there is no data output (no search result or no search input)
            if(photos.length < 1) {
                $('.results').append('<h1 class="display-4 text-warning">Showing <span class="text-danger"> 0 </span> Results! </h1> <h1 class="display-4 text-warning">Please give us something different to search for!</h1>') 
            } else {
                // if there is a data output
                $('.results').append('<h1 class="display-4 text-warning">Showing <span class="text-danger"> </span> Results for sol <span class="text-danger"> "' + searchVal + ' "</span></h1>') 
                for(var key in photos){
                	 console.log(photos[key].length)
                	let arr = photos[key];
                // loop through data to access each individual gif in results
                for(var i = 0 ; i < arr.length ; i ++) {
                    console.log("I am the new comment",arr[i].id);

                    // add img to the div 'results' ; as loop continues, more gifs will populate and generate urls
                    // used 'fixed_height' to retain some structure to look of site
                    $('.results').append('<img class="shadow p-3 m-3 bg-white rounded" src="' + arr[i].img_src + '" alt="' + arr[i].title + '">')
                //console.log("I am below the data", photos[i])
                }
            }
            } // end of else statement
        }); // end of api call
        
            $('.refresh').click(function(){
                location.reload(true);
            });
        })
    });
</script>
</html>
