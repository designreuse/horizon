<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>
    <fmt:message key="data.horizon.user.user.title"/>
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
        <fmt:message key="data.horizon.user.user.title"/>
        <small><fmt:message key="data.horizon.configuration"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.user"/></a></li>
        <li class="active"><fmt:message key="data.horizon.user.user"/></li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="box">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title"><fmt:message key="data.horizon.user.user.title.second"/></h3>
                <button id="add_user" type="button" data-toggle="modal" data-target="#user_add_modal"
                        class="btn btn-app btn-danger">
                  <i class="fa fa-plus-square-o"></i>增加
                </button>
              </div>
              <div class="box-body table-responsive" style="overflow-x:hidden">
                <table id="joblist" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th style="display: none"></th>
                    <th><fmt:message key="data.horizon.user.user.department"/></th>
                    <th><fmt:message key="data.horizon.user.user.account"/></th>
                    <th><fmt:message key="data.horizon.user.user.nickname"/></th>
                    <th><fmt:message key="data.horizon.user.user.email"/></th>
                    <th style="display: none"></th>
                    <th><fmt:message key="data.horizon.user.user.mobilephone"/></th>
                    <th><fmt:message key="data.horizon.user.user.operation"/></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="user" items="${users}">
                    <tr>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit"
                          style="display:none">${user.id}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit">${user.department}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit">${user.account}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit">${user.display_name}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit">${user.email}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit"
                          style="display: none">${user.role_id}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit">${user.mobilephone}</td>
                      <td>
                        <div class="btn-group">
                          <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                             title="<fmt:message key="data.horizon.user.user.edit"/>">
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


<div class="modal fade" id="user_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message key="data.horizon.user.user.modal.title.add"/>
        </h4>
      </div>
      <form id="user_add_form" action="<%=path%>/user/add">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><fmt:message key="data.horizon.user.user.email"/></span>
              <input name="email" type="text" class="form-control" autocomplete="off" placeholder="email">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">权限组</span>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="1"> <fmt:message
                    key="data.horizon.user.permission.superadmin"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="2"> <fmt:message
                    key="data.horizon.user.permission.warehouse.admin"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="3"> <fmt:message
                    key="data.horizon.user.permission.warehouse"/>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="4"> <fmt:message
                    key="data.horizon.user.permission.financereport"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="5"> <fmt:message
                    key="data.horizon.user.permission.reportshow"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="6"> <fmt:message
                    key="data.horizon.user.permission.marketbigdata"/>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="7"> <fmt:message
                    key="data.horizon.user.permission.algorithmstudy"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="8"> <fmt:message
                    key="data.horizon.user.permission.individualmarket"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="9"> <fmt:message
                    key="data.horizon.user.permission.ddclick"/>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="10"> <fmt:message
                    key="data.horizon.user.permission.marketsystem"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="11"> <fmt:message
                    key="data.horizon.user.permission.neuralnetwork"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="12"> <fmt:message
                    key="data.horizon.user.permission.adalliance"/>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="13"> <fmt:message
                    key="data.horizon.user.permission.ddclick.readonly"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="14"> <fmt:message
                    key="data.horizon.user.permission.dictionarylook"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="15"> <fmt:message
                    key="data.horizon.user.permission.warehouse.readonly"/>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="16"> <fmt:message
                    key="data.horizon.user.permission.searchdevelop"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="17"> <fmt:message
                    key="data.horizon.user.permission.BIsystem"/>
                </label>
                <label class="checkbox-inline">
                  <input name="permissions" type="checkbox" value="18"> <fmt:message
                    key="data.horizon.user.permission.test"/>
                </label>
              </div>
            </div>
          </div>
          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i><fmt:message
                key="data.horizon.form.action.close"/></button>
            <button id="submit_user_add" type="button" class="btn btn-primary pull-left"><i
                class="fa fa-envelope"></i><fmt:message
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

    $("#submit_user_add").on("click",function(){
      var permissions = $("[name='permissions']:checked");
      var len = permissions.length;
      if(len == 0) {
        alert("You must select one permisson group at least!");
      }else{
        $.ajax({
          cache: false,
          type: "POST",
          url: $("#user_add_form").attr("action"),
          data: $("#user_add_form").serialize(),
          async: false,
          success: function (data, textStatus) {
            if (textStatus = "success") {
              window.location.reload();
            }
          },
          error: function (XMLHttpRequest, textStatus) {
            alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
          }
        });
      }
    })
  })
</script>
</body>
</html>