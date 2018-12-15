package com.blue.configuration;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encryptor {
	
	
	public String encrypt(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] cipher = md.digest();
		return  Base64.getEncoder().encodeToString(cipher);
	}
}
