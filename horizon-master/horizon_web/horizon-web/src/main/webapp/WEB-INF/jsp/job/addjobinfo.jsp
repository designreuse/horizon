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
        <fmt:message key="data.horizon.job.jobinfo.title"/>
        <small><fmt:message key="data.horizon.job.jobinfo.title.small"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.job"/></a></li>
        <li class="active"><fmt:message key="data.horizon.job.jobinfo"/></li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box-body table-responsive" style="overflow-x:hidden">
            <form id="jobinfo_add_form" action="<%= path %>/jobinfo/save/">
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobgroup.name"/></span>
                  <input name="group_name" type="text" class="form-control" autocomplete="off"
                         placeholder="group_name" style="width: 40%">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.name"/></span>
                  <input name="name" type="text" class="form-control" autocomplete="off" placeholder="name"
                         style="width: 40%">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.manager"/></span>
                  <input name="manager" type="text" class="form-control" autocomplete="off" placeholder="manager"
                         style="width: 40%">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.frequency"/></span>
                  <input name="frequency" type="text" class="form-control" autocomplete="off" placeholder="frequency"
                         style="width: 40%">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.enable"/></span>
                  <select name="enable" class="form-control" style="width: 5%">
                    <option value="0">否</option>
                    <option value="1">是</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.desc"/></span>
                  <input name="desc" type="text" class="form-control" autocomplete="off" style="width: 40%">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <span class="input-group-addon"><fmt:message key="data.horizon.job.jobinfo.plugin"/></span>
                  <select id="plugin" name="plugin" class="form-control" style="width: 40%">
                    <option value="0" selected="selected">请选择插件类型</option>
                    <option value="1">SQOOP</option>
                    <option value="2">OTHER</option>
                    <option value="3">ERROR</option>
                  </select>
                </div>
              </div>
              <div id="plugin_detail">
              </div>
              <div style="width: 40%;">
                <button type="button" class="btn btn-danger pull-right"><i
                    class="fa fa-times"></i><fmt:message
                    key="data.horizon.form.action.close"/></button>
                <button id="submit_jobinfo_add" type="button" class="btn btn-primary pull-left"><i
                    class="fa fa-envelope"></i><fmt:message
                    key="data.horizon.form.action.submit"/></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </aside>
</div>


<div id="plugin_container" style="display: none">
  <div></div>
  <div id="sqoop">
    <div name="sqoop" style="border: 1px dashed #00F;width: 40%">
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
        <textarea name="sqp_command" type="text" class="form-control" style="height: 100px;"></textarea>
      </div>
      <div class="form-group">
        <span class="input-group-addon"><fmt:message key="data.horizon.job.sqoop.modal.info.hive_command"/></span>
        <textarea name="hive_command" type="text" class="form-control" style="height: 100px;"></textarea>
      </div>
    </div>
  </div>
  </br>
  <div id="other">
    <div name="other" style="border: 1px dashed #00F;width: 40%">
      OTHER
    </div>
  </div>
  <div id="error">
    <div name="error" style="border: 1px dashed #00F;width: 40%">
      ERROR
    </div>
  </div>
</div>


<script src="<%= path %>/js/jquery.min.js"></script>

<script type="text/javascript">
  $(document).ready(function () {

    if ($("#plugin option").length != $("#plugin_container>div").length) {
      alert("please add plugin div");
      return;
    }
    $("#plugin").on("change", function () {
      var id1 = $("#plugin option:selected").text().toLowerCase();
      var o2 = $("#plugin_detail [name]:first");
      var id2 = $(o2).attr("name");
      $("#" + id2).append(o2);
      $("#plugin_detail").append($("#" + id1 + " div:first"));
    });

    $("#submit_jobinfo_add").on("click", function () {
      $.ajax({
        async: true,
        cache: false,
        data: $("#jobinfo_add_form").serialize(),
        url: $("#jobinfo_add_form").attr("action") + $("#plugin option:selected").val(),
        success: function (data, textStatus) {
          if (textStatus = "success") {
            alert("Congratulation!Add Success!");
            window.close();
          }
        },
        error: function (XMLHttpRequest, textStatus) {
          alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
        }
      });
    });

    $("button.btn.btn-danger").on("click", function () {
      window.close();
    });
  })
</script>
</body>
</html>
