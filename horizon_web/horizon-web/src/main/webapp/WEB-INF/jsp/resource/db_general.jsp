<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<!DOCTYPE html>
<html>
<head>
  <title><fmt:message key="data.horizon.resource.db.general.title"/></title>
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
        <fmt:message key="data.horizon.resource.db.general.title"/>
        <small><fmt:message key="data.horizon.resource.db.general.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.resource"/></a></li>
        <li class="active"><fmt:message key="data.horizon.resource.db"/></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><fmt:message
                 key="data.horizon.resource.db.general.title.second"/>
              </h3>
              <button id="add_db" type="button" data-toggle="modal" data-target="#db_add_modal"
                      class="btn btn-app btn-danger">
                <i class="fa fa-plus-square-o"></i>
                <fmt:message key="data.horizon.resource.db.general.info.add"/>
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
                  <th><fmt:message key="data.horizon.resource.db.general.info.id"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.name"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.database.name"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.dialect"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.desc"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.enable"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.updatetime"/></th>
                  <th><fmt:message key="data.horizon.resource.db.general.info.operation"/></th>
                  <th style="display:none"></th>
                  <th style="display:none"></th>
                  <th style="display:none"></th>
                  <th style="display:none"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ dbList }" var="dbInfo">
                <tr>
                  <td class="row_detail_edit" data-target="#row_detail_db_id">${ dbInfo.db_id }</td>
                  <td class="row_detail row_detail_edit" data-target="#row_detail_db_name">${ dbInfo.db_name }</td>
                  <td class="row_detail_edit" data-target="#row_detail_database_name">${ dbInfo.database_name }</td>
                  <td class="row_detail_edit" data-target="#row_detail_dialect">${ dbInfo.dialect }</td>
                  <td class="row_detail_edit" data-target="#row_detail_db_desc">${ dbInfo.db_desc }</td>
                  <td name="is_enable" class="row_detail_edit">
                    <c:choose>
                      <c:when test="${dbInfo.is_enable eq 0}">
                        <fmt:message key="data.horizon.resource.db.general.info.enable"/>
                      </c:when>
                      <c:otherwise>
                        <fmt:message key="data.horizon.resource.db.general.info.abandon"/>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td name="update_time">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ dbInfo.update_time }"
                                    type="both"/>
                  </td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-default row_detail" data-target="#row_detail"
                         title="<fmt:message key="data.horizon.resource.db.general.info.lookup"/>">
                        <i class='fa fa-eye'></i>
                      </a>
                      <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                          title="<fmt:message key="data.horizon.resource.db.general.info.edit"/>">
                        <i class='fa fa-edit'></i>
                      </a>
                      <c:choose>
                        <c:when test="${dbInfo.is_enable eq 0}">
                        <button name="btn_db_status_control" type="button" class="btn btn-default"
                            href="<%= path %>/resource/db/${dbInfo.db_id}/status_control"
                            title="<fmt:message key="data.horizon.resource.db.general.info.abandon"/>">
                          <i class='fa fa-pause'></i>
                        </button>
                        </c:when>
                        <c:otherwise>
                        <button name="btn_db_status_control" type="button" class="btn btn-default"
                            href="<%= path %>/resource/db/${dbInfo.db_id}/status_control"
                            title="<fmt:message key="data.horizon.resource.db.general.info.enable"/>">
                          <i class='fa fa-play'></i>
                        </button>
                        </c:otherwise>
                      </c:choose>
                      <button type="button" class="btn btn-default"
                          title="<fmt:message key="data.horizon.resource.db.general.info.delete"/>">
                        <i class='fa fa-times-circle-o'></i></button>
                    </div>
                  </td>
                  <td class="row_detail row_detail_edit" style="display:none" data-target="#row_detail_user_name">${ dbInfo.user_name }</td>
                  <td class="row_detail row_detail_edit" style="display:none" data-target="#row_detail_pwd">${ dbInfo.pwd }</td>
                  <td class="row_detail" style="display:none" data-target="#row_detail_create_time">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ dbInfo.create_time }" type="both"/>
                  </td>
                  <td class="row_detail row_detail_edit" style="display:none" data-target="#row_detail_db_url">${ dbInfo.db_url }</td>
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

