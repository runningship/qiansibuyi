<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        url: '${projectName}/c/admin/product/doSave',
        data:a,
        mysuccess: function(data){
            infoAlert('添加成功');
        }
    });
}

</script>
</head>
<body>
<style type="text/css">
#city_1 select{height:25px;width:120px;margin-top: 5px;margin-bottom: 5px;}
input{width:90%;}
</style>
<form name="form1" method="post" class="definewidth m20">
<table class="table table-bordered table-hover m10">
    <tr>
        <td class="tableleft">商品名称</td>
        <td style="width:26%"><input type="text" name="name" not-null="true"/></td>
        <td class="tableleft">售价</td>
        <td style="width:26%"><input type="text" name="salePrice"/>元</td>
        <td class="tableleft">进价</td>
        <td style="width:26%"><input type="text" name="buyingPrice" not-null="true" />元</td>
    </tr>
    <tr>
    	<td class="tableleft">生产商</td>
        <td style="width:26%"><input type="text" name="manufacturer" not-null="true"/></td>
        <td class="tableleft">成分组成</td>
        <td style="width:26%"><input type="text" name="chengfen" not-null="true"/></td>
        <td class="tableleft">有赞链接</td>
        <td><textarea style="width:90%;" name="youzanLink"></textarea></td>
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