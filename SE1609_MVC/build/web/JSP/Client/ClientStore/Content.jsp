<%-- 
    Document   : Content
    Created on : Mar 6, 2022, 4:54:56 PM
    Author     : ptuan
--%>

<%@page import="model.DAOtiltes"%>
<%@page import="entity.tiltes"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
        <%
            Vector<tiltes> vecto = new Vector<tiltes>();
            if (request.getAttribute("listT") != null) {
                vecto = (Vector<tiltes>) request.getAttribute("listT");
            } else {
                DAOtiltes dao1 = new DAOtiltes();
                vecto = dao1.viewAllTiles();
            }
        %>
    </head>
    <body>
        <%if (vecto.size() > 0) {%>
        <table class="table table-bordered">
            <tbody>
                <%            for (tiltes elem : vecto) {

                %>
                <tr>
                    <td><img src="<%=elem.getImage()%>"></td>
                    <td><%=elem.getTitle()%></td>
                    <td><%=elem.getType()%></td>
                    <td><%=elem.getPrice()%>$</td>
                    <td><a style="text-decoration: none" href="CartController?go=addtoCart&titleId=<%=elem.getTitle_id()%>">Add</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%} else {%>
        <p>No product!</p>
        <%}%>
    </body>
</html>
