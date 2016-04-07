<%@ include file="common/style.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
  // 重定向到真正的首页
  response.sendRedirect(path + "/index");
%>
</html>