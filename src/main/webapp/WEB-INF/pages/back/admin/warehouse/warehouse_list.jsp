<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<jsp:include page="/WEB-INF/pages/plugins/back/back_header.jsp"/>
<script type="text/javascript" src="js/pages/back/admin/warehouse/warehouse_list.js"></script>
<script type="text/javascript" src="js/split_page.js"></script>
<%!
	public static final String WAREHOUSE_EDIT_URL = "pages/back/admin/warehouse/edit_pre.action" ;
%>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_menu_item.jsp">
			<jsp:param name="mi" value="3"/>
			<jsp:param name="msi" value="32"/>
		</jsp:include>
		<div class="content-wrapper text-left">
		<div class="panel panel-info">
			<div class="panel-heading">
				<strong><span class="glyphicon glyphicon-list"></span>&nbsp;仓库信息列表</strong>
			</div>
			<shiro:hasPermission name="warehouse:list">
				<div class="panel-body">
					<div>
						<jsp:include page="/WEB-INF/pages/plugins/split_plugin_search_bar_notime.jsp"/>
					</div>
					<table class="table table-condensed">
						<thead>
							<tr>
								<th class="text-left" style="width:10%;">仓库编号</th>
								<th class="text-left" style="width:20%;">仓库名称</th> 
								<th class="text-left" style="width:30%;">仓库地址</th>
								<th class="text-center" style="width:10%;">存储分类</th>
								<th class="text-center" style="width:10%;">录入者姓名</th>
								<th class="text-center" style="width:20%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="#{allWarehouses }" var="warehouse">
								<tr>
									<td class="text-left">${warehouse.wid }</td>
									<td class="text-left"><span id="wid-${warehouse.wid }" style="cursor:pointer;">${warehouse.name }</span></td>
									<td class="text-left">${warehouse.address }</td>
									<td class="text-center"><span id="wiid-${warehouse.wid}" style="display: none">${warehouse.wiid}</span>${warehouse.wiid ==1 ? "半成品" : "成品" }</td>
									<td class="text-center"><span id="mid-${warehouse.recorder }" style="cursor:pointer;">${allMembers[warehouse.wid].ename }</span></td> 
									<td class="text-center">
										<a href="<%=WAREHOUSE_EDIT_URL%>?wid=${warehouse.wid }" class="btn btn-warning btn-xs">
												<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑信息</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="selectWid" style="display: none"></div>
					<div id="splitBarDiv" style="float:right">
						<jsp:include page="/WEB-INF/pages/plugins/split_plugin_page_bar_notime.jsp"/> 
					</div>
				</div>
				<div class="panel-footer" style="height:100px;">
					<jsp:include page="/WEB-INF/pages/plugins/include_alert.jsp"/>
				</div>
			</shiro:hasPermission>
			<shiro:lacksPermission name="warehouse:list">
				您没有该权限哦！
			</shiro:lacksPermission>
		</div>
		</div>
		<!-- 导入公司尾部认证信息 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_title_foot.jsp" />
		<!-- 导入右边工具设置栏 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_menu_sidebar.jsp" />
		<div class="control-sidebar-bg"></div>
	</div>
<jsp:include page="/WEB-INF/pages/plugins/back/info/warehouse_goods_modal.jsp"/>
<jsp:include page="/WEB-INF/pages/plugins/back/info/emp_info_modal.jsp"/>
<jsp:include page="/WEB-INF/pages/plugins/back/info/emp_dept_list_modal.jsp"/>
<jsp:include page="/WEB-INF/pages/plugins/back/include_javascript_foot.jsp" />
<jsp:include page="/WEB-INF/pages/plugins/back/back_footer.jsp"/>
