package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Remark entity. @author MyEclipse Persistence Tools
 */

public class Remark implements java.io.Serializable {

	// Fields

	private Integer id;
	private Artic artic;
	private String username;
	private String text;
	private Timestamp time;
	private String mail;
	private String status;
	private Set replaies = new HashSet(0);

	// Constructors

	/** default constructor */
	public Remark() {
	}

	/** minimal constructor */
	public Remark(Artic artic) {
		this.artic = artic;
	}

	/** full constructor */
	public Remark(Artic artic, String username, String text, Timestamp time,
			String mail, String status, Set replaies) {
		this.artic = artic;
		this.username = username;
		this.text = text;
		this.time = time;
		this.mail = mail;
		this.status = status;
		this.replaies = replaies;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Artic getArtic() {
		return this.artic;
	}

	public void setArtic(Artic artic) {
		this.artic = artic;
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

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set getReplaies() {
		return this.replaies;
	}

	public void setReplaies(Set replaies) {
		this.replaies = replaies;
	}

}