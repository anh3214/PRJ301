<%-- 
    Document   : DisplayStore
    Created on : Feb 10, 2022, 4:08:47 PM
    Author     : ptuan
--%>

<%@page import="java.util.Vector"%>
<%@page import="model.DAOstores,entity.stores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            if (session.getAttribute("acc") == null) {
                response.sendRedirect("Login");
            } else {
                try {
                    employee emp4 = (employee) session.getAttribute("acc");
        %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage = (String) request.getAttribute("titlepage");%>
        <title><%=titlepage%></title>
    </head>
    <body>
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
                            <%
                                Vector<stores> vector = (Vector<stores>) request.getAttribute("list");
                                String titleTable = (String) request.getAttribute("titleTabale");

                            %>
                            <div>
                                <form action="StoresController">
                                    <p>Search <input type="text" name="pname" value="" />
                                        <input type="submit" value="search" name="submit"/>
                                        <button> <a href="StoresController?go=insertStore"> Insert </a> </button> </P>
                                </form>
                            </div>
                            <%
                                String msg = (String) request.getAttribute("true1");
                                String msgF = (String) request.getAttribute("fales");
                                if(msg != null){
                            %>
                            <p><%=msg%></p>
                            <%} if(msgF != null){
                            %>
                            <p><%=msgF%></p>
                            <%}%>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>stor_id</th>
                                        <th>stor_name</th>
                                        <th>address</th>
                                        <th>city</th>
                                        <th>state</th>
                                        <th>zip</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                    for (stores elem : vector) {
                                    %>
                                    <tr>
                                        <td><%=elem.getStor_id()%></td>
                                        <td><%=elem.getStor_name()%></td>
                                        <td><%=elem.getStor_address()%></td>
                                        <td><%=elem.getCity()%></td>
                                        <td><%=elem.getState()%></td>
                                        <td><%=elem.getZip()%></td>
                                        <td><a href="StoresController?go=updateStore&stor_id=<%=elem.getStor_id()%>">Update</td>
                                        <td><a href="StoresController?go=deleteStore&stor_id=<%=elem.getStor_id()%>">Delete</td>

                                        <% } %>

                                    </tr>
                                </tbody>
                            </table>
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
