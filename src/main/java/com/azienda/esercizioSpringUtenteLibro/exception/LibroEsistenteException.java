package com.azienda.esercizioSpringUtenteLibro.exception;

public class LibroEsistenteException extends Exception {
	
    public LibroEsistenteException(String message) {
        super(message);
    }

   
    public LibroEsistenteException(String message, Throwable cause) {
        super(message, cause);
    }
}

