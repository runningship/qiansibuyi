<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="com.bc.qsby.youzan.GlobalConfig"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="com.bc.qsby.youzan.KdtApiClient"%>
<%@page import="com.bc.qsby.entity.Product"%>
<%@page import="com.bc.qsby.entity.ProductItem"%>
<%@page import="org.bc.sdak.TransactionalServiceHelper"%>
<%@page import="org.bc.sdak.CommonDaoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		System.out.println(cookie.getPath()+"/"+cookie.getName()+"="+cookie.getValue());	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="cleartype" content="on">
<meta name="referrer" content="always">
<title>个人信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<style type="text/css">
html,body {
	height: 100%;
	margin: 0px;
	overflow-x: scroll;
	overflow: hidden;
}

iframe {
	width: 100%;
	height: 100%;
	border: none;
}

.info {
	background: #EFEDF5;
	color: #122054;
	font-weight: bold;
	padding-left: 3pt;
	font-family: cursive;
}

.info_detail {
	color: #504B4B;
	font-size: 11pt;
	padding-left: 3pt;
	font-family: cursive;
}

.info_detail .item {
	height: 17pt;
	line-height: 20pt;
}
</style>
<script type="text/javascript" src="${projectName }/admin/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function setCookie(c_name, value, expiredays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + expiredays);
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ((expiredays == null) ? "" : ";expires="
						+ exdate.toGMTString());
	}

	//取回cookie
	function getCookie(c_name) {
		if (document.cookie.length > 0) {
			c_start = document.cookie.indexOf(c_name + "=");
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1;
				c_end = document.cookie.indexOf(";", c_start);
				if (c_end == -1)
					c_end = document.cookie.length;
				return unescape(document.cookie.substring(c_start, c_end));
			}
		}
		return ""
	}
	
	function clearCookie(){
		setCookie('openid','',0);
		alert('缓存已清空');
	}
$(function(){
	var openid = getCookie('openid');
	if(!openid){
		//setCookie('openid','123',1);
		window.location="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx955465193fd083ef&redirect_uri=http://wx.zjb.com.tunnel.qydev.com/qsby/admin/authback.jsp&response_type=code&scope=snsapi_base&state=client/info.jsp#wechat_redirect";
	}else{
		alert(openid);
	}
});
</script>
</head>
<body>
	<div class="info">身份</div>
	<div class="info_detail">
		<div class="item">
			姓名: <span>橘红</span>
		</div>
		<div class="item">
			邮箱: <span>160</span>
		</div>
		<div class="item">
			生日: <span>2015-12-29 15:23:45</span>
		</div>
		<div class="item">
			说明: <span>99元</span>
		</div>
		<div class="item">
			电话: <span>99元</span>
		</div>
	</div>
	<div class="info">身材</div>
	<div class="info_detail">
		<div class="item">
			身高: <span>橘红</span>
		</div>
		<div class="item">
			体重: <span>160</span>
		</div>
		<div class="item">
			腿长: <span>2015-12-29 15:23:45</span>
		</div>
		<div class="item">
			臂长: <span>99元</span>
		</div>
		<div class="item">
			腰围: <span>99元</span>
		</div>
		<div class="item">
			肩宽: <span>99元</span>
		</div>
		<div class="item">
			臀围: <span>99元</span>
		</div>
	</div>
	
	<div onclick="clearCookie();">清空缓存</div>
</body>
</html>