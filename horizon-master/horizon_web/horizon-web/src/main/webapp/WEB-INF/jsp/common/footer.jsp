<%--
  Created by IntelliJ IDEA.
  User: huangshiqian
  Date: 15/10/28
  Time: 下午1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<!-- jQuery 2.0.2 -->
<script src="<%= path %>/js/jquery.min.js"></script>
<!-- jQuery UI 1.10.3 -->
<script src="<%= path %>/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>

<!-- Bootstrap -->
<script src="<%= path %>/js/bootstrap.min.js" type="text/javascript"></script>

<!-- AdminLTE App -->
<%--<script src="<%= path %>/js/AdminLTE/app.js" type="text/javascript"></script>--%>
<script type="text/javascript">
  // 获取需要选中的菜单
  var module = '${module}';
  var view = '${view}';

  if($.trim(module) == '') {
    module = 'index';
  }

  $(document).ready(function () {
    // 选中导航栏
    $("#menu_" + module).attr('class', $("#menu_" + module).attr('class') + " active");

    //选中自模块
    if($.trim(module) != '') {
      $("#menu_" + module + "_" + view).attr('class', $("#menu_" + module + "_" + view).attr('class') + " active");
    }
  });
</script>
</html>
