package com.azienda.esercizioSpringUtenteLibro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.azienda.esercizioSpringUtenteLibro.model.Libro;

public interface LibroRepository extends JpaRepository<Libro, Integer> {

	public List<Libro> findByTitoloAndAutoreAndPrezzo(String titolo, String autore, Float prezzo);
	public List<Libro> findByAutore(String autore);
	@Query("SELECT l FROM Libro l WHERE l.titolo LIKE :titolo")
	public List<Libro> findByTitoloLike(@Param("titolo") String titolo);
	public List<Libro> findByAutoreAndTitolo(String autore, String titolo);
	@Query("SELECT l FROM Libro l WHERE " +
		       "(:titolo IS NULL OR LOWER(l.titolo) LIKE LOWER(CONCAT(:titolo, '%'))) AND " +
		       "(:autore IS NULL OR LOWER(l.autore) LIKE LOWER(CONCAT(:autore, '%'))) AND " +
		       "(:prezzo IS NULL OR l.prezzo <= :prezzo)")
		List<Libro> ricercaLibri(@Param("titolo") String titolo,
		                         @Param("autore") String autore,
		                         @Param("prezzo") Float prezzo);
	
}
