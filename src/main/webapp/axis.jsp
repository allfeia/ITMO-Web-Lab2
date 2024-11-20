<%--
  Created by IntelliJ IDEA.
  User: alyssanabokova
  Date: 15.11.2024
  Time: 23:02
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
<section class="block plot-section">
  <div class="axis">
    <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg" id="axis-svg">
      <!-- ось x -->
      <line x1="0" x2="300" y1="150" y2="150" stroke="white"></line>
      <!-- ось y -->
      <line x1="150" x2="150" y1="0" y2="300" stroke="white"></line>

      <polygon fill="white" points="150,0 144,15 156,15" stroke="white"></polygon>
      <polygon fill="white" points="300,150 285,156 285,144" stroke="white"></polygon>

      <!-- засечки -->

      <!-- +x: R/2 -->
      <line stroke="white" x1="200" x2="200" y1="155" y2="145"></line>
      <!-- R -->
      <line stroke="white" x1="250" x2="250" y1="155" y2="145"></line>

      <!-- -x: -R -->
      <line stroke="white" x1="50" x2="50" y1="155" y2="145"></line>
      <!-- -R/2 -->
      <line stroke="white" x1="100" x2="100" y1="155" y2="145"></line>

      <!-- +y: R/2 -->
      <line stroke="white" x1="145" x2="155" y1="100" y2="100"></line>
      <!-- R -->
      <line stroke="white" x1="145" x2="155" y1="50" y2="50"></line>

      <!-- -y: -R/2 -->
      <line stroke="white" x1="145" x2="155" y1="200" y2="200"></line>
      <!-- R -->
      <line stroke="white" x1="145" x2="155" y1="250" y2="250"></line>

      <!-- подписи к засечкам    -->
      <text fill="white" x="195" y="140">R/2</text>
      <text fill="white" x="248" y="140">R</text>

      <text fill="white" x="40" y="140">-R</text>
      <text fill="white" x="90" y="140">-R/2</text>

      <text fill="white" x="160" y="105">R/2</text>
      <text fill="white" x="160" y="55">R</text>

      <text fill="white" x="160" y="205">-R/2</text>
      <text fill="white" x="160" y="255">-R</text>

      <text fill="white" x="160" y="10">Y</text>
      <text fill="white" x="290" y="140">X</text>

      <!-- прямоугольник слева вверху -->
      <rect x="100" y="50" width="50" height="100" fill="white" fill-opacity="0.2" stroke="white" id="rect">
      </rect>
      <!-- треугольник справа вверху -->
      <polygon fill="white" fill-opacity="0.2" points="150,150 200,150 150, 50" stroke="white">
      </polygon>
      <!-- полукруг слева снизу -->
      <path d="M 50 150 A 100, 100, 0, 0, 0, 150 250 L 150 150 Z" fill-opacity="0.2" fill="white"
            stroke="white"></path>
    </svg>
    <div class='coordinates' id='coordinates'></div>
  </div>
</section>
</body>
</html>
