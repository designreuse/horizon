<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>
    <fmt:message key="data.horizon.job.sqoop.title"/>
  </title>
  <link href="<%= path %>/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
</head>
<body class="skin-blue">
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="wrapper row-offcanvas row-offcanvas-left">
  <jsp:include page="../common/menu.jsp"></jsp:include>
  <aside class="right-side">
    <section class="content-header">
      <h1>
        <fmt:message key="data.horizon.job.sqoop.title"/>
        <small><fmt:message key="data.horizon.resource.db.general.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.job"/></a></li>
        <li class="active"><fmt:message key="data.horizon.job.sqoop"/></li>
      </ol>
    </section>

    <section class="content">
      <div class="row">
        <div class="box">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title"><fmt:message key="data.horizon.job.sqoop.title.second"/></h3>
                <button id="add_db" type="button" data-toggle="modal" data-target="#sqoop_add_modal" class="btn btn-app btn-danger">
                  <i class="fa fa-plus-square-o"></i>增加
                </button>
              </div>
              <div class="box-body table-responsive" style="overflow-x:hidden">
                <table id="sqoopJobList" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th><fmt:message key="data.horizon.job.sqoop.info.sqp_job_id"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.sqp_job_name"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.source_db_short_names"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.hive_db"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.hive_table_name"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.update_time"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.sqoop.info.operation"/></th>
                    <th style="display:none"></th>
                    <th style="display:none"></th>
                    <th style="display:none"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="sqoopjob" items="${sqoopJobs}">
                    <tr>
                      <td class="row_detail_edit" data-target="#row_detail_sqp_job_id">${sqoopjob.sqp_job_id}</td>
                      <td class="row_detail_edit" data-target="#row_detail_sqp_job_name">${sqoopjob.sqp_job_name}</td>
                      <td class="row_detail_edit" data-target="#row_detail_source_db_short_names">${sqoopjob.source_db_short_names}</td>
                      <td class="row_detail_edit" data-target="#row_detail_hive_db">${sqoopjob.hive_db}</td>
                      <td class="row_detail_edit" data-target="#row_detail_hive_table_name">${sqoopjob.hive_table_name}</td>
                      <td class="row_detail_edit"><fmt:formatDate value="${sqoopjob.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      <td>
                        <div class="btn-group">
                          <a class="btn btn-default row_detail" data-target="#row_detail"
                             title="<fmt:message key="data.horizon.job.sqoop.info.lookup"/>">
                            <i class='fa fa-eye'></i>
                          </a>
                          <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                             title="<fmt:message key="data.horizon.job.sqoop.info.edit"/>">
                            <i class='fa fa-edit'></i>
                          </a>
                        </div>
                      </td>
                      <td class="row_detail row_detail_edit" style="display:none"
                          data-target="#row_detail_sqp_command"><textarea>${sqoopjob.sqp_command}</textarea></td>
                      <td class="row_detail row_detail_edit" style="display:none"
                          data-target="#row_detail_hive_command"><textarea>${sqoopjob.hive_command}</textarea></td>
                      <td class="row_detail row_detail_edit" style="display:none" data-target="#row_detail_create_time">
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sqoopjob.create_time}" type="both"/></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </aside>
</div>

