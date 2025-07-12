package com.azienda.esercizioSpringUtenteLibro.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.azienda.esercizioSpringUtenteLibro.costanti.Costanti;
import com.azienda.esercizioSpringUtenteLibro.exception.RuoloGiaEsistenteException;
import com.azienda.esercizioSpringUtenteLibro.exception.RuoloNonEsistenteException;
import com.azienda.esercizioSpringUtenteLibro.exception.UtenteGiaEsistenteException;
import com.azienda.esercizioSpringUtenteLibro.exception.UtenteNonTrovato;
import com.azienda.esercizioSpringUtenteLibro.model.Ruolo;
import com.azienda.esercizioSpringUtenteLibro.model.Utente;
import com.azienda.esercizioSpringUtenteLibro.repository.RuoloRepository;
import com.azienda.esercizioSpringUtenteLibro.repository.UtenteRepository;
@Service
@Transactional
public class UserService {
	@Autowired
	private UtenteRepository utenteRepository;
	@Autowired
	private RuoloRepository ruoloRepository;
	
	private Ruolo createRuolo(String nome) throws RuoloGiaEsistenteException {
		Ruolo r = ruoloRepository.findByNome(nome);
		if (r != null) {
			throw new RuoloGiaEsistenteException("Il ruolo " + nome + " già esiste");
		}
		Ruolo ruolo = new Ruolo(nome, null);
		return ruoloRepository.save(ruolo);
	}

	private Ruolo createRuoloAdmin() throws RuoloGiaEsistenteException {
		return createRuolo(Costanti.RUOLO_ADMIN);
	}

	private Ruolo createRuoloUser() throws RuoloGiaEsistenteException {
		return createRuolo(Costanti.RUOLO_USER);
	}


	public Utente createUtente(String username, String password, String nomeRuolo)
	        throws UtenteGiaEsistenteException, RuoloNonEsistenteException {
	    
	    Optional<Utente> esistente = utenteRepository.findByUsername(username);
	    if (esistente.isPresent()) {
	        throw new UtenteGiaEsistenteException("L'utente " + username + " già esiste");
	    }

	    Ruolo ruolo = ruoloRepository.findByNome(nomeRuolo);
	    if (ruolo == null) {
	        throw new RuoloNonEsistenteException("Il ruolo " + nomeRuolo + " non esiste");
	    }

	    Utente nuovo = new Utente(username, password, ruolo);
	    return utenteRepository.save(nuovo);
	}
	public Utente createUtenteAdmin(String username, String password)
			throws UtenteGiaEsistenteException, RuoloNonEsistenteException {
		return createUtente(username, password, Costanti.RUOLO_ADMIN);
	}

	public Utente createUtenteUser(String username, String password)
			throws UtenteGiaEsistenteException, RuoloNonEsistenteException {
		return createUtente(username, password, Costanti.RUOLO_USER);
	}
	public Utente login(String username, String password) throws UtenteNonTrovato {
	    Optional<Utente> utenteOpt = trovaPerUsername(username);

	    if (!utenteOpt.isPresent()) {
	        throw new UtenteNonTrovato("Utente non trovato.");
	    }

	    Utente utente = utenteOpt.get();

	    if (!utente.getPassword().equals(password)) {
	        throw new UtenteNonTrovato("Password errata.");
	    }

	    return utente;
	}
	public void init() {
		try {
			Ruolo ruoloAdmin = ruoloRepository.findByNome(Costanti.RUOLO_ADMIN);
			if ( ruoloAdmin == null) {
				ruoloAdmin = createRuoloAdmin();
			}
			Ruolo ruoloUser = ruoloRepository.findByNome(Costanti.RUOLO_USER);
			if ( ruoloUser == null) {
				ruoloUser = createRuoloUser();
			}
			try {
				createUtenteAdmin("admin","admin");
			} catch (Exception e) {
				e.printStackTrace();
			}
			createUtenteUser("user", "user");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Optional<Utente> trovaPerUsername(String username) {
		return utenteRepository.findByUsername(username);
	}
	public Utente save(Utente utente) {
        return utenteRepository.save(utente);
    }
}