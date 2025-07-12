package com.azienda.esercizioSpringUtenteLibro.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Libro {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;
private String autore;
private String titolo;
private Float prezzo;
public Libro() {
	super();
}
public Libro(String autore, String titolo, Float prezzo) {
	super();
	this.autore = autore;
	this.titolo = titolo;
	this.prezzo = prezzo;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getAutore() {
	return autore;
}
public void setAutore(String autore) {
	this.autore = autore;
}
public String getTitolo() {
	return titolo;
}
public void setTitolo(String titolo) {
	this.titolo = titolo;
}
public Float getPrezzo() {
	return prezzo;
}
public void setPrezzo(Float prezzo) {
	this.prezzo = prezzo;
}
@Override
public String toString() {
	return "Libro [id=" + id + ", autore=" + autore + ", titolo=" + titolo + ", prezzo=" + prezzo + "]";
}

}