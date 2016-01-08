package com.bc.qsby.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProductItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public Integer productId;
	
	public String productName;
	
	public String color;
	
	public String size;
	
	//weixin openid
	public String buyerId;
	
	public float dealPrice;
	
	public Date buyTime;
	
	//支付方式
	public String zhifu;
	
	//推荐人ID
	public Integer referId;
}
