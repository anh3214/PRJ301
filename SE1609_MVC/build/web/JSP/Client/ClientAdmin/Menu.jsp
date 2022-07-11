<%-- 
    Document   : Menu
    Created on : Mar 7, 2022, 2:35:54 PM
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
         <table class="table table-bordered">
            <tbody>
                <tr>
                    <th> <a style="text-decoration: none" href="AuthorsController?go=listAllAuthors">Authors</th>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="DiscountsController?go=listAllDicsount"> Discount</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="EmployeeController?go=listAllEmployee"> Employee</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="JobsController?go=listAllJobs"> Jobs</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="PubInfoController?go=listAllPubInfo"> PubInfo</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="PublishersController?go=listAllPublisher"> Publisher</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="RoyschedController?go=listAllRoysched"> Roysched</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="SalesController?go=listAllSales"> Salse</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="StoresController?go=listAllStores"> Store</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="TitleAuthorController?go=listAllTitleAu"> TitleAuthor</td>
                </tr>
                <tr>
                    <td><a style="text-decoration: none" href="TitleController?go=listAllTitle"> Tile</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
