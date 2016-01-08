<%@page import="com.bc.qsby.entity.Product"%>
<%@page import="com.bc.qsby.entity.ProductItem"%>
<%@page import="org.bc.sdak.TransactionalServiceHelper"%>
<%@page import="org.bc.sdak.CommonDaoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	Integer id = Integer.valueOf(request.getParameter("id"));
	request.setAttribute("auth", "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx955465193fd083ef&redirect_uri=http://wx.zjb.com.tunnel.qydev.com/qsby/admin/product/code.jsp&response_type=code&scope=snsapi_base&state="+id+"#wechat_redirect");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	window.location="${auth}";
</script>
</head>
</html>