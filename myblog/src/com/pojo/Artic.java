package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Artic entity. @author MyEclipse Persistence Tools
 */

public class Artic implements java.io.Serializable {

	// Fields

	private Integer id;
	private Tags tags;
	private Categories categories;
	private String title;
	private Timestamp createTime;
	private Timestamp updateTime;
	private String content;
	private Integer readcount;
	private String createYear;
	private String createMonth;
	private Set remarks = new HashSet(0);
	private String imgPath;
	// Constructors

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	/** default constructor */
	public Artic() {
	}

	/** minimal constructor */
	public Artic(String title) {
		this.title = title;
	}

	/** full constructor */
	public Artic(Tags tags, Categories categories, String title,
			Timestamp createTime, Timestamp updateTime, String content,
			Integer readcount, String createYear, String createMonth,
			Set remarks,String imgPath) {
		this.tags = tags;
		this.categories = categories;
		this.title = title;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.content = content;
		this.readcount = readcount;
		this.createYear = createYear;
		this.createMonth = createMonth;
		this.remarks = remarks;
		this.imgPath=imgPath;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Tags getTags() {
		return this.tags;
	}

	public void setTags(Tags tags) {
		this.tags = tags;
	}

	public Categories getCategories() {
		return this.categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getReadcount() {
		return this.readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}

	public String getCreateYear() {
		return this.createYear;
	}

	public void setCreateYear(String createYear) {
		this.createYear = createYear;
	}

	public String getCreateMonth() {
		return this.createMonth;
	}

	public void setCreateMonth(String createMonth) {
		this.createMonth = createMonth;
	}

	public Set getRemarks() {
		return this.remarks;
	}

	public void setRemarks(Set remarks) {
		this.remarks = remarks;
	}

}