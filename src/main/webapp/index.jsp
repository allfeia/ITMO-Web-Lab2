<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" xmlns="">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лаба №2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="header">
    <h1>Набокова Алиса Владиславовна</h1>
    <h3>Группа: P3220</h3>
    <h3>Вариант: 1905</h3>
</div>

<div class="container">
    <div class="left-block id=axis">
        <jsp:include page="axis.jsp"/>
    </div>

    <div class="right-block">
        <jsp:include page="forms.jsp"/>
    </div>
</div>

<jsp:include page="table.jsp"/>

<script src="script.js"></script>
</body>
</html>
