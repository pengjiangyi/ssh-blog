package com.pojo;

import java.sql.Timestamp;

/**
 * WordsReplay entity. @author MyEclipse Persistence Tools
 */

public class WordsReplay implements java.io.Serializable {

	// Fields

	private Integer id;
	private Words words;
	private String username;
	private String text;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public WordsReplay() {
	}

	/** full constructor */
	public WordsReplay(Words words, String username, String text, Timestamp time) {
		this.words = words;
		this.username = username;
		this.text = text;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Words getWords() {
		return this.words;
	}

	public void setWords(Words words) {
		this.words = words;
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

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}