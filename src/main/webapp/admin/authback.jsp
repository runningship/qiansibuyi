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
		request.setAttribute("openid", data.getString("openid"));
		request.setAttribute("callbackUrl", request.getParameter("state"));
	}catch(Exception ex){
		System.out.println(result.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
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
setCookie("openid","${openid}",1);
window.location="${callbackUrl}";
</script>
</head>
<body>
</body>
</html>