package com.azienda.esercizioSpringUtenteLibro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.azienda.esercizioSpringUtenteLibro.exception.LibroEsistenteException;
import com.azienda.esercizioSpringUtenteLibro.model.Libro;
import com.azienda.esercizioSpringUtenteLibro.model.Utente;
import com.azienda.esercizioSpringUtenteLibro.service.LibroService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LibroController {
	 @Autowired
	    private LibroService libroService;

	    // Mostra form creazione libro
	    @GetMapping("/creaLibro")
	    public String mostraCreaLibro(HttpSession session) {
	        if (session.getAttribute("utente") == null) {
	            return "redirect:/login";
	        }
	        return "creaLibro";
	    }

	    // Gestione creazione libro
	    @PostMapping("/creaLibro")
	    public String creaLibro(Libro libro, Model model, HttpSession session) {
	        if (session.getAttribute("utente") == null) {
	            return "redirect:/login";
	        }

	        try {
	            libroService.createLibro(libro.getTitolo(), libro.getAutore(), libro.getPrezzo());
	            model.addAttribute("messaggio", "Libro creato con successo.");
	        } catch (LibroEsistenteException e) {
	            model.addAttribute("errore", e.getMessage());
	        } catch (Exception e) {
	            model.addAttribute("errore", "Errore durante la creazione del libro: " + e.getMessage());
	        }

	        return "esito";
	    }

	    // Visualizzazione libri con filtro opzionale per titolo
	    @GetMapping("/visualizzaLibri")
	    public String visualizzaLibri(String titolo, String autore, Float prezzo, Model model, HttpSession session) {
	        try {
				if (session.getAttribute("utente") == null) {
				    return "redirect:/login";
				}
				List<Libro> libri = libroService.getAllLibri(autore, titolo, prezzo);
				model.addAttribute("libri", libri);
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return "visualizzaLibri"; // JSP/HTML da creare
	    }
	    
	    
	    @GetMapping("/ricercaLibri")
	    public String mostraRicercaLibri(HttpSession session) {
	        // Controllo login
	        if (session.getAttribute("utente") == null) {
	            return "redirect:/login";
	        }

	        // Puoi anche controllare se è un utente admin con un ruolo, se previsto
	        return "ricercaLibri"; // Questo corrisponde al file ricercaLibri.jsp
	    }
	    
	    @PostMapping("/ricercaLibri")
	    public String ricercaLibri(
	            @RequestParam(required = false) String titolo,
	            @RequestParam(required = false) String autore,
	            @RequestParam(required = false) String prezzoStr, // ricevi come stringa
	            Model model,
	            HttpSession session) {

	        if (session.getAttribute("utente") == null) {
	            return "redirect:/login";
	        }

	        Float prezzo = null;
	        try {
	            if (prezzoStr != null && !prezzoStr.trim().isEmpty()) {
	                prezzo = Float.parseFloat(prezzoStr.trim());
	            }
	        } catch (NumberFormatException e) {
	            model.addAttribute("errore", "Prezzo non valido.");
	            return "ricercaLibri";
	        }

	        try {
	            List<Libro> libri = libroService.ricercaLibri(titolo, autore, prezzo);
	            if (libri.isEmpty()) {
	                model.addAttribute("messaggio", "Nessun libro trovato.");
	            } else {
	                model.addAttribute("libri", libri);
	            }
	        } catch (Exception e) {
	            model.addAttribute("errore", "Errore nella ricerca: " + e.getMessage());
	        }

	        return "visualizzaLibri";
	    }
	    @PostMapping("/eliminaLibro")
	    public String eliminaLibro(@RequestParam("id") Integer id, Model model, HttpSession session) {
	        // Controllo sessione utente loggato e ruolo se vuoi limitare a admin
	        Utente utente = (Utente) session.getAttribute("utente");
	        if (utente == null || !utente.getRuolo().getNome().equalsIgnoreCase("r_admin")) {
	            return "redirect:/login"; // o altra pagina autorizzazione
	        }
	        
	        try {
	            libroService.eliminaLibro(id);
	            model.addAttribute("messaggio", "Libro eliminato con successo.");
	        } catch (Exception e) {
	            model.addAttribute("errore", "Errore durante l'eliminazione: " + e.getMessage());
	        }
	        // Ricarica lista libri dopo eliminazione
	        List<Libro> libri = libroService.getAllLibri(null, null, null);
	        model.addAttribute("libri", libri);
	        return "visualizzaLibri"; // il nome della jsp senza estensione
	    }
	    
	    @GetMapping("/modificaLibro")
	    public String mostraFormModificaLibro(@RequestParam("id") Integer id, Model model, HttpSession session) {
	        if (session.getAttribute("utente") == null) {
	            return "redirect:/login";
	        }

	        Libro libro = libroService.getLibroById(id);
	        if (libro == null) {
	            model.addAttribute("errore", "Libro non trovato.");
	            return "visualizzaLibri";
	        }

	        model.addAttribute("libro", libro);
	        return "modificaLibro"; // Corrispondente a modificaLibro.jsp/html
	    }
	    
	    @PostMapping("/modificaLibro")
	    public String aggiornaLibro(Libro libro, Model model, HttpSession session) {
	        Utente utente = (Utente) session.getAttribute("utente");
	        if (utente == null || !utente.getRuolo().getNome().equalsIgnoreCase("r_admin")) {
	            return "redirect:/login";
	        }

	        try {
	            libroService.aggiornaLibro(libro);
	            model.addAttribute("messaggio", "Libro aggiornato con successo.");
	        } catch (Exception e) {
	            model.addAttribute("errore", "Errore durante l'aggiornamento: " + e.getMessage());
	        }

	        List<Libro> libri = libroService.getAllLibri(null, null, null);
	        model.addAttribute("libri", libri);
	        return "visualizzaLibri";
	    }
}


