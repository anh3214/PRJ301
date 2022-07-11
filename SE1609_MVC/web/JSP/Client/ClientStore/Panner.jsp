<%-- 
    Document   : Panner
    Created on : Mar 6, 2022, 4:54:45 PM
    Author     : ptuan
--%>

<%@page import="entity.stores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="acss.css" />
        <%
            stores acc = (stores) session.getAttribute("accSto");
        %>
        <title>JSP Page</title>
    </head>
    <body>
       

            <div class="div_left">HE150124 Pham Tuan Anh</div>
            <%
                 if(acc != null){
            %>
            <div col-6 col-md-4 order-3 order-md-3 text-right> Wellcome: <%=acc.getUserName()%></div>
            <%}%>
            <div class="div_botomm">
                <%
                    if( acc == null){
                %>
                <a href="Login?go=login"><input type="submit" value="Login"></a>
                    <%}else{%>
                    <a href="Login?go=logout"><input type="submit" value="Logout"></a>
                    <%}%>
                <a href="CartController?go=showCart"><input type="submit" value="ShowCart"></a>
            </div> 
    </body>
</html>
