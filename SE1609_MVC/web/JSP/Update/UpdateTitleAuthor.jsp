<%-- 
    Document   : UpdateTitleAuthor
    Created on : Feb 17, 2022, 3:43:12 PM
    Author     : ptuan
--%>

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
            ResultSet rs = (ResultSet) request.getAttribute("rstitleAu"),
                    rsTitle = (ResultSet) request.getAttribute("rstitle"),
                    rsAuthor = (ResultSet) request.getAttribute("rsAuthor");
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
                            <form action="TitleAuthorController" method="post">
                                <input type="hidden" name="go" value="updateTitleAuthor">
                                <table>
                                    <tr>
                                        <td><label for="au_id">Author</label></td>
                                        <td>
                                            <select name="au_id" id="au_id">
                                                <%while (rsAuthor.next()) {

                                                %>
                                                <% if (rsAuthor.getString(1).equals(rs.getString(1))) {%>
                                                <option value="<%=rsAuthor.getString(1)%>" selected ><%=rsAuthor.getString(2)%></option>
                                                <%} else {%>
                                                <option value="<%=rsAuthor.getString(1)%>"><%=rsAuthor.getString(2)%></option>
                                                <%}%>
                                                <%}%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="tile_id">Title</label></td>
                                        <td>
                                            <select name="tile_id" id="tile_id">
                                                <%while (rsTitle.next()) {

                                                %>
                                                <%if (rsTitle.getString(1).equals(rs.getString(2))) {%>
                                                <option value="<%=rsTitle.getString(1)%>" selected><%=rsTitle.getString(2)%></option>
                                                <%} else {%>
                                                <option value="<%=rsTitle.getString(1)%>"><%=rsTitle.getString(2)%></option>
                                                <%}%>
                                                <%}%>              
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Author Order</td>
                                        <td>
                                            <input type="number" name ="au_ord" value="<%=rs.getInt(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Royal typer</td>
                                        <td>
                                            <input type="number" name ="royaltyper" value="<%=rs.getInt(4)%>">
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
