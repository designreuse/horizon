<%@ include file="../common/style.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>AdminLTE | 500 Error</title>
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
        500 Error Page
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">500 error</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="error-page">
        <h2 class="headline">500</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> Oops! Something went wrong.</h3>

          <p>
            We will work on fixing that right away.
            Meanwhile, you may <a href='<%= path %>/index.html'>return to dashboard</a> or try using the search
            form.
          </p>

          <form class='search-form'>
            <div class='input-group'>
              <input type="text" name="search" class='form-control' placeholder="Search"/>

              <div class="input-group-btn">
                <button type="submit" name="submit" class="btn btn-info"><i
                   class="fa fa-search"></i></button>
              </div>
            </div>
            <!-- /.input-group -->
          </form>
        </div>
      </div>
      <!-- /.error-page -->

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