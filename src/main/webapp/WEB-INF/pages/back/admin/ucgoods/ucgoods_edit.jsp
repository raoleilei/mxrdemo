<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<jsp:include page="/WEB-INF/pages/plugins/back/back_header.jsp"/>
<%!
	public static final String UCGOODS_EDIT_URL = "pages/back/admin/ucgoods/edit.action" ;
%>
<script type="text/javascript" src="js/pages/back/admin/ucgoods/ucgoods_edit.js"></script>
<body class="hold-transition skin-blue sidebar-mini"> 
	<div class="wrapper">
		<!-- 导入头部标题栏内容 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_title_head.jsp" />
		<!-- 导入左边菜单项 -->
		<jsp:include page="/WEB-INF/pages/plugins/back/include_menu_item.jsp">
			<jsp:param name="mi" value="5"/>
			<jsp:param name="msi" value="51"/>
		</jsp:include>
		<div class="content-wrapper text-left">
					<div class="panel panel-info">
				<div class="panel-heading">
					<strong><span class="glyphicon glyphicon-user"></span>&nbsp;编辑半成品信息</strong>
				</div>
				<shiro:hasPermission name="ucgoods:edit">
					<c:if test="${errors == null }">
						<div class="panel-body">
							<form class="form-horizontal" action="<%=UCGOODS_EDIT_URL%>" id="myform" method="post" enctype="multipart/form-data">
								<fieldset>
									<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
									<div class="form-group" id="nameDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="name">半成品名称：</label>
										<div class="col-md-5">
											<!-- 定义表单输入组件 -->
											<input type="text" id="name" name="name" class="form-control"
												placeholder="请输入半成品名称" value="${ucgoods.name }">
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="nameMsg"></div>
									</div>
									<div class="form-group" id="priceDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="price">半成品单价（￥）：</label>
										<div class="col-md-5">
											<input type="text" id="price" name="price" class="form-control"
												placeholder="请输入半成品单价" value="${ucgoods.price }">
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="priceMsg"></div>
									</div>
									<div class="form-group" id="sizeDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="weight">规格：</label>
										<div class="col-md-5">
											<!-- 定义表单输入组件 -->
											<input type="text" id="size" name="size" class="form-control"
												placeholder="请输入半成品规格" value="${ucgoods.size }" >
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="sizeMsg"></div>
									</div>
									<div class="form-group" id="unitDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="unit">半成品单位：</label>
										<div class="col-md-5">
											<select id="unit" name="unit" class="form-control">
												<option value="">====== 请选择半成品单位 ======</option>
												<option value="1" ${ucgoods.unit == 1 ? "selected" : "" }>个数</option>
												<option value="2" ${ucgoods.unit == 2 ? "selected" : "" }>长度（米）</option>
											</select>
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="unitMsg"></div>
									</div>
									<div class="form-group" id="picDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="pic">商品图片：</label>
										<div class="col-md-5">
											<img src="${ucgoods.photo }" style="width:200px;"/>
											<!-- 定义表单输入组件 -->
											<input type="file" id="pic" name="pic" class="form-control"
												placeholder="请上传商品照片">
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="picMsg"></div>
									</div>
									<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
									<div class="form-group" id="noteDiv">
										<!-- 定义表单提示文字 -->
										<label class="col-md-3 control-label" for="note">备注信息：</label>
										<div class="col-md-5">
											<!-- 定义表单输入组件 -->
											<textarea id="note" name="note"
												class="form-control" placeholder="请输入半成品的详细信息" rows="10">${ucgoods.note }</textarea>
										</div>
										<!-- 定义表单错误提示显示元素 -->
										<div class="col-md-4" id="noteMsg"></div>
									</div> 
									<div class="form-group">
										<div class="col-md-5 col-md-offset-3">
											<input type="hidden" name="ucid" id="ucid" value="${ucgoods.ucid }">
											<input type="hidden" name="photo" id="photo" value="${ucgoods.photo }">
											<button type="submit" class="btn btn-primary">修改</button>
											<button type="reset" class="btn btn-warning">重置</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="panel-footer" style="height:100px;">
							<jsp:include page="/WEB-INF/pages/plugins/include_alert.jsp"/>
						</div>
					</c:if>
					<c:if test="${errors != null }">
						${errors }
					</c:if>
				</shiro:hasPermission>
				<shiro:lacksPermission name="ucgoods:edit">
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
	<jsp:include page="/WEB-INF/pages/plugins/back/include_javascript_foot.jsp" />
<jsp:include page="/WEB-INF/pages/plugins/back/back_footer.jsp"/>
