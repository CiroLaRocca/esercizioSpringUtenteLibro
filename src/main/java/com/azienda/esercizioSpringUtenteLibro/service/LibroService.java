package com.azienda.esercizioSpringUtenteLibro.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.azienda.esercizioSpringUtenteLibro.exception.LibroEsistenteException;
import com.azienda.esercizioSpringUtenteLibro.model.Libro;
import com.azienda.esercizioSpringUtenteLibro.repository.LibroRepository;

@Service
@Transactional
public class LibroService {
@Autowired
private LibroRepository libroRepository;

public List<Libro> getAllLibri(String autore, String titolo, Float prezzo) {
	List<Libro> result = new ArrayList<Libro>();
	result = libroRepository.findAll();	
	return result;
}


public Libro createLibro(String titolo, String autore, Float prezzo) throws LibroEsistenteException {
	if (titolo == null || autore == null || prezzo == null) {
        throw new IllegalArgumentException("Titolo, autore e prezzo non possono essere null");
    }

    List<Libro> esistente = libroRepository.findByTitoloAndAutoreAndPrezzo(titolo, autore, prezzo);
    if (esistente != null && !esistente.isEmpty()) {
        throw new LibroEsistenteException("Il libro \"" + titolo + "\" di " + autore + " al prezzo di " + prezzo + "€ esiste già.");
    }

    Libro libro = new Libro(titolo, autore, prezzo);
    return libroRepository.save(libro);
}

public List<Libro> findByTitoloLike(String titolo) {
    return libroRepository.findByTitoloLike("%" + titolo + "%");
}

public void eliminaLibro(Integer id) {
	libroRepository.deleteById(id);
}
public void aggiornaLibro(Libro libro) throws Exception {
    Libro esistente = libroRepository.findById(libro.getId())
        .orElseThrow(() -> new Exception("Libro non trovato"));
    
    esistente.setTitolo(libro.getTitolo());
    esistente.setAutore(libro.getAutore());
    esistente.setPrezzo(libro.getPrezzo());

    libroRepository.save(esistente);
}


public Libro getLibroById(Integer id) {
    Optional<Libro> libro = libroRepository.findById(id);
    return libro.orElse(null); 
}
public List<Libro> ricercaLibri(String titolo, String autore, Float prezzo) {
    if (titolo != null && titolo.trim().isEmpty()) titolo = null;
    if (autore != null && autore.trim().isEmpty()) autore = null;
    return libroRepository.ricercaLibri(titolo, autore, prezzo);
}

}
