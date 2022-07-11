<%-- 
    Document   : CheckThongtin
    Created on : Mar 22, 2022, 5:32:12 PM
    Author     : ptuan
--%>

<%@page import="entity.stores"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <%
            Vector<Cart> cart = (Vector<Cart>) request.getAttribute("listT");
            double sum = 0;
            stores stod = (stores) request.getAttribute("sto");
            double total = 0;
        %>
        <title>CheckThongTin</title>
    </head>
    <body>
        <h3 style="text-align: center">Shopping Cart Details</h3>
        <div class="site-wrap">
            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="site-blocks-table">
                            <a href="Home"><input type="submit" value="Home"></a>
                            <h2><%=stod.getUserName()%></h2>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Vector<String> listkey = new Vector<String>();
                                        for (Cart tiltes : cart) {
                                            sum += tiltes.getQty() * tiltes.getPrice();
                                            total += sum;
                                            listkey.add(tiltes.getTitle_id());
                                    %>
                                    <tr>
                                        <td><%=tiltes.getTitle_id()%></td>
                                        <td><%=tiltes.getTitle()%></td>
                                        <td>
                                            <form action="CartController" method="POST">
                                                <input type="number" name="quantity" onchange="this.parentNode.submit()" value="<%= tiltes.getQty()%>" disabled>
                                                <input hidden="" name="titleID" value="<%=tiltes.getTitle_id()%>">
                                                <input hidden="" name="go" value="updateQty">
                                            </form>
                                        </td>
                                        <td>
                                            <%=tiltes.getPrice()%>$
                                        </td>
                                        <td>
                                            <%=sum%>$
                                        </td>
                                        <td>
                                            <a style="text-decoration: none" href="CartController?go=remove&key=<%=tiltes.getTitle_id()%>">Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                        } session.setAttribute("listKey", listkey);
                                    %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4">Total</th>
                                        <td><input id="sum" value="<%=total%>$" disabled style="border:none"></td>
                                        <td><a  style="text-decoration: none" href="CartController?go=removeAll">Remove All</a></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
            <form method="POST" action="CartController">
                <input hidden name="go" value="checkout">
                <input type="submit" value="Comfirm">
            </form>
        </div>
    </body>
</html>
