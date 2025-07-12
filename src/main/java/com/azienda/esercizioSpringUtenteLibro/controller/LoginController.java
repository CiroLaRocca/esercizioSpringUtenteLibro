package com.azienda.esercizioSpringUtenteLibro.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.azienda.esercizioSpringUtenteLibro.costanti.Costanti;
import com.azienda.esercizioSpringUtenteLibro.exception.UtenteNonTrovato;
import com.azienda.esercizioSpringUtenteLibro.model.Ruolo;
import com.azienda.esercizioSpringUtenteLibro.model.Utente;
import com.azienda.esercizioSpringUtenteLibro.repository.RuoloRepository;
import com.azienda.esercizioSpringUtenteLibro.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private RuoloRepository ruoloRepository;

	// Pagina iniziale
	@GetMapping("/index")
	public String mostraIndex() {
		return "index";
	}

	// Pagina menu in base al ruolo
	@GetMapping("/menu")
	public String mostraMenu(HttpSession session, Model model) {
		Utente utente = (Utente) session.getAttribute("utente");

		if (utente == null) {
			return "redirect:/login";
		}

		String ruolo = utente.getRuolo().getNome();
		System.out.println("Ruolo dell'utente: " + ruolo);

		model.addAttribute("ruolo", ruolo);

		if ("admin".equalsIgnoreCase(ruolo)) {
			return "menuAdmin";
		} else {
			return "menuUtente";
		}
	}

	// Pagina login
	@GetMapping("/login")
	public String mostraLogin() {
		return "paginaLogin";
	}

	// Gestione login
	@PostMapping("/login")
	public String login(@RequestParam String username,
			@RequestParam String password,
			HttpSession session,
			Model model) {

		try {
			Utente utente = userService.login(username, password);
			System.out.println("Utente loggato: " + utente.getUsername());
			System.out.println("Ruolo utente: " + (utente.getRuolo() != null ? utente.getRuolo().getNome() : "ruolo null"));

			session.setAttribute("utente", utente);

			String ruolo = utente.getRuolo().getNome();
			if ("r_admin".equalsIgnoreCase(ruolo)) {
			    return "menuAdmin";
			} else {
			    return "menuUtente";
			}
			

		} catch (UtenteNonTrovato e) {
			model.addAttribute("errore", e.getMessage());
			return "paginaLogin";
		}
	}
		// Logout
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/index";
		}

		// Pagina registrazione
		@GetMapping("/registrazione")
		public String mostraRegistrazione(Model model) {
			model.addAttribute("utente", new Utente()); // Necessario per il form con th:object
			return "paginaRegistrazione";
		}

		// Gestione registrazione
		@PostMapping("/registrazione")
		public String registra(@ModelAttribute Utente utente, Model model) {
			try {
				if (userService.trovaPerUsername(utente.getUsername()).isPresent()) {
					model.addAttribute("errore", "Username già esistente.");
					return "paginaRegistrazione";
				}

				// Imposta ruolo "user"
				Ruolo ruolo = ruoloRepository.findByNome("user");
				if (ruolo == null) {
					ruolo = new Ruolo();
					ruolo.setNome("user");
					ruolo = ruoloRepository.save(ruolo);
				}

				utente.setRuolo(ruolo);

				userService.save(utente); // metodo che salva l’utente
				model.addAttribute("messaggio", "Registrazione avvenuta con successo.");
				return "paginaLogin";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		@GetMapping("/menuAdmin")
		public String menuAdmin(HttpSession session) {
		    Utente utente = (Utente) session.getAttribute("utente");
		    if (utente == null || !utente.getRuolo().getNome().equalsIgnoreCase("admin")) {
		        return "menuAdmin";
		    }
		    return "menuAdmin";
		}

		@GetMapping("/menuUtente")
		public String menuUtente(HttpSession session) {
		    Utente utente = (Utente) session.getAttribute("utente");
		    if (utente == null) {
		        return "redirect:/login";
		    }
		    return "menuUtente";
		}
		@GetMapping("/paginaLogin")
		public String paginaLogin() {
			return "paginaLogin"; // JSP/HTML da creare
		}
		@GetMapping("/paginaRegistrazione")
		public String paginaRegistrazione() {
			return "paginaRegistrazione"; // JSP/HTML da creare
		}
		
		}