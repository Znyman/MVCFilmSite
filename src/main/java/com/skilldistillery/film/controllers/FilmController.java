package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.data.FilmDAOImpl;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
	
	@Autowired
	FilmDAOImpl filmDAO;
	
	@RequestMapping("")
	public String home() {
		return "home";
	}
	
	@RequestMapping(path = "GetFilmId.do", params = "filmId", method = RequestMethod.GET)
	public ModelAndView getFilmById(@RequestParam("filmId") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDAO.findFilmById(filmId);
		mv.addObject("film", film);
		mv.setViewName("filmData");
		return mv;
	}
	
	@RequestMapping(path = "NewFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilmToDAO(Film film, RedirectAttributes redirect) {
		ModelAndView mv = new ModelAndView();
		filmDAO.createFilm(film);
		redirect.addFlashAttribute("film", film);
		mv.setViewName("redirect:filmAdded.do");
		return mv;
	}
	
	@RequestMapping(path = "filmAdded.do", method = RequestMethod.GET)
	public ModelAndView filmCreated(Film film) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("filmData");
		return mv;
	}

}
