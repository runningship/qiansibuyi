<%@page import="com.bc.qsby.util.QRCodeUtil"%>
<%@page import="com.bc.qsby.cache.ConfigCache"%>
<%@page import="com.bc.qsby.entity.ProductItem"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.google.zxing.EncodeHintType"%>
<%@page import="org.bc.sdak.SimpDaoTool"%>
<%@page import="org.bc.sdak.CommonDaoService"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="net.glxn.qrgen.core.image.ImageType"%>
<%@page import="net.glxn.qrgen.javase.QRCode"%>
<%@page import="javax.imageio.ImageIO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
CommonDaoService dao = SimpDaoTool.getGlobalCommonDaoService();
ProductItem item = dao.get(ProductItem.class, Integer.valueOf(id));
request.setAttribute("pi" , item);
String code = ""+item.id;
//String url = "http://192.168.1.222:7080/public/itemView.jsp?qrCode="+ item.qrCode;
//String url = "http://kcloud.iflytek.com/p/v/"+item.qrCode; 
String url = "http://192.168.1.222:7080/p/"+code; 

//File stream = QRCode.from(url).to(ImageType.PNG).withSize(250, 250).file();
//BufferedImage bufImg = ImageIO.read(stream);
//response.setContentType("image/PNG");
response.setContentType("text/html");
//OutputStream os = response.getOutputStream();
//ImageIO.write(bufImg, "jpg", os);
String realLogoPath = request.getServletContext().getRealPath("images/logo.png");
String qrCodeDir = ConfigCache.get("qrcode_image_path", "C:\\inetpub\\wwwroot\\qrcode_image_path");
String destPath = qrCodeDir+"\\"+item.productId+"\\"+code+".png";
QRCodeUtil.encode(url, realLogoPath , destPath , true);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生成二维码</title>
</head>
<body>

<img src="http://127.0.0.1/qrcode_image_path/${pi.productId}/${pi.id}.png"/ style="margin-top:20px;margin-left:20px;">
</body>
</html>