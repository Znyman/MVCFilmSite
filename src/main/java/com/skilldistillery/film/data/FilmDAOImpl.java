package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Repository
public class FilmDAOImpl implements DatabaseAccessor {
	
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid";
	private static final String USER = "student";
	private static final String PASS = "student";

	public FilmDAOImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}


	@Override
	public Film findFilmById(int filmId) {
		Film film = null;

		String sqlQuery = "SELECT * FROM film WHERE id = ?";
		PreparedStatement statement;
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			statement = conn.prepareStatement(sqlQuery);
			statement.setInt(1, filmId);
			ResultSet results = statement.executeQuery();
			if (results.next()) {
				film = constructFilm(results);
			}
			results.close();
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return film;
	}

	@Override
	public List<Film> findFilmsByActorId(int actorId) {
		List<Film> films = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			String sqlQuery = "SELECT * FROM film JOIN film_actor ON film.id = film_actor.film_id "
					+ " WHERE film_actor.actor_id = ?";
			PreparedStatement statement = conn.prepareStatement(sqlQuery);
			statement.setInt(1, actorId);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				Film film;
				// DO NOT USE constructFilm() BECAUSE IT WILL RESULT IN RECURSIVE CALLS FROM
				// findActorsByFilmId()
				film = new Film(results.getInt("id"), results.getString("title"), results.getString("description"),
						results.getShort("release_year"), results.getInt("language_id"),
						results.getInt("rental_duration"), results.getDouble("rental_rate"), results.getInt("length"),
						results.getDouble("replacement_cost"), results.getString("rating"),
						results.getString("special_features"));
				films.add(film);
			}
			results.close();
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return films;
	}

	@Override
	public List<Film> findFilmsByKeyword(String keyword) {
		List<Film> films = new ArrayList<>();

		String sqlQuery = "SELECT * FROM film WHERE title LIKE ? OR description LIKE ?";
		PreparedStatement statement;
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			statement = conn.prepareStatement(sqlQuery);
			statement.setString(1, "%" + keyword + "%");
			statement.setString(2, "%" + keyword + "%");
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				Film film = new Film(results.getInt("id"), results.getString("title"), results.getString("description"),
						results.getShort("release_year"), results.getInt("language_id"),
						results.getInt("rental_duration"), results.getDouble("rental_rate"), results.getInt("length"),
						results.getDouble("replacement_cost"), results.getString("rating"),
						results.getString("special_features"), findActorsByFilmId(results.getInt("id")));
				film.setLanguage(findFilmLanguage(results.getInt("id")));
				films.add(film);
			}
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return films;
	}

	private Film constructFilm(ResultSet results) {
		Film film = null;
		try {
			film = new Film(results.getInt("id"), results.getString("title"), results.getString("description"),
					results.getShort("release_year"), results.getInt("language_id"), results.getInt("rental_duration"),
					results.getDouble("rental_rate"), results.getInt("length"), results.getDouble("replacement_cost"),
					results.getString("rating"), results.getString("special_features"),
					findActorsByFilmId(results.getInt("id")));
			film.setLanguage(findFilmLanguage(results.getInt("id")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return film;
	}

	private String findFilmLanguage(int filmID) {
		String language = null;
		// select language.name from language join film on film.language_id =
		// language.id where film.id = 1;

		String sqlQuery = "SELECT language.name FROM language JOIN film ON film.language_id = language.id WHERE film.id = ?";
		PreparedStatement statement;
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			statement = conn.prepareStatement(sqlQuery);
			statement.setInt(1, filmID);
			ResultSet results = statement.executeQuery();
			if (results.next()) {
				language = results.getString("name");
			}
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return language;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actors = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			String sqlQuery = "SELECT * FROM actor JOIN film_actor ON actor.id = film_actor.actor_id "
					+ " WHERE film_actor.film_id = ?";
			PreparedStatement statement = conn.prepareStatement(sqlQuery);
			statement.setInt(1, filmId);
			ResultSet actorResult = statement.executeQuery();
			while (actorResult.next()) {
				Actor actor = new Actor();
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));
				actor.setFilms(findFilmsByActorId(actor.getId()));
				actors.add(actor);
			}
			actorResult.close();
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actors;
	}

	public Film createFilm(Film film) {

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "INSERT INTO film (title, language_id) " + " VALUES (?,?)";
			PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, film.getTitle());
			statement.setInt(2, 1); // Hard-coded language ID of 1 for English
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				ResultSet keys = statement.getGeneratedKeys();
				if (keys.next()) {
					int filmId = keys.getInt(1);
					film.setId(filmId);
				}
				keys.close();
			} else {
				film = null;
				conn.rollback();
				statement.close();
				conn.close();
				return film;
			}
			conn.commit(); // COMMIT TRANSACTION

			statement.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}

		return film;
	}

	public boolean deleteFilm(Film film) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false); // START TRANSACTION

			String sql = "DELETE FROM film WHERE id = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, film.getId());
			int updateCount = statement.executeUpdate();
			if (updateCount > 1) {
				conn.rollback();
				statement.close();
				conn.close();
				return false;
			}
			conn.commit(); // COMMIT TRANSACTION
			statement.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}

		return true;
	}

	public boolean updateFilm(Film film) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "UPDATE film SET title=?, description=?, release_year=?, language_id=?, rental_duration=?,"
					+ " rental_rate=?, length=?, replacement_cost=?, rating=?, special_features=? " + " WHERE id=?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, film.getTitle());
			statement.setString(2, film.getDescription());
			statement.setInt(3, film.getReleaseYear());
			statement.setInt(4, film.getLanguageID());
			statement.setInt(5, film.getRentalDuration());
			statement.setDouble(6, film.getRentalRate());
			statement.setInt(7, film.getLength());
			statement.setDouble(8, film.getReplacementCost());
			statement.setString(9, film.getRating());
			statement.setString(10, film.getSpecialFeatures());
			statement.setInt(11, film.getId());
			int updateCount = statement.executeUpdate();
			if (updateCount > 1) {
				conn.rollback();
				statement.close();
				conn.close();
				return false;
			} else {
				conn.commit(); // COMMIT TRANSACTION
			}
			statement.close();
			conn.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} // ROLLBACK TRANSACTION ON ERROR
				catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}

		return true;
	}

}
