<%-- 
    Document   : UpdatePublisher
    Created on : Feb 17, 2022, 3:44:08 PM
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
            String Tpage = (String) request.getAttribute("page");
            String Ttable = (String) request.getAttribute("table");
        %>
        <title><%=Tpage%></title>
    </head>
    <body>
        
        <%
            ResultSet rs = (ResultSet) request.getAttribute("rs");
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
                            <form action="PublishersController">
                                <input type="hidden" name="go" value="updatePublisher">
                                <table>
                                    <tr>
                                        <td>Publisher ID</td>
                                        <td>
                                            <input type="text" name = "pub_id" value="<%=rs.getString(1)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Publisher Name</td>
                                        <td>
                                            <input type="text" name="pub_name" value="<%=rs.getString(2)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input type="text" name="city" value="<%=rs.getString(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <input type="text" name ="state" value="<%=rs.getString(4)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Country</td>
                                        <td>
                                            <input type="text" name="country" value="<%=rs.getString(5)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Image</td>
                                        <td>
                                            <input type="file" name="image" value="<%=rs.getString(6)%>">
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
