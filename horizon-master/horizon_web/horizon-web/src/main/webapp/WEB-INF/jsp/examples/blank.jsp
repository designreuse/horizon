<%@ include file="../common/style.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminLTE | Dashboard</title>
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
        Blank page
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">


    </section>
    <!-- /.content -->
  </aside>
  <!-- /.right-side -->
</div>
<!-- ./wrapper -->

<!-- include js -->
<jsp:include page="../common/footer.jsp"/>
<script src="<%= path %>/js/AdminLTE/app.js" type="text/javascript"></script>
</body>
</html>