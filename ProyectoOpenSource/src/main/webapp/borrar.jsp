<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
        <%
            Connection con = null;
            Statement st = null;
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/agendajava?user=root");
                st = con.createStatement();
                st.executeUpdate("DELETE FROM contactos where ID=" + request.getParameter("ID") + ";");
                request.getRequestDispatcher("indexUsuario.jsp").forward(request,response);
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