<!-- ROW DETAIL COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="row_detail" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">
          <i class="fa fa-eye"></i>
          <fmt:message key="data.horizon.resource.db.modal.title.lookup"/>
          <span id="row_detail_db_name"></span></h4>
      </div>
      <form action="#" method="post">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.name"/></span>
              <input name="row_detail_user_name" id="row_detail_user_name" class="form-control" placeholder="Email CC">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
              <%--<label class="col-lg-3 control-label"><fmt:message key="data.horizon.resource.db.modal.info.user.pwd"/></label>--%>
              <%--<input type="text" class="form-control" id="row_detail_pwd" readonly="true"/>--%>
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.pwd"/></span>
              <input name="email_to" id="row_detail_pwd" class="form-control" placeholder="Email CC">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <%--<label class="col-lg-3 control-label"><fmt:message key="data.horizon.resource.db.modal.info.createtime"/></label>--%>
              <%--<input type="text" class="form-control" id="row_detail_create_time" readonly="true"/>--%>
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.createtime"/></span>
              <input name="email_to" id="row_detail_create_time" type="email" class="form-control" placeholder="Email BCC">
            </div>
          </div>
          <div class="form-group">
            <%--<label class="col-lg-3 control-label"><fmt:message key="data.horizon.resource.db.modal.info.url"/></label>--%>
            <%--<input type="text" class="form-control" id="row_detail_db_url" readonly="true"/>--%>
            <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.url"/></span>
            <textarea name="message" id="row_detail_db_url" class="form-control" placeholder="Message" style="height: 120px;"></textarea>
          </div>
        </div>
        <div class="modal-footer clearfix">
          <button type="button" class="btn btn-danger" data-dismiss="modal">
            <i class="fa fa-times"></i>
            <fmt:message key="data.horizon.resource.db.modal.close"/>
          </button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- EDIT ROW DETAIL COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="row_detail_edit" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.resource.db.modal.title.edit"/></h4>
      </div>
      <form id="db_edit_form" action="<%= path %>/resource/db/\${id}/edit" method="post">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.id"/></span>
              <input name="db_id" id="row_detail_db_id_edit" type="text" readonly="true" class="form-control" placeholder="id">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.name"/></span>
              <input name="db_name" id="row_detail_db_name_edit" type="text" class="form-control" placeholder="db_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.database.name"/></span>
              <input name="database_name" id="row_detail_database_name_edit" type="text" class="form-control" placeholder="database_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.desc"/></span>
              <input name="db_desc" id="row_detail_db_desc_edit" type="text" class="form-control" placeholder="db_desc">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.dialect"/></span>
              <input name="dialect" id="row_detail_dialect_edit" type="text" class="form-control" placeholder="dialect">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.name"/></span>
              <input name="user_name" id="row_detail_user_name_edit" type="text" class="form-control" placeholder="user name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.pwd"/></span>
              <input name="pwd" id="row_detail_pwd_edit" type="text" class="form-control" placeholder="password">
            </div>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.url"/></span>
            <textarea name="db_url" id="row_detail_db_url_edit" class="form-control" placeholder="CONNECTION URL" style="height: 120px;"></textarea>
          </div>
        </div>
        <div class="modal-footer clearfix">

          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message key="data.horizon.form.action.close"/></button>

          <button id="submit_row_detail_edit" type="button" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 添加 ADD ROW DETAIL COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="db_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.resource.db.modal.title.add"/></h4>
      </div>
      <form id="db_add_form" action="<%= path %>/resource/db/" method="post">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.name"/></span>
              <input name="db_name" type="text" class="form-control" placeholder="db_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.database.name"/></span>
              <input name="database_name" type="text" class="form-control" placeholder="database_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.desc"/></span>
              <input name="db_desc" type="text" class="form-control" placeholder="db_desc">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.dialect"/></span>
              <input name="dialect" type="text" class="form-control" placeholder="dialect">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.name"/></span>
              <input name="user_name" type="text" class="form-control" placeholder="user name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.user.pwd"/></span>
              <input name="pwd" type="text" class="form-control" placeholder="password">
            </div>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.resource.db.modal.info.url"/></span>
            <textarea name="db_url" class="form-control" placeholder="CONNECTION URL" style="height: 120px;"></textarea>
          </div>
        </div>
        <div class="modal-footer clearfix">

          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message key="data.horizon.form.action.close"/></button>

          <button id="submit_db_ad" type="button" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
      "aaSorting": [[6,'desc']]
    });

    // 绑定click事件,添加每行隐藏的详情数据显示功能
    $('#dbList tbody').on('click', 'td a.row_detail', function () {
      var tr = $(this).closest('tr');

      // 查看DB链接详情,将隐藏的td中的值在弹出框中显示
      $.each(tr.children(".row_detail"), function(n, value) {
        var targetElement = $($(value).attr('data-target'));

        if(targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(value).text());
        } else {
          targetElement.text($(value).text());
        }
      });

      // 弹出详情框
      $($(this).attr("data-target")).modal("toggle")
    });

    // 绑定click事件,添加每行修改数据的功能
    $('#dbList tbody').on('click', 'td a.row_detail_edit', function () {
      var tr = $(this).closest('tr');

      // 将隐藏的td中的值在弹出框中显示
      $.each(tr.children(".row_detail_edit"), function(n, value) {
        var targetElement = $($(value).attr('data-target') + "_edit");

        if(targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(value).text().trim());
        } else {
          targetElement.text($(value).text().trim());
        }
      });

      // 弹出修改框
      $($(this).attr("data-target")).modal("toggle")
    });

    // 点击提交按钮时提交修改页面,绑定click事件,添加修改数据的功能
    $('#submit_row_detail_edit').on('click', function () {
      $.ajax({
        cache : false,
        type : "POST",
        url : $('#db_edit_form').attr("action").replace("\${id}", $('#row_detail_db_id_edit').val()),
        data : $('#db_edit_form').serialize(),	//要发送的表单中的数据
        async : false, // 同步发送请求
        error : function(request) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        },
        success : function(data) {
          alert(data.msg);
          if(data.status) {
            window.location.reload();
          }
        }
      });
    });

