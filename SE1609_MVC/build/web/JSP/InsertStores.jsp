<%-- 
    Document   : InsertStores
    Created on : Mar 21, 2022, 9:52:02 PM
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
                            <form action="StoresController" method="post">
                                <input type="hidden" name="go" value="insertStore">
                                <table>
                                    <tr>
                                        <td>Stor ID</td>
                                        <td>
                                            <input type="text" name = "stor_id">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Store Name</td>
                                        <td>
                                            <input type="text" name = "stor_name">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Store Address</td>
                                        <td>
                                            <input type="text" name = "stor_address">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input type="text" name="city">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <input type="text" name = "state">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Zip</td>
                                        <td>
                                            <input type="text" name ="zip">
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
