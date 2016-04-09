<%--
  Created by IntelliJ IDEA.
  User: haolijs
  Date: 2016/4/1
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title><fmt:message key="data.horizon.dw.model.business.process.title"/></title>
  <!-- DATA TABLES -->
  <link href="<%= path %>/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>


  <link href="<%= path %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%= path %>/css/bootstrap-theme.min.css" rel="stylesheet">
  <script src="<%= path %>/js/jquery.min.js"></script>
  <script src="<%= path %>/js/bootstrap.min.js"></script>
</head>
<body class="skin-blue">
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="wrapper row-offcanvas row-offcanvas-left">
  <jsp:include page="../common/menu.jsp"></jsp:include>
  <aside class="right-side">
    <section class="content-header">
      <h1>
        <fmt:message key="data.horizon.dw.model.business.process.title"/>
        <small><fmt:message key="data.horizon.dw.model.business.process.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.dw.model"/></a></li>
        <li class="active"><fmt:message key="data.horizon.dw.model.business.process"/></li>
      </ol>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><fmt:message key="data.horizon.dw.model.business.process.title.second"/>
              </h3>
              <button id="add_business_process" type="button" data-toggle="modal" data-target="#business_add_modal"
                      class="btn btn-app ">
                <i class="fa fa-plus-square-o"></i>
                <fmt:message key="data.horizon.dw.model.business.process.add"/>
              </button>
            </div>

            <div class="box-header">
              <%--<input type="text" name="table" value="fdsafdsa"/>--%>
            </div>

            <div class="box-body table-responsive" style="overflow-x: hidden">
              <table id="business_process_List" class="table table-bordered table-striped"
                      >
                <thead>
                <tr>
                  <th><fmt:message key="data.horizon.dw.model.business.process.id"/></th>
                  <th><fmt:message key="data.horizon.dw.model.business.process.name"/></th>
                  <th><fmt:message key="data.horizon.dw.model.business.process.details"/></th>
                  <th><fmt:message key="data.horizon.dw.model.business.process.charge.person"/></th>
                  <th ><fmt:message key="data.horizon.dw.model.business.process.twiki.link"/></th>
                  <th><fmt:message key="data.horizon.dw.model.business.process.updatetime"/></th>
                  <th><fmt:message key="data.horizon.resource.server.general.info.operation"/></th>
                  <th style="display:none"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ businessProcessList }" var="businessProcess">
                  <tr>
                    <td class="row_detail_edit"
                        data-target="#row_detail_business_id">${ businessProcess.business_process_id }</td>
                    <td class="row_detail row_detail_edit"
                        data-target="#row_detail_business_name">${ businessProcess.business_process_name }</td>
                    <td class="row_detail_edit"
                        data-target="#row_detail_business_details">${ businessProcess.business_process_details }</td>
                    <td class="row_detail_edit"
                        data-target="#row_detail_business_chargeperson">${ businessProcess.business_charge_person }</td>
                    <td class="row_detail_edit"
                        data-target="#row_detail_business_link">${ businessProcess.business_link }</td>
                    <td name="update_time">
                      <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ businessProcess.update_time }"
                                      type="both"/>
                    </td>
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                           title="<fmt:message key="data.horizon.dw.model.business.process.edit"/>">
                          <i class='fa fa-edit'></i></a>
                        <button type="button" class="btn btn-default" id="delete_server" name="btn_business_del"
                                data-target="#business_row_delete"
                                href="<%= path %>/dw_model_new/${businessProcess.business_process_id}/delete"
                                title="<fmt:message key="data.horizon.dw.model.business.process.delete"/>">
                          <i class='fa fa-times-circle-o'></i>
                        </button>
                      </div>

                    </td>
                    <td class="row_detail" style="display:none" data-target="#row_detail_create_time">
                      <fmt:formatDate value="${ businessProcess.create_time }" pattern="yyyy-MM-dd HH:mm:ss"
                                      type="both"/>
                    </td>

                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>


  </aside>

</div>

