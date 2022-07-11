<%-- 
    Document   : DisplayDetail
    Created on : Feb 17, 2022, 4:30:57 PM
    Author     : ptuan
--%>

<%@page import="entity.employee"%>
<%@page import="entity.stores"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOstores"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="acss.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <%
        if (session.getAttribute("acc") == null) {
            response.sendRedirect("Login");
        } else {
            try {
                employee emp4 = (employee) session.getAttribute("acc");
    %>
    <script>
        function fun() {
            document.getElementById("status1").value = document.getElementById("dropbox").value;
        }
    </script>
    <body>
        <div class="site-wrap">
            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">

                        <%
                            ResultSet rs = (ResultSet) request.getAttribute("rsDetail"),
                                    rs1 = (ResultSet) request.getAttribute("status");
                            rs1.absolute(1);
                            int status = rs1.getInt(1);
                            String storID = (String) request.getAttribute("storid");
                            DAOstores dao = new DAOstores();
                            String storname = "";
                            Vector<stores> vec = dao.viewAll();
                            for (stores elem : vec) {
                                if (elem.getStor_id().equals(storID)) {
                                    storname = elem.getStor_name();
                                }
                            }
                            double Sum = 0;
                            String ordnum = "";
                        %>
                        <h2 style="text-align: center">Order detail</h2>
                        <p style="text-align: center; font-size: 30px;">StoreID: <%=storID%></p>
                        <p style="text-align: center; font-size: 30px;"> StoreName: <%=storname%></p>
                        <p style="text-align: center; font-size: 30px;">Status :
                            <select name="status" id="dropbox" onchange="fun()">
                                <option value="1"> wait  </option>
                                <option value="2"> Process </option>
                                <option value="3"> done  </option>
                            </select>
                        </p>
                        <div class="site-blocks-table">
                            <h2 style="text-align: center">Detail:</h2>
                            <%
                                if (rs.next()) {
                            %>
                            <form action="SalesController?go=updateStatus" method = "post">
                                <input type="hidden" value="1" id="status1" name="status" />
                                <input type="hidden" value="<%=storID%>" id="id" name="storID" /> 
                                <%
                                    ordnum = rs.getString(1);
                                %>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>OrderNum</th>
                                            <th>Title</th>
                                            <th>Quantity </th>
                                            <th>Price</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getInt(3)%></td>
                                            <td><%=rs.getDouble(4)%>$</td>
                                            <td><%=rs.getDouble(5)%>$</td>
                                            <%Sum += rs.getDouble(5);%>
                                        </tr>
                                    </tbody>
                                </table>
                                <p style="text-align: center">====>>>><b>Grand Total = <%=Sum%>$</p>
                                <input type="hidden" value="<%=ordnum%>" id="id" name="ordNum" /> 
                                <input type="submit" value="submit" name="submit"/>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        document.getElementById("dropbox").value =<%=status%>;
    </script>
    <%
            } catch (Exception e) {
                response.sendRedirect("Login");
            }
        }
    %>
</html>
</html>
