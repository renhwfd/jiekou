<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <table>
     	<tr>
     		<td>
     			<label>id值:</label>
     		</td>
     		<td>
     			<input value="${menus.id }" readonly="readonly" id="id"/>
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>接口名称:</label>
     		</td>
     		<td>
     			<input value="${menus.name }" id="name" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>接口地址:</label>
     		</td>
     		<td>
     			<input value="${menus.url }"  id="url" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>上级id:</label>
     		</td>
     		<td>
     			<input value="${menus.parentid }" id="parentid"/>
     			<input value="" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>参数:</label>
     		</td>
     		<td>
     			<input value="${menus.params }" id="params" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>层级:</label>
     		</td>
     		<td>
     			<input value="${menus.local }" readonly="readonly" id="local" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<button onclick="update();">修改</button>
     		</td>
     		<td>
     			<button onclick="cancel();">取消</button>
     		</td>
     	</tr>
     </table>
<script type="text/javascript" src="/j/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function update(){
		var id = $("#id").val().trim();
		var name = $("#name").val().trim();
		var url = $("#url").val().trim();
		var parentid = $("#parentid").val().trim();
		var params = $("#params").val().trim();
		var local = $("#local").val().trim();
		$.ajax({
			url:'/j/menus/update',
			type:"post",
			data:{
				id:id,
				name:name,
				url:url,
				parentid:parentid,
				params:params,
				local:local
			},
			success: function(ret) {
				if(ret.code=="666666"){
				   alert("修改成功");
				   top.location.href="http://127.0.0.1:8080/j/menus/index";
				}else{
					alert(ret.error);
				}
			}
		});
	}
	function cancel(){
		location.reload();
	}
</script>
</body>
</html>