package com.bc.qsby.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ScanRecord {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	//微信openid
	public String buyerId;
	
	public Integer productId;
	
	//ProductItem Id
	public Integer piid;
	
	//返利
	public Integer reward;
	
	public Date rewardTime;
}
