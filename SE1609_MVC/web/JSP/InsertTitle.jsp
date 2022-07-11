<%-- 
    Document   : InsertTitle
    Created on : Mar 16, 2022, 2:44:38 PM
    Author     : ptuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                            <form action="TitleController" method="post">
                                <input type="hidden" name="go" value="insertTile">
                                <table>
                                    <tr>
                                        <td>Title ID</td>
                                        <td>
                                            <input type ="text" name="title_id">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Title
                                        </td>
                                        <td>
                                            <input type="text" name="title">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Type
                                        </td>
                                        <td>
                                            <input type="text" name="Type">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pubid">Publisher</label>
                                        </td>
                                        <td>
                                            <select name="pubid" id="pubid">
                                                <option value="0736"> New Moon Books </option>
                                                <option value="0877"> Binnet & Hardley </option>
                                                <option value="1389"> Algodata Infosystems </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price</td>
                                        <td>
                                            <input type="number" name="Price">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Advance</td>
                                        <td>
                                            <input type="number" name="Advance">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Royalty</td>
                                        <td>
                                            <input type="number" name="Royalty">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ytd_sales</td>
                                        <td>
                                            <input type="number" name="Ytd_sales">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Notes</td>
                                        <td>
                                            <textarea name="notes"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>PubDate</td>
                                        <td>
                                            <input type="date" name="Pubdate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Image</td>
                                        <td>
                                            <input type="file" name="image">
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    <input type="submit" value="send" name="submit">
                                    <input type="reset" value="clear">
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
