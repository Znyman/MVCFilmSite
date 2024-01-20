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
     <input type="hidden" name="id" value="${film.id}">
    <label for="title"><em>Enter New Film Title:</em></label>
    <input type="text" id="title" name="title" required> 
    <br><br>
    
    <label for="description"><em>Enter New Film Description:</em></label>
    <input type="text" id="description" name="description" required> 
    <br><br>
    
    <label for="releaseYear"><em>Enter New Film Release Year:</em></label>
    <input type="number" id="releaseYear" name="releaseYear" value="1">
    <br><br>
    
    <label for="languageID"><em>Enter New Film Language ID:</em></label> 
    <input type="number" id="languageID" name="languageID" value="1">
    <br>
    <p>1. English 2. Italian 3. Japanese 4. Mandarin 5. French 6. German</p>
    <br><br>
    
    <label for="rentalDuration"><em>Enter New Film Rental Duration:</em></label>
    <input type="number" id="rentalDuration" name="rentalDuration" value="1">
    <br><br>
    
    <label for="rentalRate"><em>Enter New Film Rental Rate:</em></label>
    <input type="number" id="rentalRate" name="rentalRate" value="1">
    <br><br>
    
    <label for="length"><em>Enter New Film Length:</em></label>
    <input type="number" id="length" name="length" value="1">
    <br><br>
    
    <label for="replacementCost"><em>Enter New Film Replacement Cost:</em></label>
    <input type="number" id="replacementCost" name="replacementCost" value="1">
    <br><br>
      
    <input type="submit" value="Update Film">
</form>




<h3>Would you like to delete this film?</h3>
    <br>
    <form action="DeleteFilm.do" method="POST" id="filmForm">
        <input type="hidden" name="id" value="${film.id}">
        <input type="submit" value="Delete film">
   
    </form>


</body>
</html>