<%-- 
    Document   : Content
    Created on : Mar 6, 2022, 4:54:56 PM
    Author     : ptuan
--%>

<%@page import="entity.tiltes"%>
<%@page import="entity.sales"%>
<%@page import="model.DAOsales"%>
<%@page import="model.DAOtiltes"%>
<%@page import="entity.stores"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOstores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="acss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DAOsales dao3 = new DAOsales();
            Vector<sales> vector4 = new Vector<sales>();
            if (request.getAttribute("listSal") != null) {
                vector4 = (Vector<sales>) request.getAttribute("listSal");
            } else {
                vector4 = dao3.viewAll();
            }
            DAOtiltes dao4 = new DAOtiltes();
            DAOstores dao2 = new DAOstores();
            Vector<stores> vector3 = dao2.viewAll();
            Vector<tiltes> vector5 = dao4.viewAllTiles();
        %>
        <form action="SalesController" method="POST">
            <input type="hidden" name="go" value="searchStaus">
            <select name="status">
                <option value="1">wait</option>
                <option value="2">Process</option>
                <option value="3">Done</option>
            </select>
            <input type="submit" name="submit" value="submit">
        </form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Stor Name</th>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Totla</th>
                    <th>Status</th>
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
                <%
                    double price = 0;
                    String titleid = "";
                    for (sales elem : vector4) {
                %>
                <tr>
                    <td><%=elem.getOrd_num()%></td>
                    <%
                        for (stores em : vector3) {
                            if (elem.getStor_id().equals(em.getStor_id())) {
                    %>
                    <td><%=em.getStor_name()%></td>
                    <%}
                        }%>
                    <%
                        for (tiltes el : vector5) {
                            if (elem.getTitle_id().equals(el.getTitle_id())) {
                                price = el.getPrice();
                                titleid = el.getTitle_id();
                    %>
                    <td><%=el.getTitle()%></td>
                    <%}
                        }%>
                    <td><%=elem.getOrd_date()%></td>
                    <td><%=elem.getQty()%></td>
                    <td><%=price%>$</td>
                    <td><%=elem.getQty() * price%>$</td>
                    <%
                        if (elem.getStatus() == 1) {
                    %>
                    <td>Wait</td>
                    <%} else if (elem.getStatus() == 2) {%>
                    <td>Process</td>
                    <%} else {%>
                    <td>Done</td>
                    <%}%>
                    <td><a href="SalesController?go=viewdetail&storid=<%=elem.getStor_id()%>&ord=<%=elem.getOrd_num()%>&titlid=<%=titleid%>">Detail</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
