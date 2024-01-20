package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.film.data.FilmDAOImpl;

@Controller
public class FilmController {
	
	@Autowired
	FilmDAOImpl filmDAO;
	
	@RequestMapping("")
	public String home() {
		return "WEB-INF/views/home.jsp";
	}

}
