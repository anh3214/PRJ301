<%-- 
    Document   : UpdateRoy
    Created on : Feb 17, 2022, 3:43:55 PM
    Author     : ptuan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <%
            String tiPage = (String) request.getAttribute("page");
            String tiTable = (String) request.getAttribute("table");
        %>
        <title><%=tiPage%></title>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("rsroy"),
                    rsTitle = (ResultSet) request.getAttribute("rs1");
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
                            <h2>Update Information</h2>
                            <%
                                if (rs.next()) {
                            %>
                            <form action="RoyschedController" method="post">
                                <input type="hidden" name="go" value="updateRoysched">
                                <table>
                                    <tr>
                                        <td>
                                            <label for="titleID">TitleID</label>
                                        </td>
                                        <td>
                                            <select name="titleID" id="titleID">
                                                <%while (rsTitle.next()) {
                                                        if (rs.getString(1).equals(rsTitle.getString(1))) {
                                                %>
                                                <option value="<%=rsTitle.getString(1)%>" selected ><%=rsTitle.getString(1)%></option>
                                                <%} else {%>
                                                <option value="<%=rsTitle.getString(1)%>"><%=rsTitle.getString(1)%></option>
                                                <%}
                                }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lorange</td>
                                        <td>
                                            <input type="number" name="Lorange" value="<%=rs.getString(2)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hirange</td>
                                        <td>
                                            <input type="number" name="Hirange" value="<%=rs.getString(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Royalty</td>
                                        <td>
                                            <input type="number" name="Royalty" value="<%=rs.getString(4)%>">
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    <input type="submit" value="update" name="submit">
                                    <input type="reset" value="reset">
                                </p>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
