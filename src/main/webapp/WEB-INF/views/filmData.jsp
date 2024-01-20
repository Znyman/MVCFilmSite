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
	<form action=".do" method="POST" id="filmForm">
		
		<label for="title"><em>Enter New Film Title:</em></label>
		 <input type="text" id="title" name="title" required> 

		<label for="description"><em>Enter New Film Description:</em></label>
		<input type="text" id="description" name="description" required> 
		<input type="submit" value="Add Film">
	</form>



<h3>Would you like to delete this film?</h3>
    <br>
    <form action="DeleteFilm.do" method="POST" id="filmForm">
        <input type="hidden" name="filmId" value="${film.id}">
        <input type="submit" value="Delete film">
   
    </form>


</body>
</html>