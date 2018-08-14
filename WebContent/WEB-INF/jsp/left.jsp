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
<script type="text/javascript" src="/j/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/j/js/jquery.ztree.all.js"></script>
<script type="text/javascript">
	var zTreeObj;
	// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
	var zNodes ;
	$.ajax({
		url:'/j/menus/getMenus',
		type:"post",
		success: function(ret) {
			if(ret.code=="666666"){
			   zNodes = ret.data;
				// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
				var setting = {
					callback: {
						showRemoveBtn: setRemoveBtn,
						onClick: zTreeOnClick
					}, 
					/* edit: {
						enable: true,
						removeTitle: "删除接口",
						showRenameBtn: false
						
					}, */
					view:{
						addHoverDom: addHoverDom
					}
				};
			   zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			}else{
				alert(ret.error);
			}
		}
	});
	function zTreeOnClick(event, treeId, treeNode){
		 alert(treeNode ? treeNode.tId + ", " + treeNode.name : "isRoot");
	}
	function setRemoveBtn(treeId, treeNode) {
		return !treeNode.isParent;
	}
	function addHoverDom(treeId, treeNode) {
		var aObj = $("#" + treeNode.tId + "_a");
		if ($("#diyBtn_"+treeNode.tId).length>0) return;
		var editStr = "<span id='diyBtn_space_" +treeNode.tId+ "' >添加</span>"
			+ "<button type='button' class='diyBtn1' id='diyBtn_" + treeNode.tId
			+ "' title='"+treeNode.name+"' onfocus='this.blur();'></button>";
		aObj.append(editStr);
		var btn = $("#diyBtn_"+treeNode.tId);
		if (btn) btn.bind("click", function(){alert("diy Button for " + treeNode.name);});
	};
</script>
</body>
</html>
