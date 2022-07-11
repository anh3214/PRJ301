<%-- 
    Document   : Menu
    Created on : Mar 6, 2022, 4:55:02 PM
    Author     : ptuan
--%>

<%@page import="java.util.Vector"%>
<%@page import="entity.publishers"%>
<%@page import="model.DAOpublishers"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOpublishers dao = new DAOpublishers();
            Vector<publishers> vector = dao.viewAll();
        %>
        <table class="table table-bordered">
            <tbody>
            <td><a style="text-decoration: none" href="TitleController?go=searchT">All</a></td>
                <%
                    for (publishers elem : vector) {
                %>
                <tr>
                    <td><a style="text-decoration: none" href="TitleController?go=searchT&&id=<%=elem.getPub_id()%>"><%=elem.getPub_name()%></a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
