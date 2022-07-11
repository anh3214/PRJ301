<%-- 
    Document   : UpdateTitle
    Created on : Feb 17, 2022, 2:52:31 PM
    Author     : ptuan
--%>

<%@page import="entity.employee"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("acc") == null) {
                response.sendRedirect("Login");
            } else {
                try {
                    employee emp4 = (employee) session.getAttribute("acc");
        %>
        <%
            ResultSet rsTitle = (ResultSet) request.getAttribute("rsTitle"),
                    rspush = (ResultSet) request.getAttribute("rsPublisher");
        %>
        <div class="site-wrap">
            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                <div class="panner"> 
                    <%@include file="/JSP/Client/ClientAdmin/Panner.jsp" %>
                </div>
            </div >
            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-md-3 order-1">
                            <%@include file="/JSP/Client/ClientAdmin/Menu.jsp" %>
                        </div>
                        <div class="col-md-9 order-2">
                            <h2> Update Title information</h2>
                            <%if (rsTitle.next()) {
                            %>
                            <form action="TitleController" method="post">
                                <input type="hidden" name="go" value="updateTitle">
                                <table>
                                    <tr>
                                        <td>Title ID</td>
                                        <td>
                                            <input type ="text" name="title_id" value="<%=rsTitle.getString(1)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Title
                                        </td>
                                        <td>
                                            <input type="text" name="title" value="<%=rsTitle.getString(2)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Type
                                        </td>
                                        <td>
                                            <input type="text" name="Type" value="<%=rsTitle.getString(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pubid">Publisher</label>
                                        </td>
                                        <td>
                                            <select name="pubid" id="pubid">
                                                <% while (rspush.next()) {
                                                        if (rspush.getString(1).equals(rsTitle.getString(4))) {
                                                %>
                                                <option value="<%=rspush.getString(1)%>" selected ><%=rspush.getString(2)%></option>
                                                <% } else {%>
                                                <option value="<%=rspush.getString(1)%>" ><%=rspush.getString(2)%></option>
                                                <%}
                                }%>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price</td>
                                        <td>
                                            <input type="number" name="Price" value="<%=rsTitle.getDouble(5)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Advance</td>
                                        <td>
                                            <input type="number" name="Advance" value="<%=rsTitle.getDouble(6)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Royalty</td>
                                        <td>
                                            <input type="number" name="Royalty" value="<%=rsTitle.getInt(7)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ytd_sales</td>
                                        <td>
                                            <input type="number" name="Ytd_sales" value="<%=rsTitle.getInt(8)%>" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Notes</td>
                                        <td>
                                            <textarea name="notes"><%=rsTitle.getString(9)%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>PubDate</td>
                                        <td>
                                            <input type="date" name="Pubdate" value="<%=rsTitle.getDate(10)%>" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Image</td>
                                        <td>
                                            <input type="file" name="image" value="<%=rsTitle.getString(11)%>" >
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    <input type="submit" value="update" name="submit">
                                    <input type="reset" value="clear">
                                </p>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%
            } catch (Exception e) {
                response.sendRedirect("Login");
            }
        }
    %>
</html>
