<%-- 
    Document   : InsertRoysched
    Created on : Mar 21, 2022, 9:51:13 PM
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
                            <form action="RoyschedController" method="post">
                                <input type="hidden" name="go" value="insertRoyshed">
                                <table>
                                    <tr>
                                        <td>
                                            <label for="titleID">TitleID</label>
                                        </td>
                                        <td>
                                            <select name="titleID" id="titleID">
                                                <option value="BU1032">The Busy Executive's Database Guide</option>
                                                <option value="BU1111">Cooking with Computers: Surreptitious Balance Sheets</option>
                                                <option value="BU2075">You Can Combat Computer Stress!</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lorange</td>
                                        <td>
                                            <input type="number" name="Lorange">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hirange</td>
                                        <td>
                                            <input type="number" name="Hirange">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Royalty</td>
                                        <td>
                                            <input type="number" name="Royalty">
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
