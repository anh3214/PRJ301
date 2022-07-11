<%-- 
    Document   : UpdateEmployee
    Created on : Feb 17, 2022, 3:44:47 PM
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
            String page1 = (String) request.getAttribute("page");
            String ttable = (String) request.getAttribute("table");
        %>
        <title><%=page1%></title>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("rs"),
                    rsJobs = (ResultSet) request.getAttribute("rsjobs"),
                    rspubs = (ResultSet) request.getAttribute("rspub");
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
                            <form action="EmployeeController" method="post">
                                <input type="hidden" name="go" value="updateEmployee">
                                <table>
                                    <tr>
                                        <td>Employee ID</td>
                                        <td>
                                            <input type="text" name ="emp_id" value="<%=rs.getString(1)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>First Name</td>
                                        <td>
                                            <input type="text" name ="fname" value="<%=rs.getString(2)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Minit</td>
                                        <td>
                                            <input type="text" name ="minit" value="<%=rs.getString(3)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td>
                                            <input type="text" name ="lname" value="<%=rs.getString(4)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="job_id">Job ID</label></td>
                                        <td>
                                            <select name="job_id" id="job_id">
                                                <%
                                                    while (rsJobs.next()) {
                                                        if (rs.getString(5).equals(rsJobs.getString(1))) {
                                                %>
                                                <option value="<%=rsJobs.getString(1)%>" selected ><%=rsJobs.getString(1)%></option>
                                                <%} else {%>
                                                <option value="<%=rsJobs.getString(1)%>"><%=rsJobs.getString(1)%></option>
                                                <%}
                                }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Job LVL</td>
                                        <td>
                                            <input type="number" name ="job_lvl" value="<%=rs.getString(6)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="pub_id">PubLisher</label></td>
                                        <td>
                                            <select name="pub_id" id="pub_id">
                                                <%
                                                    while (rspubs.next()) {
                                                        if (rs.getString(7).equals(rspubs.getString(1))) {
                                                %>
                                                <option value="<%=rspubs.getString(1)%>" selected ><%=rspubs.getString(2)%></option>
                                                <%} else {%>
                                                <option value="<%=rspubs.getString(1)%>"><%=rspubs.getString(2)%></option>
                                                <%}
                                }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hire Date</td>
                                        <td>
                                            <input type="date" name ="hire_date" value="<%=rs.getDate(8)%>">
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
