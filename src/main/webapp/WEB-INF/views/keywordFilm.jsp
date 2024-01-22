<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Film Keyword Search</title>
</head>
<body>
	<div class="mb-3" style="padding: 0 500px;">
		<h2>Search Results:</h2>


		<c:forEach var="film" items="${films}">

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
		</c:forEach>

	</div>

	<div class="mb-3" style="padding: 0 500px;">
		<h2>Would you like to modify a film?</h2>
		<form action="UpdateFilm.do" method="POST" id="filmForm">
			<label for="id" required><em>Enter Film ID:</em></label> <input
				type="number" class="form-control" name="id" value="${film.id}">
			<label for="title"><em>Enter New Film Title:</em></label> <input
				type="text" class="form-control" id="title" name="title"> <label
				for="description"><em>Enter New Film Description:</em></label> <input
				type="text" class="form-control" id="description" name="description">
			<label for="releaseYear"><em>Enter New Film Release
					Year:</em></label> <input type="number" class="form-control" id="releaseYear"
				name="releaseYear" value="1" required> <label
				for="languageID"><em>Enter New Film Language ID:</em></label> <input
				type="number" class="form-control" id="languageID" name="languageID"
				value="1" required> <br>
			<p>1. English 2. Italian 3. Japanese 4. Mandarin 5. French 6.
				German</p>
			<br> <label for="rentalDuration"><em>Enter New Film
					Rental Duration:</em></label> <input type="number" class="form-control"
				id="rentalDuration" name="rentalDuration" value="1" required>
			<br> <label for="rentalRate"><em>Enter New Film
					Rental Rate:</em></label> <input type="number" class="form-control"
				id="rentalRate" name="rentalRate" value="1" required> <br>
			<label for="length"><em>Enter New Film Length:</em></label> <input
				type="number" class="form-control" id="length" name="length"
				value="1" required> <br> <label for="replacementCost"><em>Enter
					New Film Replacement Cost:</em></label> <input type="number"
				class="form-control" id="replacementCost" name="replacementCost"
				value="1" required> <br>
			<input type="submit" class="btn btn-primary" value="Update Film">
		</form>
	</div>
	<div class="mb-3" style="padding: 0 500px;">
		<h3>Would you like to delete a film?</h3>

		<form action="DeleteFilm.do" method="POST" id="filmForm">
			<label for="id"><em>Enter film ID to delete:</em></label> <input
				type="number" class="form-control" name="id" value="${film.id}"><br>
			<input type="submit" class="btn btn-primary" value="Delete film">

		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>