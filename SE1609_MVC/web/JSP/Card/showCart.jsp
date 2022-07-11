<%-- 
    Document   : showCart.jsp
    Created on : Feb 24, 2022, 3:59:38 PM
    Author     : ptuan
--%>

<%@page import="entity.stores"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Cart"%>
<%@page import="entity.tiltes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="text-align: center">Shopping Cart Details</h3>
        <div class="site-wrap">
            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <div class="site-blocks-table">
                            <a href="Home"><input type="submit" value="Home"></a>
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
                                        java.util.Enumeration em = session.getAttributeNames();
                                        double sum = 0, total = 0;
                                        int i = 0;
                                        Vector<String> listkey = new Vector<String>();
                                        while (em.hasMoreElements()) {
                                            i++;
                                            String key = em.nextElement().toString();
                                            try {
                                                Cart tiltes = (Cart) session.getAttribute(key);
                                                sum = tiltes.getQty() * tiltes.getPrice();
                                                listkey.add(key);
                                                total += sum;
                                    %>
                                    <tr>
                                        <td><%=tiltes.getTitle_id()%></td>
                                        <td><%=tiltes.getTitle()%></td>
                                        <td>
                                            <form action="CartController" method="POST">
                                                <input type="number" name="quantity" onchange="this.parentNode.submit()" value="<%= tiltes.getQty()%>">
                                                <input hidden="" name="titleID" value="<%=key%>">
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
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        }
                                        session.setAttribute("listKey", listkey);
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
                <input hidden name="go" value="checthongtin">
                <input type="submit" value="Check Out">
            </form>
        </div>
    </body>
</html>
