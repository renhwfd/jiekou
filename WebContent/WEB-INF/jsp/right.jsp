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
     			<input value="${menus.id }" readonly="readonly" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>接口名称:</label>
     		</td>
     		<td>
     			<input value="${menus.name }" readonly="readonly" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>接口地址:</label>
     		</td>
     		<td>
     			<input value="${menus.url }" readonly="readonly" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>上级id:</label>
     		</td>
     		<td>
     			<input value="${menus.parentid }" readonly="readonly" />
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<label>参数:</label>
     		</td>
     		<td>
     			<input value="${menus.params }" readonly="readonly" />
     		</td>
     	</tr>
     </table>
</body>
</html>