<!---实现增加按钮--->
<div class="modal fade" id="business_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message
                key="data.horizon.dw.model.business.process.modal.title.add"/></h4>
      </div>
      <form id="business_add_form" action="<%= path %>/dw_model_new/business_process_add">
        <div class="modal-body">
          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.name"/></span>
              <input name="business_process_name" type="text" class="form-control" placeholder="business_process_name">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.details"/></span>
              <input name="business_process_details" type="text" class="form-control" placeholder="business_process_details">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.charge.person"/></span>
              <input name="business_charge_person" type="text" class="form-control" placeholder="business_charge_person">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.twiki.link"/></span>
              <input name="business_link" type="text" class="form-control" placeholder="twiki_link">
            </div>
          </div>


          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                    class="fa fa-times"></i><fmt:message key="data.horizon.form.action.close"/></button>
            <button id="submit_business_add" type="button" class="btn btn-primary pull-left"><i
                    class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
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
        <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message
                key="data.horizon.dw.model.business.process.modal.title.edit"/>
        </h4>
      </div>
      <form id="business_edit_form" action="<%= path %>/dw_model_new/\${id}/update">
        <div class="modal-body">

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.id"/></span>
              <input name="business_process_id" id="row_detail_business_id_edit" type="text" readonly="true"
                     class="form-control" placeholder="business_process_id">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.name"/></span>
              <input name="business_process_name" id="row_detail_business_name_edit" type="text" class="form-control"
                     placeholder="business_process_name">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.details"/></span>
              <input name="business_process_details" id="row_detail_business_details_edit" type="text" class="form-control"
                     placeholder="business_process_details">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.charge.person"/></span>
              <input name="business_charge_person" id="row_detail_business_chargeperson_edit" type="text" class="form-control"
                     placeholder="business_charge_person">
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.dw.model.business.process.twiki.link"/></span>
              <input name="business_link" id="row_detail_business_link_edit" type="text" class="form-control"
                     placeholder="business_link">
            </div>
          </div>

          <div class="modal-footer clearfix">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                    class="fa fa-times"></i><fmt:message key="data.horizon.form.action.close"/></button>
            <button id="submit_row_detail_edit" type="button" class="btn btn-primary pull-left"><i
                    class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
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

    var table = $('#business_process_List').DataTable({
      "bSort": true,
      "bAutoWidth": false,
      "sScrollX": "100%",
      "sScrollXInner": "100%",
      "aaSorting": [[0, 'desc']],
      "aoColumnDefs": [
        {"sWidth": "10%", "aTargets": [1]},
//        {"sWidth": "10%", "aTargets": [2]},
//        //{"sWidth": "20%", "aTargets": [4]},
//        {"sWidth": "5%", "aTargets": [3]},
//        {"sWidth": "10%", "aTargets": [5]},
        {"sWidth": "10%", "aTargets": [6]}
      ]
    });

 //点击添加按钮
    $('#submit_business_add').on("click", function () {

      $.ajax({
        cache: false,
        type: "POST",
        url: $("#business_add_form").attr("action"),
        data: $("#business_add_form").serialize(),

        async: false,
        success: function (data, textStatus) {
          if (textStatus = "success") {
            alert(data.msg);
            window.location.reload();
          }
        },
        error: function (XMLHttpRequest, textStatus) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        }
      })

    });

//点击编辑按钮

    $('#business_process_List tbody').on("click", "td a.row_detail_edit", function () {
      var tr = $(this).closest("tr");

      $.each(tr.children(".row_detail_edit"), function (num, td) {
        var targetElement = $($(td).attr("data-target") + "_edit");
        if (targetElement.is("input") || targetElement.is("textarea")) {
          targetElement.val($(td).text().trim());
        } else {
          targetElement.text($(td).text().trim());
        }
      });
      // 弹出编辑框
      $($(this).attr("data-target")).modal("toggle");
    });

    // 编辑提交按钮
    $('#submit_row_detail_edit').on('click', function () {
      $.ajax({
        cache: false,
        type: "POST",
        url: $("#business_edit_form").attr("action").replace("\${id}", $("#row_detail_business_id_edit").val()),
        data: $('#business_edit_form').serialize(),
        async: false,
        success: function (data, textStatus) {
          alert(data.msg);
          if (textStatus = "success") {
            window.location.reload();
          }
        },
        error: function (XMLHttpRequest, textStatus) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        },
      });
    });

//实现删除按钮
    $('#business_process_List tbody').on('click', "td button[name='btn_business_del']", function () {
      var msg = "确定删除吗？请确认！";
      if (confirm(msg)==true){
        $.ajax({
          cache: false,
          type: "POST",
          url:$(this).attr("href"),
          async: true,
          success: function (data) {
            alert(data.msg);
            if(data.status) {
              window.location.reload();
            }
          },
          error: function (request) {
            alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
          },
        })
        return true;
      }else{
        return false;
      }
    })







  })

</script>
</body>
</html>
