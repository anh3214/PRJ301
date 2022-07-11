<%-- 
    Document   : InsertAuthors
    Created on : Mar 21, 2022, 9:39:23 PM
    Author     : ptuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                            <form action="AuthorsController" method="post">
                                <input type="hidden" name="go" value="insertAuthors">
                                <table>
                                    <tr>
                                        <td>Author ID</td>
                                        <td>
                                            <input type="text" name = "au_id">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td>
                                            <input type="text" name ="au_lname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>First Name</td>
                                        <td>
                                            <input type="text" name="au_fname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td>
                                            <input type="text" name ="phone">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td>
                                            <input type="text" name ="address">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input type="text" name ="city">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <input type="text" name ="state">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Zip</td>
                                        <td>
                                            <input type="text" name ="zip">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Contract</td>
                                        <td>
                                            <input type="radio" name ="contract" value="0"> 0
                                            <input type="radio" name ="contract" value ="1"> 1
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