<div class="modal fade" id="row_detail" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">
          <i class="fa fa-eye"></i>
          <fmt:message key="data.horizon.job.sqoop.modal.title.lookup"/>
          <span id="row_detail_db_name"></span>
        </h4>
      </div>
      <form>
        <div class="modal-body">
          <div class="form-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_command"/></span>
              <textarea id="row_detail_sqp_command" placeholder="Message"
                        type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="form-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_command"/></span>
              <textarea id="row_detail_hive_command" placeholder="Message"
                        type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.create_time"/></span>
              <input id="row_detail_create_time" class="form-control" placeholder="Email CC">
            </div>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              <i class="fa fa-times"></i>
              <fmt:message key="data.horizon.job.sqoop.modal.close"/>
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="row_detail_edit" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.job.sqoop.modal.title.edit"/>
        </h4>
      </div>
      <form id="sqoop_edit_form" action="<%= path %>/sqoop/\${id}/update">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_job_id"/></span>
              <input id="row_detail_sqp_job_id_edit" name="sqp_job_id" type="text" readonly="true" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_job_name"/></span>
              <input id="row_detail_sqp_job_name_edit" name="sqp_job_name" type="text" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message
                  key="data.horizon.job.sqoop.modal.info.source_db_short_names"/></span>
              <input id="row_detail_source_db_short_names_edit" name="source_db_short_names" type="text" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_db"/></span>
              <input id="row_detail_hive_db_edit" name="hive_db" type="text" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message
                  key="data.horizon.job.sqoop.modal.info.hive_table_name"/></span>
              <input id="row_detail_hive_table_name_edit" name="hive_table_name" type="text" class="form-control">
            </div>
          </div>
          <div class="form-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_command"/></span>
              <textarea id="row_detail_sqp_command_edit" name="sqp_command" type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="form-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_command"/></span>
              <textarea id="row_detail_hive_command_edit" name="hive_command" type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message
                key="data.horizon.form.action.close"/></button>
            <button id="submit_row_detail_edit" type="button" class="btn btn-primary pull-left"><i
                class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="sqoop_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.job.sqoop.modal.title.add"/>
        </h4>
      </div>
      <form id="sqoop_add_form" action="<%= path %>/sqoop/add">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_job_name"/></span>
              <input name="sqp_job_name" type="text" class="form-control" autocomplete="off" placeholder="sqp_job_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message
                  key="data.horizon.job.sqoop.modal.info.source_db_short_names"/></span>
              <input name="source_db_short_names" type="text" class="form-control" autocomplete="off"
                     placeholder="多个数据库之间以逗号分隔">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_db"/></span>
              <input name="hive_db" type="text" class="form-control" autocomplete="off" placeholder="hive_db">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message
                  key="data.horizon.job.sqoop.modal.info.hive_table_name"/></span>
              <input name="hive_table_name" type="text" class="form-control" autocomplete="off"
                     placeholder="hive_table_name">
            </div>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.sqp_command"/></span>
            <textarea name="sqp_command" type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_command"/></span>
            <textarea name="hive_command" type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message
                key="data.horizon.form.action.close"/></button>
            <button id="submit_sqoop_add" type="button" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i><fmt:message
                key="data.horizon.form.action.submit"/></button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script src="<%= path %>/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="<%= path %>/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<%= path %>/js/AdminLTE/app.js" type="text/javascript"></script>

<script type="text/javascript">
  $(document).ready(function () {

    var table = $('#sqoopJobList').DataTable({
      "bSort": true,
      "bAutoWidth": false,
      "sScrollX": "100%",
      "sScrollXInner": "100%",
      "aaSorting": [[0, 'desc']]
    });

    $("#sqoopJobList tbody").on("click", "td a.row_detail", function () {
      var tr = $(this).closest("tr");
      $.each(tr.children(".row_detail"), function (num, td) {
        var targetElement = $($(td).attr("data-target"));
        if (targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(td).text().trim());
        } else {
          targetElement.text($(td).text().trim());
        }
      });
      $($(this).attr("data-target")).modal("toggle");
    });

    $('#sqoopJobList tbody').on("click", "td a.row_detail_edit", function () {
      var tr = $(this).closest("tr");
      $.each(tr.children(".row_detail_edit"), function (num, td) {
        var targetElement = $($(td).attr("data-target") + "_edit");
        if (targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(td).text().trim());
        } else {
          targetElement.text($(td).text().trim());
        }
      });
      $($(this).attr("data-target")).modal("toggle");
    });
    $('#submit_row_detail_edit').on('click', function () {
      $.ajax({
        cache: false,
        type: "POST",
        url: $("#sqoop_edit_form").attr("action").replace("\${id}", $("#row_detail_sqp_job_id_edit").val()),
        data: $('#sqoop_edit_form').serialize(),
        async: false,
        success: function (data, textStatus) {
          if (textStatus = "success") {
            window.location.reload();
          }
        },
        error: function (XMLHttpRequest, textStatus) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        },
      });
    });

    $('#submit_sqoop_add').on("click", function () {
      $.ajax({
        cache: false,
        type: "POST",
        url: $("#sqoop_add_form").attr("action"),
        data: $("#sqoop_add_form").serialize(),
        async: false,
        success: function (data, textStatus) {
          if (textStatus = "success") {
            window.location.reload();
          }
        },
        error: function (XMLHttpRequest, textStatus) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        }
      })
    });
  })
</script>
</body>
</html>