<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<!DOCTYPE html>
<html>
<head>
  <title><fmt:message key="data.horizon.dw.model.physical.tbl.title"/></title>
  <!-- DATA TABLES -->
  <link href="<%= path %>/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body class="skin-blue">
<!-- header logo: style can be found in header.less -->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="wrapper row-offcanvas row-offcanvas-left">
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="../common/menu.jsp"></jsp:include>

  <!-- Right side column. Contains the navbar and content of the page -->
  <aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <fmt:message key="data.horizon.dw.model.physical.tbl.title"/>
        <small><fmt:message key="data.horizon.dw.model.physical.tbl.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.dw.model"/></a></li>
        <li class="active"><fmt:message key="data.horizon.dw.model.physical.tbl"/></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><fmt:message
                 key="data.horizon.dw.model.physical.tbl.title.second"/>
              </h3>
              <button id="refresh_btn" type="button" class="btn btn-app btn-danger">
                <i class="fa fa-refresh"></i>
                <fmt:message key="data.horizon.dw.model.physical.tbl.act.refresh"/>
                <form id="refresh_form" action="<%= path %>/dw_model/physical_tbl.html" method="post">
                  <input type="hidden" name="refresh" value="true">
                </form>
              </button>
            </div>
            <!-- /.box-header -->
            <div class="box-header">
              <%--<input type="text" name="table" value="fdsafdsa"/>--%>

            </div>
            <div class="box-body table-responsive" style="overflow-x: hidden">
              <table id="dbList" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.id"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.name"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.comment"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.database"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.type"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.createtime"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.updatetime"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.tbl.info.ddl.updatetime"/></th>
                  <th><fmt:message key="data.horizon.operation"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ tableList }" var="tbl">
                <tr>
                  <td class="row_detail_edit" data-target="#row_detail_id">${ tbl.tbl_id }</td>
                  <td class="row_detail row_detail_edit" data-target="#row_detail_name">${ tbl.tbl_name }</td>
                  <td class="row_detail_edit" data-target="#row_detail_name_zh">${ tbl.tbl_comment }</td>
                  <td class="row_detail_edit" data-target="#row_detail_desc">${ tbl.db_name }</td>
                  <td name="tbl_type" class="row_detail_edit">
                    <c:choose>
                      <c:when test="${tbl.tbl_type eq 0}">
                        <fmt:message key="data.horizon.dw.model.physical.tbl.info.type.0"/>
                      </c:when>
                      <c:otherwise>
                        <fmt:message key="data.horizon.dw.model.physical.tbl.info.type.1"/>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td name="create_time">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ tbl.create_time }"
                                    type="both"/>
                  </td>
                  <td name="update_time">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ tbl.update_time }"
                                    type="both"/>
                  </td>
                  <td name="create_time">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ tbl.ddl_update_time }"
                                    type="both"/>
                  </td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-default row_detail" data-target="#row_detail"
                         title="<fmt:message key="data.horizon.dw.model.physical.tbl.info.lookup"/>">
                        <i class='fa fa-eye'></i>
                      </a>
                    </div>
                  </td>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

    </section>
    <!-- /.content -->
  </aside>
  <!-- /.right-side -->
</div>
<!-- ./wrapper -->

<!-- include js -->
<jsp:include page="../common/footer.jsp"/>
<script src="<%= path %>/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="<%= path %>/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<%= path %>/js/AdminLTE/app.js" type="text/javascript"></script>

<!-- page script -->
<script type="text/javascript">
  $(document).ready(function() {
    // 初始化表格
    var table = $('#dbList').DataTable({
      "bSort": true,
      "aaSorting": [[3,'asc'], [5,'desc']]
    });

    // 绑定click事件,刷新后台缓存
    $('#refresh_btn').on('click', function () {//可以应用到隐藏元素
      $('#refresh_form').submit();
    });

  })
</script>

</body>
</html>