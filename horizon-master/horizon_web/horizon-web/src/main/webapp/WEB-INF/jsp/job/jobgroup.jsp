<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>
    <fmt:message key="data.horizon.job.jobgroup.title"/>
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
        <fmt:message key="data.horizon.job.jobgroup.title"/>
        <small><fmt:message key="data.horizon.configuration"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.job"/></a></li>
        <li class="active"><fmt:message key="data.horizon.job.jobgroup"/></li>
      </ol>
    </section>

    <section class="content">
      <div class="row">
        <div class="box">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title"><fmt:message key="data.horizon.job.jobgroup.title.second"/></h3>
                <button id="add_jobgroup" type="button" data-toggle="modal" data-target="#jobgroup_add_modal" class="btn btn-app btn-danger">
                  <i class="fa fa-plus-square-o"></i>增加
                </button>
              </div>
              <div class="box-body table-responsive" style="overflow-x:hidden">
                <table id="jobgrouplist" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th><fmt:message key="data.horizon.job.jobgroup.id"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.jobgroup.name"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.jobgroup.enable"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.jobgroup.desc"></fmt:message></th>
                    <th><fmt:message key="data.horizon.job.jobgroup.operation"/></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="jobgroup" items="${jobgroups}">
                    <tr>
                      <td class="row_detail_edit" data-target="#row_detail_jobgroup_id_edit">${jobgroup.id}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobgroup_name_edit">${jobgroup.name}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobgroup_enable_edit">${jobgroup.enable}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobgroup_desc_edit">${jobgroup.desc}</td>
                      <td>
                        <div class="btn-group">
                          <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                             title="<fmt:message key="data.horizon.job.jobgroup.edit"/>">
                            <i class='fa fa-edit'></i>
                          </a>
                        </div>
                      </td>
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

<div class="modal fade" id="row_detail_edit" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.job.jobgroup.modal.title.edit"/>
        </h4>
      </div>
      <form id="jobgroup_edit_form" action="<%= path %>/jobgroup/\${id}/update">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.id"/></span>
              <input id="row_detail_jobgroup_id_edit" name="id" type="text" readonly="true" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message
                  key="data.horizon.job.jobgroup.name"/></span>
              <input id="row_detail_jobgroup_name_edit" name="name" type="text" readonly="true" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.enable"/></span>
              <input id="row_detail_jobgroup_enable_edit" name="enable" type="text" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.desc"/></span>
            <textarea id="row_detail_jobgroup_desc_edit" name="desc" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message
                key="data.horizon.form.action.close"/></button>
            <button id="submit_jobgroup_edit" type="button" class="btn btn-primary pull-left"><i
                class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>


<div class="modal fade" id="jobgroup_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.job.jobgroup.modal.title.add"/>
        </h4>
      </div>
      <form id="jobgroup_add_form" action="<%= path %>/jobgroup/add">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.name"/></span>
              <input name="name" type="text" class="form-control" autocomplete="off" placeholder="jobgroup_name">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.enable"/></span>
              <input name="enable" type="text" class="form-control" autocomplete="off" placeholder="enable">
            </div>
          </div>
          <div class="form-group">
            <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.desc"/></span>
            <textarea name="desc" type="text" class="form-control" style="height: 120px;"></textarea>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message
                key="data.horizon.form.action.close"/></button>
            <button id="submit_jobgroup_add" type="button" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i><fmt:message
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

    var table = $('#jobgrouplist').DataTable({
      "bSort": true,
      "bAutoWidth": false,
      "sScrollX": "100%",
      "sScrollXInner": "100%",
      "aaSorting": [[0, 'desc']]
    });

    $('#jobgrouplist tbody').on("click", "td a.row_detail_edit", function () {
      var tr = $(this).closest("tr");
      $.each(tr.children(".row_detail_edit"), function (num, td) {
        var targetElement = $($(td).attr("data-target"));
        if (targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(td).text().trim());
        } else {
          targetElement.text($(td).text().trim());
        }
      });
      $($(this).attr("data-target")).modal("toggle");
    });

    $('#submit_jobgroup_edit').on('click', function () {
      $.ajax({
        cache: false,
        type: "POST",
        url: $("#jobgroup_edit_form").attr("action").replace("\${id}", $("#row_detail_jobgroup_id_edit").val()),
        data: $('#jobgroup_edit_form').serialize(),
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

    $('#submit_jobgroup_add').on("click", function () {
      $.ajax({
        cache: false,
        type: "POST",
        url: $("#jobgroup_add_form").attr("action"),
        data: $("#jobgroup_add_form").serialize(),
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