package com.bc.qsby.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Client {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public String name;
	
	//可能是微信号
	public String account;
	
	public String pwd;
	
	public String tel;
	
	public Date addtime;
	
	public Date lasttime;
	
	public String email;
	
	public Date birth;
	
	public int jifen;
}
