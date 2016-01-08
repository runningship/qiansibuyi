<%@page import="com.bc.qsby.youzan.GlobalConfig"%>
<%@page import="com.bc.qsby.youzan.KdtApiClient"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="com.bc.qsby.entity.Product"%>
<%@page import="com.bc.qsby.entity.ProductItem"%>
<%@page import="org.bc.sdak.TransactionalServiceHelper"%>
<%@page import="org.bc.sdak.CommonDaoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Integer id = Integer.valueOf(request.getParameter("state"));
	//request.setAttribute("code", request.getParameter("code"));
	HttpClient client = new DefaultHttpClient();
	HttpGet req= new HttpGet("https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx955465193fd083ef&secret=7896b261071d9cca3f6b151ed3949a95&code="+request.getParameter("code")+"&grant_type=authorization_code");
	HttpResponse res = client.execute(req);
	BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(res.getEntity().getContent()));
	StringBuffer result = new StringBuffer();
	String line = "";
	while ((line = bufferedReader.readLine()) != null) {
		result.append(line);
	}
	try{
		JSONObject data = JSONObject.fromObject(result.toString());
		CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
		ProductItem item = dao.get(ProductItem.class, id);
		Product product = dao.get(Product.class, item.productId);
		request.setAttribute("product", product);
		request.setAttribute("item", item);
		
	}catch(Exception ex){
		System.out.println(result.toString());
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
    <title>【丫哒】冬装新款短款轻薄羽绒服yd8730    - 千丝布艺</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<style type="text/css">
		html,body{height:100%;margin: 0px;overflow-x: scroll;overflow:hidden;}
		iframe{width:100%;height:100%;border:none;}
		.info{background: #EFEDF5;    color: #122054;    font-weight: bold;padding-left: 3pt;font-family: cursive;}
		.info_detail{color: #504B4B;    font-size: 11pt;padding-left: 3pt;font-family: cursive;}
		.info_detail .item{    height: 17pt;    line-height: 20pt;}
	</style>
<script type="text/javascript">
	//window.location="${product.youzanLink }";
</script>
</head>
<body>
<div class="info">我的信息</div>
	<div class="info_detail">
		<div class="item">微信号: <span>runningship</span></div>
	</div>
<div></div>
<div class="info">产品信息</div>
<div class="info_detail">
	<a href="${product.youzanLink }">${product.name }</a>
	<div class="item">颜色: <span>橘红</span></div>
	<div class="item">尺码: <span>160</span></div>
	<div class="item">购买时间: <span>2015-12-29 15:23:45</span></div>
	<div class="item">购买价格: <span>99元</span></div>
	
</div>
</body>
</html>