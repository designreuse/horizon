<%--
  Created by IntelliJ IDEA.
  User: haolijs
  Date: 2016/3/15
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="data.horizon.resource.server.general.title"/></title>
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
                <fmt:message key="data.horizon.resource.server.general.title"/>
                <small><fmt:message key="data.horizon.resource.server.general.title.small"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-laptop"></i><fmt:message key="data.horizon.home"/></a></li>
                <li><a href="#"><fmt:message key="data.horizon.resource"/></a></li>
                <li class="active"><fmt:message key="data.horizon.resource.server"/></li>
            </ol>
        </section>

        <section class="content">
           <div class="row">
            <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><fmt:message key="data.horizon.resource.server.general.title.second"/>
                    </h3>
                    <button id="add_server" type="button" data-toggle="modal" data-target="#server_add_modal"
                            class="btn btn-app ">
                        <i class="fa fa-plus-square-o"></i>
                        <fmt:message key="data.horizon.resource.server.general.info.add"/>
                    </button>
                </div>

                <div class="box-header">
                    <%--<input type="text" name="table" value="fdsafdsa"/>--%>
                </div>

                <div class="box-body table-responsive" style="overflow-x: hidden">
                    <table id="serverList" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th><fmt:message key="data.horizon.resource.server.general.info.id"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.name"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.ip"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.port"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.desc"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.enable"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.user.name"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.max.run.script"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.group.name"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.belong.people"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.updatetime"/></th>
                            <th><fmt:message key="data.horizon.resource.server.general.info.operation"/></th>
                            <th style="display:none"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ serverInfos }" var="serverInfo">
                            <tr>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_server_id">${ serverInfo.server_id }</td>
                                <td class="row_detail row_detail_edit"
                                    data-target="#row_detail_server_name">${ serverInfo.server_name }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_server_ip">${ serverInfo.server_ip }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_server_port">${ serverInfo.server_port }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_server_desc">${ serverInfo.server_desc }</td>

                                <td name="is_enable" class="row_detail_edit">
                                    <c:choose>
                                        <c:when test="${serverInfo.is_enable eq 0}">
                                            <fmt:message key="data.horizon.resource.server.general.info.enable"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:message key="data.horizon.resource.server.general.info.abandon"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_user_name">${ serverInfo.user_name }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_max_run_script">${ serverInfo.max_run_script }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_group_name">${ serverInfo.group_name }</td>
                                <td class="row_detail_edit"
                                    data-target="#row_detail_belong_people">${ serverInfo.belong_people }</td>
                                <td name="update_time">
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ serverInfo.update_time }"
                                                    type="both"/>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-default row_detail_edit" data-target="#row_detail_edit"
                                           title="<fmt:message key="data.horizon.resource.server.general.info.edit"/>">
                                            <i class='fa fa-edit'></i></a>
                                        <c:choose>
                                            <c:when test="${serverInfo.is_enable eq 0}">
                                                <button name="btn_db_status_control" type="button"
                                                        class="btn btn-default"
                                                        href="<%= path %>/resource1/server/${serverInfo.server_id}/status_control"
                                                        title="<fmt:message key="data.horizon.resource.server.general.info.abandon"/>"
                                                        >
                                                    <i class='fa fa-pause'></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button name="btn_db_status_control" type="button"
                                                        class="btn btn-default"
                                                        href="<%= path %>/resource1/server/${serverInfo.server_id}/status_control"
                                                        title="<fmt:message key="data.horizon.resource.server.general.info.enable"/>"
                                                        >
                                                    <i class='fa fa-play'></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                        <button type="button" class="btn btn-default" id="delete_server" name="btn_server_del"
                                                data-target="#server_row_delete"
                                                href="<%= path %>/resource1/${serverInfo.server_id}/delete"
                                                title="<fmt:message key="data.horizon.resource.server.general.info.delete"/>">
                                            <i class='fa fa-times-circle-o'></i>
                                        </button>
                                    </div>

                                </td>
                                <td class="row_detail" style="display:none" data-target="#row_detail_create_time">
                                    <fmt:formatDate value="${ serverInfo.create_time }" pattern="yyyy-MM-dd HH:mm:ss"
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


