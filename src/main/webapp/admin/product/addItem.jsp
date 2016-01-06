<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
$(function(){
});


function save(){
    var a=$('form[name=form1]').serialize();
    YW.ajax({
        type: 'POST',
        url: '${projectName}/c/admin/product/doSaveItem',
        data:a,
        mysuccess: function(data){
            infoAlert('添加成功');
        }
    });
}

</script>
<style type="text/css">
input[type="text"]{width:90%;height: 36px;}
</style>
</head>
<body>

<form name="form1" method="post" class="definewidth m20">
<table class="table table-bordered table-hover m10">
    <tr>
        <td class="tableleft">颜色</td>
        <td style=""><input type="text" name="color" not-null="true"/></td>
    </tr>
    <tr>
    	<td class="tableleft">尺码</td>
        <td style=""><input type="text" name="size"/></td>
    </tr>
    <tr>
    	<td class="tableleft">数量</td>
        <td style=""><input type="text" name="count" not-null="true" /></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td colspan="5">
            <button class="btn btn-primary" type="button" onclick="save();return false;">保存</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>