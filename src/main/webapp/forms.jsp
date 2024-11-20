<%--
  Created by IntelliJ IDEA.
  User: alyssanabokova
  Date: 15.11.2024
  Time: 23:14
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

<h4>Enter the coordinate X</h4>
<div class="select">
    <select name="X" id="x-select">
        <option value="">--Please choose an option--</option>
        <option value="-4">-4</option>
        <option value="-3">-3</option>
        <option value="-2">-2</option>
        <option value="-1">-1</option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>

    </select>
</div>

<h4>Enter the coordinate Y</h4>
<div class="input">
    <input id="yInput" type="text" placeholder="-5...3" />
</div>

<h4>Enter the radius R</h4>
<div class="select">
    <select name="R" id="r-select">
        <option value="">--Please choose an option--</option>
        <option value="-3">-3</option>
        <option value="-2">-2</option>
        <option value="-1">-1</option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
</div>
<button id="submit" value="1">Check</button>
<div><label id="status"></label></div>

</body>
</html>
