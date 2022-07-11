<%-- 
    Document   : DisplayAuthor
    Created on : Feb 10, 2022, 4:06:46 PM
    Author     : ptuan
--%>

<%@page import="java.util.Vector"%>
<%@page import="model.DAOauthors,entity.authors,controller.AuthorsController"%>
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
        <link rel="stylesheet" href="acss.css" />
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
                                Vector<authors> vector = (Vector<authors>) request.getAttribute("list");
                                String titleTable = (String) request.getAttribute("titleTabale");
                            %>
                            <div>
                                <form action="AuthorsController">
                                    <p>Search <input type="text" name="pname" value="" />
                                        <input type="submit" value="search" name="submit"/>
                                        <button> <a href="AuthorsController?go=insertAuthors"> Insert </a> </button> </P>
                                </form>
                            </div>
                            <%
                                String msg = (String) request.getAttribute("true1");
                                String msgF = (String) request.getAttribute("fales");
                                if (msg != null) {
                            %>
                            <p><%=msg%></p>
                            <%}
                                if (msgF != null) {
                            %>
                            <p><%=msgF%></p>
                            <%}%>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Authors ID</th>
                                        <th>Au_Lname</th>
                                        <th>Au_Fname</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Zip</th>
                                        <th>Contract</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%            for (authors elem : vector) {
                                    %>
                                    <tr>
                                        <td><%=elem.getAu_id()%></td>
                                        <td><%=elem.getAu_lname()%></td>
                                        <td><%=elem.getAu_fname()%></td>
                                        <td><%=elem.getPhone()%></td>
                                        <td><%=elem.getAddress()%></td>
                                        <td><%=elem.getCity()%></td>
                                        <td><%=elem.getState()%></td>
                                        <td><%=elem.getZip()%></td>
                                        <td><%=elem.getContract()%></td>
                                        <td><a href="AuthorsController?go=updateAuthor&au_id=<%=elem.getAu_id()%>"> Update</td>
                                        <td><a href="AuthorsController?go=deleteAuthor&au_id=<%=elem.getAu_id()%>"> Delete</td>
                                        <%}%>
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
