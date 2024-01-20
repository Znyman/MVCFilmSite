<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Film Details</title>
</head>
<body>
    <h1>Film Details</h1>
    
  
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



</body>
</html>