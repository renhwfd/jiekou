<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/j/css/demo.css" type="text/css">
 <link rel="stylesheet" href="/j/css/zTreeStyle/zTreeStyle.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul id="treeDemo" class="ztree"></ul>
</body>
</html>
<script type="text/javascript" src="/j/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/j/js/jquery.ztree.all.js"></script>
<script type="text/javascript">
	var zTreeObj;
	// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	var setting = {};
	// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
	var zNodes ;
	$.ajax({
		url:'/j/menus/getMenus',
		type:"post",
		success: function(ret) {
			zNodes = ret;
		   zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		}
	});
</script>
