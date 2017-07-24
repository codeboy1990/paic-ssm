<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>babasport-list</title>
<script type="text/javascript">
	function updateSku(skuId){
		 $(":text").attr("disabled",true);
		 $("#m" + skuId).attr("disabled",false);
		 $("#p" + skuId).attr("disabled",false);
		 $("#s" + skuId).attr("disabled",false);
		 $("#l" + skuId).attr("disabled",false);
		 $("#f" + skuId).attr("disabled",false);
	}
	
	function updateASku(skuId){
		var m = $("#m" + skuId).val();
		var p = $("#p" + skuId).val();
		var s = $("#s" + skuId).val();
		var l = $("#l" + skuId).val();
		var f = $("#f" + skuId).val();
		
		var url = "/sku/update.do";
		var params = {"id":skuId , "marketPrice":m , "price":p , "stock":s , "upperLimit":l , "deliveFee":f };
		$.post(url,params,function(data){
			if(data.message=='1'){
				$(":text").attr("disabled",true);
				alert("修改成功");
			}
		},"json")		
	}
	
</script>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 库存管理 - 列表</div>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" id="tableForm">
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品颜色</th>
			<th>商品尺码</th>
			<th>市场价格</th>
			<th>销售价格</th>
			<th>库       存</th>
			<th>购买限制</th>
			<th>运       费</th>
			<th>是否赠品</th>
			<th>操       作</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
	
		<c:forEach items="${skus }" var="sku">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="ids" value="73"/></td>
				<td>${sku.id}</td>
				<td align="center">${sku.color.name}</td>
				<td align="center">${sku.size}</td>
				<td align="center"><input type="text" id="m${sku.id}"  disabled="disabled" size="10" value="${sku.marketPrice}"/></td>
				<td align="center"><input type="text" id="p${sku.id}"  disabled="disabled" size="10" value="${sku.price}"/></td>
				<td align="center"><input type="text" id="s${sku.id}"  disabled="disabled" size="10" value="${sku.stock}"/></td>
				<td align="center"><input type="text" id="l${sku.id}"  disabled="disabled" size="10" value="${sku.upperLimit}"/></td>
				<td align="center"><input type="text" id="f${sku.id}"  disabled="disabled" size="10" value="${sku.deliveFee}"/></td>
				<td align="center">不是</td>
				<td align="center"><a href="javascript:updateSku('${sku.id}')" class="pn-opt">修改</a> | <a href="javascript:updateASku('${sku.id}')" class="pn-opt">保存</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</form>
</div>
</body>
</html>