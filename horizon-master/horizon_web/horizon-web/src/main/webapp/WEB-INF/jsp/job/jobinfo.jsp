<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>
    <fmt:message key="data.horizon.job.jobinfo.title"/>
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
        <small><fmt:message key="data.horizon.configuration"/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
        <li><a href="#"><fmt:message key="data.horizon.job"/></a></li>
        <li class="active"><fmt:message key="data.horizon.job.jobinfo"/></li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="box">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title"><fmt:message key="data.horizon.job.jobinfo.title.second"/></h3>
                <a class="btn btn-app btn-danger" href="addjobinfo.jsp" role="button" target="_blank"><i class="fa fa-plus-square-o"></i>增加</a>
              </div>
              <div class="box-body table-responsive" style="overflow-x:hidden">
                <table id="joblist" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th style="display:none"></th>
                    <th><fmt:message key="data.horizon.job.jobgroup.name"/></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.name"/></th>
                    <th style="display:none"></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.running_status"/></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.plugin"/></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.start_time"/></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.end_time"/></th>
                    <th style="display:none"></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.enable"/> </th>
                    <th style="display:none"></th>
                    <th style="display:none"></th>
                    <th><fmt:message key="data.horizon.job.jobinfo.operation"/></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="jobinfo" items="${jobinfos}">
                    <tr>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_id_edit" style="display:none">${jobinfo.id}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_group_name_edit">${jobinfo.group_name}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_name_edit">${jobinfo.name}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_manager_edit" style="display: none">${jobinfo.manager}</td>
                      <td class="row_detail" data-target="#row_detail_job_running_status_edit">${jobinfo.running_status}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_plugin_edit">${jobinfo.plugin}</td>
                      <td class="row_detail" data-target="#row_detail_job_start_time_edit"><fmt:formatDate value="${jobinfo.start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      <td class="row_detail" data-target="#row_detail_job_end_time_edit"><fmt:formatDate value="${jobinfo.end_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_frequency_edit" style="display:none">${jobinfo.frequency}</td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_enable_edit">
                        <input type="hidden" value="${jobinfo.enable}"/>
                        <c:choose>
                          <c:when test="${jobinfo.enable eq 0}">
                            否
                          </c:when>
                          <c:when test="${jobinfo.enable eq 1}">
                            是
                          </c:when>
                          <c:otherwise>
                            ERROR
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="row_detail" data-target="#row_detail_job_last_modified_time_edit" style="display:none"><fmt:formatDate value="${jobinfo.last_modified_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      <td class="row_detail_edit" data-target="#row_detail_jobinfo_desc_edit" style="display:none">${jobinfo.desc}</td>
                      <td>
                        <div class="btn-group">
                          <a class="btn btn-default row_detail_edit" href="<%=path%>/jobinfo/edit" role="button" target="_blank"
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
  })
</script>
</body>
</html>