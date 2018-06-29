<%--
  Created by IntelliJ IDEA.
  User: Magdalena
  Date: 2018-06-28
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title style="text-align: center;">Filmy</title>
</head>
<body>
<br>
<div style="text-align: center;"><h1>Baza filmów</h1></div>
<br>
<div style="text-align: center;">
    <form method="post" action="add.jsp">
        <input type="submit" value="Dodaj film">
    </form>
</div>

<div style="text-align: center;">
    <form method="post" action="browse">
        <input type="submit" value="Przegladaj">
    </form>
</div>
</body>
</html>
