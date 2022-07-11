<%-- 
    Document   : DisplayJobs
    Created on : Feb 10, 2022, 4:08:00 PM
    Author     : ptuan
--%>

<%@page import="java.util.Vector"%>
<%@page import="model.DAOjobs,entity.jobs"%>
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
                                Vector<jobs> vector = (Vector<jobs>) request.getAttribute("list");
                                String titleTable = (String) request.getAttribute("titleTabale");

                            %>
                            <div>
                                <form action="JobsController">
                                    <p>Search <input type="text" name="pname" value="" />
                                        <input type="submit" value="search" name="submit"/>
                                        <button> <a href="JobsController?go=insertJobs"> Insert </a> </button> </P>
                                </form>
                            </div>
                            <%                                String msg = (String) request.getAttribute("true1");
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
                                <caption><%=titleTable%></caption>
                                <thead>
                                    <tr>
                                        <th>job_id</th>
                                        <th>job_desc</th>
                                        <th>min_lvl</th>
                                        <th>max_lvl</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                    for (jobs elem : vector) {
                                    %>
                                    <tr>
                                        <td><%=elem.getJob_id()%></td>
                                        <td><%=elem.getJob_desc()%></td>
                                        <td><%=elem.getMin_lv()%></td>
                                        <td><%=elem.getMax_lv()%></td>
                                        <td><a href="JobsController?go=updateJobs&jobsID=<%=elem.getJob_id()%>"> Update</td>
                                        <td><a href="JobsController?go=deleteJobs&jobsID=<%=elem.getJob_id()%>"> Delete</td>
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
