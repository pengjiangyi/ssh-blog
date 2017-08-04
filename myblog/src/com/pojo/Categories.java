package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Categories entity. @author MyEclipse Persistence Tools
 */

public class Categories implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Set artics = new HashSet(0);

	// Constructors

	/** default constructor */
	public Categories() {
	}

	/** minimal constructor */
	public Categories(String name) {
		this.name = name;
	}

	/** full constructor */
	public Categories(String name, Set artics) {
		this.name = name;
		this.artics = artics;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getArtics() {
		return this.artics;
	}

	public void setArtics(Set artics) {
		this.artics = artics;
	}

}