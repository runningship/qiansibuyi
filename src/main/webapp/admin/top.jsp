<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bc.qsby.entity.User" %>

<div class="warp top">
     
     <div class="main">
     	<%
			User user = (User)request.getSession().getAttribute("user");
	     	if(user!=null){
	     		request.setAttribute("me" , user);
	     	}
     	%>
     </div>

</div>
