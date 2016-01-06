<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="../../js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">

$(function(){
});

function save(){
    var a=$('form[name=form1]').serialize();
    YW.ajax({
        type: 'POST',
        url: '${projectName}/c/admin/product/update',
        data:a,
        mysuccess: function(data){
            infoAlert('修改成功');
        }
    });
}

</script>
</head>
<body>
<style type="text/css">
textarea,input{width:90%;}

</style>
<form name="form1" method="post" class="definewidth m20">
	<input type="hidden" name="id"  value="${product.id}"/>
	<table class="table table-bordered table-hover m10">
	
	    <tr>
	        <td class="tableleft"></td>
	        <td>
	            <button class="btn btn-primary" type="button" onclick="save();return false;">保存</button>
	            <button class="btn btn-primary" type="button" onclick="window.location='list.jsp'">返回</button>
	        </td>
	    </tr>
	</table>
</form>
</body>
</html>