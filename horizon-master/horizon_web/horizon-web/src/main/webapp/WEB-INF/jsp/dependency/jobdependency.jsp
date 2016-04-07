<%--
  Created by IntelliJ IDEA.
  User: huyang
  Date: 2016/1/13
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <script src="/horizon/js/raphael/raphael.js"></script>
</head>
<body style="background-color:#698B22">
<div id="canvas"></div>
<script type="text/javascript">
  var graph = "${graph}";
  var j = eval("("+graph+")");
  var nodes = j.nodes;
  var links = j.links;

  //每一层作业数量:下标对应层级,0表示根
  var categories = [];
  //最大作业数
  var maxNum = 0;
  for (var c in nodes) {
    var length = nodes[c].length;
    categories.push(length);
    if (maxNum < length) {
      maxNum = length;
    }
  }
  //深度
  var depth = categories.length;
  //矩形的宽
  var WIDTH = 350;
  //矩形的高
  var HEIGHT = 30;
  //距离屏幕左右两边的距离
  var H_MARGIN = 50;
  //START节点的宽
  var START_WIDTH = 100;
  //开始节点和第一层节点的水平间距
  var H_START_FIRST = 800;
  //矩形的水平间距
  var H_DISTANCE = 700;
  //距离屏幕上下两边的距离
  var V_MARGIN = 50;
  //矩形的垂直间距
  var V_DISTANCE = 30;
  //画布的宽
  var canvasWidth = 2 * H_MARGIN + START_WIDTH + H_START_FIRST + (depth-1)*WIDTH + (depth-2)*H_DISTANCE;
  //画布的高
  var canvasHeight = maxNum * HEIGHT + (maxNum - 1) * V_DISTANCE + 2 * V_MARGIN;
  //获取画布
  var paper = Raphael(document.getElementById("canvas"), canvasWidth, canvasHeight);
  //获取每层第一个矩形的左上顶点坐标
  var getFirstXYInCategory = function (category) {
    //顶点的横坐标和纵坐标
    var x0,y0;
    //第一层
    if(category == 0){
      x0 = H_MARGIN + START_WIDTH;
    }else{
      x0 = H_MARGIN + START_WIDTH + H_START_FIRST + (category-1) * (WIDTH + H_DISTANCE);
    }
    y0 = (canvasHeight - categories[category] * (HEIGHT + V_DISTANCE) + V_DISTANCE) / 2;
    return [x0, y0];
  };

  //设置矩形中展示的文字
  var setTextOnRect = function (rect, text) {
    var x0 = (rect.getBBox().x2 - rect.getBBox().x) / 2 + rect.getBBox().x;
    var y0 = (rect.getBBox().y2 - rect.getBBox().y) / 2 + rect.getBBox().y;
    paper.text(x0, y0, text).attr({"font-size": 10, "fill": "#B0E2FF"});
  };

  //计数器
  var counter = 0;
  //递归绘制矩形
  var drawRectangle = function (x, y, category) {
    var rect;
    if(category == 0){
      rect = paper.rect(x, y, START_WIDTH, HEIGHT);
    }else{
      rect = paper.rect(x, y, WIDTH, HEIGHT);
    }
    jobName = nodes[category][counter];
    //设置id
    rect.id = jobName;
    setTextOnRect(rect, jobName);
    counter++;
    if (counter < categories[category]) {
      drawRectangle(x, y + V_DISTANCE + HEIGHT, category);
    } else {
      counter = 0;
    }
  };

  //画箭头
  var drawArrow = function (parent, child) {
    var rect1 = paper.getById(parent);
    var rect2 = paper.getById(child);
    var start_x = rect1.getBBox().x2;
    var start_y = rect1.getBBox().y2 - HEIGHT / 2;
    var end_x = rect2.getBBox().x;
    var end_y = rect2.getBBox().y + HEIGHT / 2;
    var pathString = "M" + start_x + "," + start_y + "L" + end_x + "," + end_y;
    paper.path(pathString).attr({"arrow-end": "open", "stroke-width": 1.5});
  };

  //描绘节点
  for (var i=0;i<depth;i++){
    var coordinator = getFirstXYInCategory(i);
    var x0 = coordinator[0];
    var y0 = coordinator[1];
    drawRectangle(x0, y0, i);
  }
  //描绘关系
  for(var i=0;i<links.length;i++){
    var source = links[i][0];
    var target = links[i][1];
    drawArrow(source,target);
  }
</script>
</body>
</html>
