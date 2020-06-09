<%-- 
    Document   : logout
    Created on : 8 jun. 2020, 3:47:46 p. m.
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
