package com.azienda.esercizioSpringUtenteLibro.model;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Utente {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;
private String username;
private String password;
@ManyToOne
@JoinColumn(name = "ruolo_id")
private Ruolo ruolo;
public Utente() {
	super();
}
public Utente(String username, String password, Ruolo ruolo) {
	super();
	this.username = username;
	this.password = password;
	this.ruolo = ruolo;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Ruolo getRuolo() {
	return ruolo;
}
public void setRuolo(Ruolo ruolo) {
	this.ruolo = ruolo;
}
@Override
public String toString() {
	return "Utente [id=" + id + ", username=" + username + ", password=" + password + "]";
}
@Override
public int hashCode() {
	return Objects.hash(id, password, ruolo, username);
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Utente other = (Utente) obj;
	return Objects.equals(id, other.id) && Objects.equals(password, other.password)
			&& Objects.equals(ruolo, other.ruolo) && Objects.equals(username, other.username);
}

}
