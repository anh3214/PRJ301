<%-- 
    Document   : UpdateDiscounts
    Created on : Feb 17, 2022, 3:44:58 PM
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
            String TitPage = (String) request.getAttribute("page");
            String TitTable = (String) request.getAttribute("table");
        %>
        <title><%=TitPage%></title>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("rs"),
                    rsStores = (ResultSet) request.getAttribute("rsStores");
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
                            <form action="DiscountsController" method="post">
                                <input type="hidden" name="go" value="updateDicount">
                                <table>
                                    <tr>
                                        <td>Discounttype</td>
                                        <td>
                                            <input type="text" name="discounttype" value="<%=rs.getString(1)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="stor_id">Stores</label></td>
                                        <td>
                                            <select name="stor_id" id="stor_id">
                                                <%
                                                    while (rsStores.next()) {
                                                        if (rsStores.getString(1).equals(rs.getString(2))) {
                                                %>
                                                <option value="<%=rsStores.getString(1)%>" selected ><%=rsStores.getString(2)%></option>
                                                <%} else {%>
                                                <option value="<%=rsStores.getString(1)%>"><%=rsStores.getString(2)%></option>
                                                <%}
                                }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Low Quantity</td>
                                        <td>
                                            <input type="number" name ="lowqty" value="<%=rs.getString(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hight Quantity</td>
                                        <td>
                                            <input type="number" name ="hightqty" value="<%=rs.getString(4)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Dicount</td>
                                        <td>
                                            <input type="number" name="discount" value="<%=rs.getString(5)%>">
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
