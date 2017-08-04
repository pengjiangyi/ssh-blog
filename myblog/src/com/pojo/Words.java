package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Words entity. @author MyEclipse Persistence Tools
 */

public class Words implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String text;
	private String mail;
	private Timestamp time;
	private String status;
	private Set wordsReplaies = new HashSet(0);

	// Constructors

	/** default constructor */
	public Words() {
	}

	/** full constructor */
	public Words(String username, String text, String mail, Timestamp time,
			String status, Set wordsReplaies) {
		this.username = username;
		this.text = text;
		this.mail = mail;
		this.time = time;
		this.status = status;
		this.wordsReplaies = wordsReplaies;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set getWordsReplaies() {
		return this.wordsReplaies;
	}

	public void setWordsReplaies(Set wordsReplaies) {
		this.wordsReplaies = wordsReplaies;
	}

}