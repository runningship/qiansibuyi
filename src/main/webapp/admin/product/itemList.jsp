<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String productId = request.getParameter("productId");
	request.setAttribute("productId", productId);
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="../../js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">
function doSearch(){
	var a=$('form[name=form1]').serialize();
	YW.ajax({
	    type: 'get',
	    url: '${projectName}/c/admin/product/listItemData',
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
		        url: '${projectName}/c/admin/product/deleteItem?id='+id,
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
		doSearch();
		
		BUI.use(['bui/overlay','bui/mask'],function(Overlay){
	        var dialog = new Overlay.Dialog({
	            title:'添加库存',
	            width:900,
	            height:350,
	            buttons:[],
	            loader : {
	              url : 'addItem.jsp',
	              autoLoad : false, //不自动加载
	              params : {a : 'a'},//附加的参数
	              lazyLoad : false, //不延迟加载
	              /*, //以下是默认选项
	              dataType : 'text',   //加载的数据类型
	              property : 'bodyContent', //将加载的内容设置到对应的属性
	              loadMask : {
	                //el , dialog 的body
	              },
	              lazyLoad : {
	                event : 'show', //显示的时候触发加载
	                repeat : true //是否重复加载
	              },
	              callback : function(text){
	                var loader = this,
	                  target = loader.get('target'); //使用Loader的控件，此处是dialog
	                //
	              }
	              */
	            },
	            mask:false
	          });
	      $('#btnAdd').on('click',function () {
	        dialog.show();
	        dialog.get('loader').load();
	      });
	    });
	});
	
</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
	<button id="btnAdd" type="button" class="btn btn-success" onclick="return false;">添加</button>
	<input type="hidden" name="productId" value="${productId }"/>
    商品名称：<input style="height:18px;width:200px;margin-right:10px;" type="text" name="name"/>
    <button type="button" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th style="width:30px">编号</th>
        <th>商品名称</th>
        <th style="width:110px;">颜色</th>
        <th style="width:60px;">尺码</th>
        <th >购买时间</th>
        <th >支付方式</th>
        <th style="width:120px;">操作</th>
    </tr>
    </thead>
    <tbody>
    	<tr style="display:none" class="repeat">
                <td>$[id]</td>
                <td>$[productName]</td>
                <td >$[color]</td>
                <td>$[size]</td>
                <td >$[buyTime]</td>
                <td >$[zhifu]</td>
                <td>
                	<a href="genQR.jsp?id=$[id]"  target="_blank">二维码</a>
                	<a href="view.jsp?id=$[id]"  target="_blank">预览</a>
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
