<%-- 
    Document   : Panner
    Created on : Mar 7, 2022, 2:35:37 PM
    Author     : ptuan
--%>

<%@page import="entity.employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            employee emp = (employee) session.getAttribute("acc");
        %>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container_swap">

            <div class="div_left">HE150124 Pham Tuan Anh</div>
            <%
                if (emp != null) {
            %>
            <div class="div_right"> Wellcome: Admin:<%=emp.getUsername()%></div>
            <%}%>
            <div class="div_botomm">
                <form action="Login" method="POST">
                    <%
                        if (emp == null) {
                    %>
                    <button type="submit" name="go" value="login">Login</button>
                    <%} else {%>
                    <button type="submit" name="go" value="logout">Logout</button>
                    <%}%>
                </form>
                 <a href="Home?go=homeA"> Home</a>
            </div>
        </div>
    </body>
</html>
