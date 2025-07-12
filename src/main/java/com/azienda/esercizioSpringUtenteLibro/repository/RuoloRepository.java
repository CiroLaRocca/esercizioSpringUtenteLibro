package com.azienda.esercizioSpringUtenteLibro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.azienda.esercizioSpringUtenteLibro.model.Ruolo;

public interface RuoloRepository extends JpaRepository<Ruolo, Integer> {

	public Ruolo findByNome(String nome);
	
}
  	