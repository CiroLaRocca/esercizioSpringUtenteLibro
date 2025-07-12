package com.azienda.esercizioSpringUtenteLibro.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Ruolo {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;
private String nome;
@OneToMany(mappedBy = "ruolo")
private List<Utente> utenti;
public Ruolo() {
	super();
}
public Ruolo(String nome, List<Utente> utenti) {
	super();
	this.nome = nome;
	this.utenti = utenti;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public List<Utente> getUtenti() {
	return utenti;
}
public void setUtenti(List<Utente> utenti) {
	this.utenti = utenti;
}
@Override
public String toString() {
	return "Ruolo [id=" + id + ", nome=" + nome + ", utenti=" + utenti + "]";
}
@Override
public int hashCode() {
	return Objects.hash(id, nome, utenti);
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Ruolo other = (Ruolo) obj;
	return Objects.equals(id, other.id) && Objects.equals(nome, other.nome) && Objects.equals(utenti, other.utenti);
}

}
