<%--
  Created by IntelliJ IDEA.
  User: Magdalena
  Date: 2018-06-28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title style="text-align: center;">Dodawanie filmu</title>

</head>
<body>
<br>
<h1><div style="text-align: center;">Wrowadź dane</div></h1>
<div style="text-align: center;"><form method="post" action="addMovie">
    <input type="text" name="title" placeholder="Tytuł"><br>
    <input type="text" name="director" placeholder="Reżyser"><br>
    <input type="text" name="url" placeholder="URL"><br>
    <input type="text" name="year" placeholder="Rok produkcji"><br><br>
    <input type="submit" value="Dodaj">
</form></div>

<div style="text-align: center;"><form method="post" action="/index.jsp">
    <input type="submit" value="Wróć do strony głównej">
</form></div>
</body>
</html>
