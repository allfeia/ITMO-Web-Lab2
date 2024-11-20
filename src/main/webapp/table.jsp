<%@ page import="resources.Result" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: alyssanabokova
  Date: 15.11.2024
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Лаба №2</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<h1 class="results">Results</h1>

<div class="table">
  <table id="resultsTable" border="1">
    <tr>
      <th><h2 class="headerOfTable">X</h2></th>
      <th><h2 class="headerOfTable">Y</h2></th>
      <th><h2 class="headerOfTable">R</h2></th>
      <th><h2 class="headerOfTable">Response</h2></th>
      <th><h2 class="headerOfTable">Execution time (nsec)</h2></th>
      <th><h2 class="headerOfTable">Current time</h2></th>
    </tr>
  </table>
</div>

</body>
</html>
