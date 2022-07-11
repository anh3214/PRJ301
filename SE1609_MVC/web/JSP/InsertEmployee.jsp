<%-- 
    Document   : InsertEmployee
    Created on : Mar 21, 2022, 9:46:27 PM
    Author     : ptuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <form action="EmployeeController" method="post">
                                <input type="hidden" name="go" value="insertEmployee">
                                <table>
                                    <tr>
                                        <td>Employee ID</td>
                                        <td>
                                            <input type="text" name ="emp_id">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>First Name</td>
                                        <td>
                                            <input type="text" name ="fname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Minit</td>
                                        <td>
                                            <input type="text" name ="minit">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td>
                                            <input type="text" name ="lname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="job_id">Job ID</label></td>
                                        <td>
                                            <select name="job_id" id="job_id">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Job LVL</td>
                                        <td>
                                            <input type="number" name ="job_lvl">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="pub_id">PubLisher</label></td>
                                        <td>
                                            <select name="pub_id" id="pub_id">
                                                <option value="0736">New Moon Books</option>
                                                <option value="0877">Binnet & Hardley</option>
                                                <option value="1389">Algodata Infosystems</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hire Date</td>
                                        <td>
                                            <input type="date" name ="hire_date">
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    <input type="submit" value="send" name="submit">
                                    <input type="reset" value="reset"> 
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