//    $("button[name='btn_db_status_control']").on('click'  //这个函数只能 应用于页面中展示的元素
    // 绑定click事件,添加启用禁用DB的功能
    $('#dbList tbody').on('click', "td button[name='btn_db_status_control']", function () {//可以应用到隐藏元素
      var icon = $(this).find("i");
      var td = $(this).closest('tr').children("[name='is_enable']");
      var update_time = $(this).closest('tr').children("[name='update_time']");
      var button = $(this);

      $.ajax({
        cache : false,
        type : "POST",
        url : $(this).attr("href"),
        async : true, // 异步发送请求
        error : function(request) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        },
        success : function(data) {
          var action = '';
          var status = '';

          if(data.is_enable) {
            action = "play";
            status = '<fmt:message key="data.horizon.resource.db.general.info.abandon"/>';
            button.attr("title", '<fmt:message key="data.horizon.resource.db.general.info.enable"/>');
          } else {
            action = "pause";
            status = '<fmt:message key="data.horizon.resource.db.general.info.enable"/>';
            button.attr("title", '<fmt:message key="data.horizon.resource.db.general.info.abandon"/>');
          }

          icon.attr("class", "fa fa-" + action);
          td.text(status);
          update_time.text('' + data.update_time);
        }
      });
    });

    $('#submit_db_ad').on("click", function() {
      $.ajax({
        cache : false,
        type : "POST",
        url : $('#db_add_form').attr("action"),
        data : $('#db_add_form').serialize(),	//要发送的表单中的数据
        async : true, // 异步发送请求
        error : function(request) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        },
        success : function(data) {
          alert(data.msg);
          if(data.status) {
            window.location.reload();
          }
        }
      });
    });
  })
</script>

</body>
</html>