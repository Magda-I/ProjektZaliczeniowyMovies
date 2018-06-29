<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Magdalena
  Date: 2018-06-28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Baza filmów</title>
    <style>
        table {
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th {
            cursor: pointer;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }
    </style>
</head>

<%
    Object indexList = request.getAttribute("ids");
    List<Integer> ids = (List<Integer>) indexList;

    Object titlesList = request.getAttribute("titles");
    List<String> titles = (List<String>) titlesList;

    Object directorsList = request.getAttribute("directors");
    List<String> directors = (List<String>) directorsList;

    Object urlList = request.getAttribute("urls");
    List<String> urls = (List<String>) urlList;

    Object yearList = request.getAttribute("years");
    List<String> years = (List<String>) yearList;
%>

<div style="text-align: center;">
    <p><strong>Kliknij nagłówek aby posortować.</strong></p>
    <p>1. sortowanie rosnąco.</p>
    <p>2. sortowanie malejąco.</p>
</div>

<table id="table">
    <thead>
    <tr>
        <th onclick="sortTable(0)" scope="col">ID</th>
        <th onclick="sortTable(1)" scope="col">Title</th>
        <th onclick="sortTable(2)" scope="col">Director</th>
        <th onclick="sortTable(3)" scope="col">URL</th>
        <th onclick="sortTable(4)" scope="col">Year</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i = 0; i< titles.size(); i++){
    %>
    <tr>
        <td><%=ids.get(i)%></td>
        <td><%=titles.get(i)%></td>
        <td><%=directors.get(i)%></td>
        <%--<a href="http://url.pl">klik</a>--%>
        <td>
            <a href="<%=urls.get(i)%>"><%=urls.get(i)%></a>
        </td>
        <td><%=years.get(i)%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("table");
        switching = true;
        //Set the sorting direction to ascending:
        dir = "asc";
        /*Make a loop that will continue until
        no switching has been done:*/
        while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.getElementsByTagName("TR");
            /*Loop through all table rows (except the
            first, which contains table headers):*/
            for (i = 1; i < (rows.length - 1); i++) {
                //start by saying there should be no switching:
                shouldSwitch = false;
                /*Get the two elements you want to compare,
                one from current row and one from the next:*/
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /*check if the two rows should switch place,
                based on the direction, asc or desc:*/
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch= true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /*If a switch has been marked, make the switch
                and mark that a switch has been done:*/
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                //Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /*If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again.*/
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
<br>
<div style="text-align: center;"><form method="post" action="/index.jsp">
    <input type="submit" value="Wróć do strony głównej">
</form></div>

</html>