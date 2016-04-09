<%--
  Created by IntelliJ IDEA.
  User: huangshiqian
  Date: 15/10/27
  Time: 下午3:42
  To change this template use File | Settings | File Templates.
--%>
<!-- Left side column. contains the logo and sidebar -->
<%@ include file="../common/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="left-side sidebar-offcanvas">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="<%=request.getContextPath() %>/img/avatar3.png" class="img-circle"
             alt="User Image"/>
      </div>
      <div class="pull-left info">
        <p>Hello, Jane</p>

        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>
    <!-- search form -->
    <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" id="menu_q" class="form-control" placeholder="Search..."/>
          <span class="input-group-btn">
            <button type='submit' name='seach' id='search-btn'
                    class="btn btn-flat"><i class="fa fa-search"></i></button>
          </span>
      </div>
    </form>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
      <%--<li id="">--%>
      <%--<a href="<%= path %>/db/general.html">--%>
      <%--<i class="fa fa-dashboard"></i> <span>数据库管理</span>--%>
      <%--</a>--%>
      <%--</li>--%>
      <li id="menu_resource" class="treeview">
        <a href="#">
          <i class="fa fa-laptop"></i>
          <span><fmt:message key="data.horizon.resource"/></span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_resource_db_general"><a href="<%= path %>/resource/db_general.html"><i
              class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.resource.db"/></a>
          </li>
          <li id="menu_resource_server_general"><a href="<%= path %>/resource1/server_general.html"><i
                  class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.resource.server"/></a>
          </li>

        </ul>
      </li>

      <li id="menu_job" class="treeview">
        <a href="#">
          <i class="fa fa-list-ul"></i>
          <span><fmt:message key="data.horizon.job"/></span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_job_sqooplist"><a href="<%= path %>/sqoop/list.do">
            <i class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.job.sqoop"/></a>
          </li>
        </ul>
      </li>

      <li id="menu_dw_model" class="treeview">
        <a href="#">
          <i class="fa fa-list-alt"></i>
          <span><fmt:message key="data.horizon.dw.model"/></span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_dw_model_physical_tbl"><a href="<%= path %>/dw_model/physical_tbl.html"><i
              class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.dw.model.physical.tbl"/></a>
          </li>
          <li id="menu_dw_model_physical_col"><a href="<%= path %>/dw_model/physical_col.html"><i
              class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.dw.model.physical.col"/></a>
          </li>
          <li id="menu_dw_model_business_process"><a href="<%= path %>/dw_model_new/business_process.html"><i
                  class="fa fa-angle-double-right"></i><fmt:message key="data.horizon.dw.model.business.process"/></a>
          </li>
        </ul>
      </li>
      <li id="menu_index">
        <a href="<%= path %>/index.html">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>
        </a>
      </li>
      <li id="menu_widgets">
        <a href="<%= path %>/widgets">
          <i class="fa fa-th"></i> <span>Widgets</span>
          <small class="badge pull-right bg-green">new</small>
        </a>
      </li>
      <li id="menu_charts" class="treeview">
        <a href="#">
          <i class="fa fa-bar-chart-o"></i>
          <span>Charts</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_charts_morris"><a href="<%= path %>/charts/morris.html"><i
              class="fa fa-angle-double-right"></i>
            Morris</a></li>
          <li id="menu_charts_flot"><a href="<%= path %>/charts/flot.html"><i
              class="fa fa-angle-double-right"></i> Flot</a>
          </li>
          <li id="menu_charts_inline"><a href="<%= path %>/charts/inline.html"><i
              class="fa fa-angle-double-right"></i>
            Inline charts</a></li>
        </ul>
      </li>
      <li id="menu_UI" class="treeview">
        <a href="#">
          <i class="fa fa-laptop"></i>
          <span>UI Elements</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_UI_general"><a href="<%= path %>/UI/general.html"><i
              class="fa fa-angle-double-right"></i> General</a></li>
          <li id="menu_UI_icons"><a href="<%= path %>/UI/icons.html"><i
              class="fa fa-angle-double-right"></i>
            Icons</a></li>
          <li id="menu_UI_buttons"><a href="<%= path %>/UI/buttons.html"><i
              class="fa fa-angle-double-right"></i>
            Buttons</a></li>
          <li id="menu_UI_sliders"><a href="<%= path %>/UI/sliders.html"><i
              class="fa fa-angle-double-right"></i>
            Sliders</a></li>
          <li id="menu_UI_timeline"><a href="<%= path %>/UI/timeline.html"><i
              class="fa fa-angle-double-right"></i>
            Timeline</a></li>
        </ul>
      </li>
      <li id="menu_forms" class="treeview">
        <a href="#">
          <i class="fa fa-edit"></i> <span>Forms</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_forms_general"><a href="<%= path %>/forms/general.html"><i
              class="fa fa-angle-double-right"></i>
            General Elements</a></li>
          <li id="menu_forms_advanced"><a href="<%= path %>/forms/advanced.html"><i
              class="fa fa-angle-double-right"></i>
            Advanced Elements</a></li>
          <li id="menu_forms_editors"><a href="<%= path %>/forms/editors.html"><i
              class="fa fa-angle-double-right"></i>
            Editors</a></li>
        </ul>
      </li>
      <li id="menu_tables" class="treeview">
        <a href="#">
          <i class="fa fa-table"></i> <span>Tables</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_tables_simple"><a href="<%= path %>/tables/simple.html"><i
              class="fa fa-angle-double-right"></i>
            Simple tables</a></li>
          <li id="menu_tables_data"><a href="<%= path %>/tables/data.html"><i
              class="fa fa-angle-double-right"></i> Data
            tables</a></li>
        </ul>
      </li>
      <li id="menu_calendar">
        <a href="<%= path %>/calendar.html">
          <i class="fa fa-calendar"></i> <span>Calendar</span>
          <small class="badge pull-right bg-red">3</small>
        </a>
      </li>
      <li id="menu_mailbox">
        <a href="<%= path %>/mailbox.html">
          <i class="fa fa-envelope"></i> <span>Mailbox</span>
          <small class="badge pull-right bg-yellow">12</small>
        </a>
      </li>
      <li id="menu_examples" class="treeview">
        <a href="#">
          <i class="fa fa-folder"></i> <span>Examples</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li id="menu_examples_invoice"><a href="<%= path %>/examples/invoice.html"><i
              class="fa fa-angle-double-right"></i>
            Invoice</a></li>
          <li id="menu_examples_login"><a href="<%= path %>/examples/login.html"><i
              class="fa fa-angle-double-right"></i>
            Login</a></li>
          <li id="menu_examples_register"><a href="<%= path %>/examples/register.html"><i
              class="fa fa-angle-double-right"></i> Register</a></li>
          <li id="menu_examples_lockscreen"><a href="<%= path %>/examples/lockscreen.html"><i
              class="fa fa-angle-double-right"></i> Lockscreen</a></li>
          <li id="menu_examples_404"><a href="<%= path %>/examples/404.html"><i
              class="fa fa-angle-double-right"></i> 404
            Error</a></li>
          <li id="menu_examples_500"><a href="<%= path %>/examples/500.html"><i
              class="fa fa-angle-double-right"></i> 500
            Error</a></li>
          <li id="menu_examples_blank"><a href="<%= path %>/examples/blank.html"><i
              class="fa fa-angle-double-right"></i>
            Blank Page</a></li>
        </ul>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>