<!-- 添加 ADD ROW DETAIL COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="server_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message
                        key="data.horizon.resource.server.modal.title.add"/></h4>
            </div>
            <form id="server_add_form" action="<%= path %>/resource1/server_add">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.name"/></span>
                            <input name="server_name" type="text" class="form-control" placeholder="server_name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.ip"/></span>
                            <input name="server_ip" type="text" class="form-control" placeholder="server_ip">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.port"/></span>
                            <input name="server_port" type="text" class="form-control" placeholder="server_port">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.user.name"/></span>
                            <input name="user_name" type="text" class="form-control" placeholder="user_name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.desc"/></span>
                            <input name="server_desc" type="text" class="form-control" placeholder="server_desc">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.belong.people"/></span>
                            <input name="belong_people" type="text" class="form-control" placeholder="belong_people">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.max.run.script"/></span>
                            <input name="max_run_script" type="text" class="form-control" placeholder="max_run_script">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.general.info.group.name"/></span>
                            <input name="group_name" type="text" class="form-control" placeholder="group_name">
                        </div>
                    </div>

                    <div class="modal-footer clearfix">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                class="fa fa-times"></i><fmt:message key="data.horizon.form.action.close"/></button>
                        <button id="submit_server_add" type="button" class="btn btn-primary pull-left"><i
                                class="fa fa-envelope"></i><fmt:message key="data.horizon.form.action.submit"/></button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<!-- 添加 edit ROW DETAIL COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="row_detail_edit" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="fa fa-edit"></i><fmt:message
                        key="data.horizon.resource.server.modal.title.edit"/>
                </h4>
            </div>
            <form id="server_edit_form" action="<%= path %>/resource1/\${id}/update">
                <div class="modal-body">

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.id"/></span>
                            <input name="server_id" id="row_detail_server_id_edit" type="text" readonly="true"
                                   class="form-control" placeholder="server_id">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.name"/></span>
                            <input name="server_name" id="row_detail_server_name_edit" type="text" class="form-control"
                                   placeholder="server_name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.ip"/></span>
                            <input name="server_ip" id="row_detail_server_ip_edit" type="text" class="form-control"
                                   placeholder="server_ip">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.desc"/></span>
                            <input name="server_desc" id="row_detail_server_desc_edit" type="text" class="form-control"
                                   placeholder="server_desc">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.user.name"/></span>
                            <input name="user_name" id="row_detail_user_name_edit" type="text" class="form-control"
                                   placeholder="user_name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.port"/></span>
                            <input name="server_port" id="row_detail_server_port_edit" type="text" class="form-control"
                                   placeholder="server_port">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.max.run.script"/></span>
                            <input name="max_run_script" id="row_detail_max_run_script_edit" type="text" class="form-control"
                                   placeholder="server_port">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.group.name"/></span>
                            <input name="group_name" id="row_detail_group_name_edit" type="text" class="form-control"
                                   placeholder="server_port">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><fmt:message
                                    key="data.horizon.resource.server.modal.info.belong.people"/></span>
                            <input name="belong_people" id="row_detail_belong_people_edit" type="text" class="form-control"
                                   placeholder="server_port">
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
        // 初始化表格
        var table = $('#serverList').DataTable({
            "bSort": true,
            "bAutoWidth": false,
            "sScrollX": "100%",
            "sScrollXInner": "100%",
            "aaSorting": [[0, 'desc']]
        });

        $('#submit_server_add').on("click", function () {

            $.ajax({
                cache: false,
                type: "POST",
                url: $("#server_add_form").attr("action"),
                data: $("#server_add_form").serialize(),

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
        // 绑定click事件,添加每行修改数据的功能
        $('#serverList tbody').on("click", "td a.row_detail_edit", function () {
            var tr = $(this).closest("tr");
            // 查看详情,将隐藏的td中的值在弹出框中显示
            $.each(tr.children(".row_detail_edit"), function (num, td) {
                var targetElement = $($(td).attr("data-target") + "_edit");
                if (targetElement.is("input") || targetElement.is("textarea")) {
                    targetElement.val($(td).text().trim());
                } else {
                    targetElement.text($(td).text().trim());
                }
            });
            // 弹出详情框
            $($(this).attr("data-target")).modal("toggle");
        });

        // 点击提交按钮时提交修改页面,绑定click事件,添加修改数据的功能
        $('#submit_row_detail_edit').on('click', function () {
            $.ajax({
                cache: false,
                type: "POST",
                url: $("#server_edit_form").attr("action").replace("\${id}", $("#row_detail_server_id_edit").val()),
                data: $('#server_edit_form').serialize(),
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

        //    $("button[name='btn_db_status_control']").on('click'  //这个函数只能 应用于页面中展示的元素
        // 绑定click事件,添加启用禁用DB的功能
        $('#serverList tbody').on('click', "td button[name='btn_db_status_control']", function () {//可以应用到隐藏元素
            var icon = $(this).find("i");
            var td = $(this).closest('tr').children("[name='is_enable']");
            var update_time = $(this).closest('tr').children("[name='update_time']");
            var button = $(this);
            $.ajax({
                cache: false,
                type: "POST",
                url: $(this).attr("href"),
                async: true, // 异步发送请求
                error: function (request) {
                    alert('<fmt:message key="data.horizon.jquery.ajax.error"/>');
                },

                success: function (data) {
                    <%--alert(${ view });--%>
                    <%--alert(JSON.stringify(data));--%>
                    var action = '';
                    var status = '';

                    if(data.is_enable) {
                        action = "play";
                        status = '<fmt:message key="data.horizon.resource.server.general.info.abandon"/>';
                        button.attr("title", '<fmt:message key="data.horizon.resource.server.general.info.enable"/>');
                    } else {
                        action = "pause";
                        status = '<fmt:message key="data.horizon.resource.server.general.info.enable"/>';
                        button.attr("title", '<fmt:message key="data.horizon.resource.server.general.info.abandon"/>');
                    }

                    icon.attr("class", "fa fa-" + action);
                    td.text(status);
                    update_time.text('' + data.update_time);
                }


            });
        });


       //删除最终版
        $('#serverList tbody').on('click', "td button[name='btn_server_del']", function () {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg)==true){
                $.ajax({
                    cache: false,
                    type: "POST",
//                    url: $("#delete_server").attr("href").replace("\${id}", $("#row_detail_server_id_edit").val()),
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
