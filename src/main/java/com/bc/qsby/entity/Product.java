package com.bc.qsby.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public String name;
	
	public String manufacturer;
	
	public String chengfen;
	
	public float buyingPrice;
	
	public float salePrice;
	
	public String youzanLink;
	
	public Date addtime;
}
