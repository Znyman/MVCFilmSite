<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Film Details</title>
</head>
<body>
  
  <c:choose>
    <c:when test="${! empty film}">
      
 	<p>${film.id}</p>
	<p>${film.title}</p>
	<p>${film.description}</p>
	<p>${film.releaseYear}</p>
	<p>${film.languageID}</p>
	<p>${film.rentalDuration}</p>
	<p>${film.rentalRate}</p>
	<p>${film.length}</p>
	<p>${film.replacementCost}</p>
	<p>${film.rating}</p>
	<p>${film.specialFeatures}</p>
	<p>${film.actors}</p>
	<p>${film.language}</p>
 
    </c:when>
    <c:otherwise>
      <p>No film found</p>
    </c:otherwise>
  </c:choose>

<h2>Would you like to modify this film?</h2>
	<form action="UpdateFilm.do" method="POST" id="filmForm">
		
		<label for="title"><em>Enter New Film Title:</em></label>
		<input type="text" id="title" name="title" required> 
		<br>
		<label for="description"><em>Enter New Film Description:</em></label>
		<input type="text" id="description" name="description" required> 
		<br>
		<label for="release year"><em>Enter New Film Release Year:</em></label>
		<input type="text" id="release year" name="release year" required> 
		<br>
		<label for="language id"><em>Enter New Film Language ID:</em></label>
		<input type="text" id="language id" name="language id"> 
		<br>
		<label for="rental duration"><em>Enter New Film Rental Duration:</em></label>
		<input type="text" id="rental duration" name="rental duration"> 
		<br>
		<label for="rental rate"><em>Enter New Film Rental Rate:</em></label>
		<input type="text" id="rental rate" name="rental rate"> 
		<br>
		<label for="length"><em>Enter New Film Length:</em></label>
		<input type="text" id="length" name="length"> 
		<br>
		<label for="replacement cost"><em>Enter New Film Replacement Cost:</em></label>
		<input type="text" id="replacement cost" name="replacement cost"> 
		<br>
		<label for="rating"><em>Enter New Film Rating:</em></label>
		<input type="text" id="rating" name="rating"> 
		<br>
		<label for="special features"><em>Enter New Film Special Features:</em></label>
		<input type="text" id="special features" name="special features"> 
		<br>
		<label for="actors"><em>Enter New Film Actors:</em></label>
		<input type="text" id="actors" name="actors" > 

		<input type="submit" value="Update Film">
	</form>



<h3>Would you like to delete this film?</h3>
    <br>
    <form action="DeleteFilm.do" method="POST" id="filmForm">
        <input type="hidden" name="filmId" value="${film.id}">
        <input type="submit" value="Delete film">
   
    </form>


</body>
</html>