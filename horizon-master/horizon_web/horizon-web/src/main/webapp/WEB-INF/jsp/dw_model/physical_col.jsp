<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<!DOCTYPE html>
<html>
<head>
  <title><fmt:message key="data.horizon.dw.model.physical.col.title"/></title>
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
        <fmt:message key="data.horizon.dw.model.physical.col.title"/>
        <small><fmt:message key="data.horizon.dw.model.physical.col.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.dw.model"/></a></li>
        <li class="active"><fmt:message key="data.horizon.dw.model.physical.col"/></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><fmt:message
                 key="data.horizon.dw.model.physical.col.title.second"/>
              </h3>
              <button id="refresh_btn" type="button" class="btn btn-app btn-danger">
                <i class="fa fa-refresh"></i>
                <fmt:message key="data.horizon.dw.model.physical.col.act.refresh"/>
                <form id="refresh_form" action="<%= path %>/dw_model/physical_col.html" method="post">
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
                  <th><fmt:message key="data.horizon.dw.model.physical.col.info.name"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.col.info.type"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.col.info.comment"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.col.info.tbl.name"/></th>
                  <th><fmt:message key="data.horizon.dw.model.physical.col.info.database"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ columnList }" var="col">
                <tr>
                  <td class="row_detail_edit" data-target="#row_detail_id">${ col.column_name }</td>
                  <td name="type" class="row_detail_edit">
                    <c:choose>
                      <c:when test="${col.type eq 0}">
                        <fmt:message key="data.horizon.dw.model.physical.col.info.type.0"/>
                      </c:when>
                      <c:otherwise>
                        <fmt:message key="data.horizon.dw.model.physical.col.info.type.1"/>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td class="row_detail row_detail_edit" data-target="#row_detail_name">${ col.comment }</td>
                  <td class="row_detail_edit" data-target="#row_detail_name_zh">${ col.tbl_name }</td>
                  <td class="row_detail_edit" data-target="#row_detail_desc">${ col.db_name }</td>
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
      "bSort": false,
      "iDisplayLength": 25,
      "aLengthMenu": [[25, 50, 100, 200], [25, 50, 100, 200]]
//      "aaSorting": [[4,'asc'], [3,'desc'], [1, 'asc']]
    });

    // 绑定click事件,刷新后台缓存
    $('#refresh_btn').on('click', function () {//可以应用到隐藏元素
      $('#refresh_form').submit();
    });
  })
</script>

</body>
</html>