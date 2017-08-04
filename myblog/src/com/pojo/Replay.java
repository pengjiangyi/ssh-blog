package com.pojo;

import java.sql.Timestamp;

/**
 * Replay entity. @author MyEclipse Persistence Tools
 */

public class Replay implements java.io.Serializable {

	// Fields

	private Integer id;
	private Remark remark;
	private Integer username;
	private String text;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public Replay() {
	}

	/** minimal constructor */
	public Replay(Integer username) {
		this.username = username;
	}

	/** full constructor */
	public Replay(Remark remark, Integer username, String text, Timestamp time) {
		this.remark = remark;
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

	public Remark getRemark() {
		return this.remark;
	}

	public void setRemark(Remark remark) {
		this.remark = remark;
	}

	public Integer getUsername() {
		return this.username;
	}

	public void setUsername(Integer username) {
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