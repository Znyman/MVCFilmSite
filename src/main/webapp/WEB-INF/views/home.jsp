<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Film Query</title>
</head>
<body>
	<center><h1>Film Query</h1></center>
	<br>
	<div class="mb-3" style="padding: 0 500px;">
	<h2>Find film by ID</h2>
	<form action="GetFilmId.do" method="GET" id="filmForm">
		<label for="id">Enter Film ID:</label>
		<input type="text" id="id" class="form-control" name="id" required> 
			<br>
			<input type="submit" class="btn btn-primary" value="Get Details">
	</form>
	</div>
	<br>

	<br>
	<div class="form-group" style="padding: 0 500px;">
	<h2>Find film by keyword</h2>
	<form action="KeywordFilm.do" method="GET" id="filmForm">
		<label for="filmKeyword">Enter Film Keyword:</label>
		<input type="text" class="form-control" id="filmKeyword" name="filmKeyword" required> 
			<br>
			<input type="submit" class="btn btn-primary" value="Get Details">
	</form>
	</div>
	<br>
	<div class="form-group" style="padding: 0 500px;">
	<h2>Add a film to database</h2>
	<form action="NewFilm.do" method="POST" id="filmForm">
		
		<label for="title"><em>Enter Film Title:</em></label>
		 <input type="text" class="form-control" id="title" name="title" required> 

		<label for="description"><em>Enter Film Description:</em></label>
		<input type="text" class="form-control" id="description" name="description" required> 
		<br>
		<input type="submit" class="btn btn-primary" value="Add Film">
	</form>
	</div>
	


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
