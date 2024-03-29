package com.skilldistillery.film.data;

import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface DatabaseAccessor {
	public Film findFilmById(int filmId);

	public List<Actor> findActorsByFilmId(int filmId);

	List<Film> findFilmsByActorId(int actorId);

	List<Film> findFilmsByKeyword(String keyword);
	
	public Film createFilm(Film film);
	
	public boolean deleteFilm(Film film);
	
	public boolean updateFilm(Film film);
}
