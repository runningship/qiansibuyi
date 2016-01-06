<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
function doSearch(){
	var a=$('form[name=form1]').serialize();
	YW.ajax({
	    type: 'get',
	    url: '${projectName}/c/admin/product/listData',
	    data: a,
	    dataType:'json',
	    mysuccess: function(json){
	        buildHtmlWithJsonArray("repeat",json.page.data);
	        Page.setPageInfo(json.page);
	    }
	  });
}
	function delPost(id){
		art.dialog.confirm('删除后不可恢复，确定要删除吗？', function () {
		    YW.ajax({
		        type: 'POST',
		        url: '${projectName}/c/admin/product/delete?id='+id,
		        data:'',
		        mysuccess: function(data){
                    doSearch();
		            alert('删除成功');
		        }
		      });
		  },function(){},'warning');
	}
	$(function () {
		Page.Init();
		$('#addnew').click(function(){
				window.location.href="add.jsp";
		 });
		doSearch();
	});
	
</script>
<style type="text/css">
#city_wrap select{height:22px;width:90px;margin-top: 5px;margin-bottom: 5px;}
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
    商品名称：<input style="height:18px;width:200px;margin-right:10px;" type="text" name="name"/>
    <button type="button" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th style="width:30px">编号</th>
        <th>名称</th>
        <th style="width:110px;">进价</th>
        <th style="width:60px;">售价</th>
        <th >有赞连接</th>
        <th style="width:120px;">操作</th>
    </tr>
    </thead>
    <tbody>
    	<tr style="display:none" class="repeat">
                <td>$[id]</td>
                <td>$[name]</td>
                <td >$[buyingPrice]</td>
                <td>$[salePrice]</td>
                <td >$[youzanLink]</td>
                <td>
                    <a href="edit.jsp?id=$[id]">编辑</a>
                    <a href="itemList.jsp?productId=$[id]" >库存</a>
                    <a href="#" onclick="delPost($[id])">删除</a>
                </td>
            </tr>
    </tbody>
	</table>

	<div class="footer" style="margin-top:5px;margin-left:35px;">
        <div class="maxHW mainCont ymx_page foot_page_box"></div>
    </div>
</body>
</html>
