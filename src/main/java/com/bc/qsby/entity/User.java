package com.bc.qsby.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="uc_user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public String name;
	
	public String account;
	
	public String pwd;
	
	public String tel;
	
	public Date addtime;
	
	public Date lasttime;
	
	public String role;
	
	public String email;
	
	//是否通过审核
	public int valid;
	
}
