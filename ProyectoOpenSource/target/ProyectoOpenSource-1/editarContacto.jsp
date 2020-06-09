<%-- 
    Document   : agregarContacto
    Created on : 7 jun. 2020, 1:14:12 p. m.
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <title>Agenda - Agregar contactos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    </head>

    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logeado") == "0" || sesion.getAttribute("logeado") == null) {
                response.sendRedirect("index.jsp");
            }
            Connection con = null;
            Statement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/agendajava?user=root");
            st = con.createStatement();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Agenda web
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link" href="perfilUsuario.jsp">Perfil</a>
                    <a class="nav-item nav-link" href="indexUsuario.jsp">Lista de contactos</a>
                    <a class="nav-item nav-link active" href="#">Modificar contacto</a>
                    <a class="nav-item nav-link" href="logout.jsp">Cerrar sesión</a>
                </div>
            </div>
        </nav>
        <br>
        <form action="editarContacto.jsp" method="post">
            <div class="container">
                <h1>Modificar a <%=request.getParameter("NOMBRE")%></h1>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="NOMBRE">Nombres</label>
                        <input type="text" class="form-control" id="NOMBRE" name="NOMBRE" value="<%=request.getParameter("NOMBRE")%>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="APELLIDO">Apellidos</label>
                        <input type="text" class="form-control" id="APELLIDO"  value="<%=request.getParameter("APELLIDO")%>" name="APELLIDO" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="EMAIL">Correo Electronico</label>
                        <input type="email" class="form-control" id="EMAIL" name="EMAIL"  value="<%=request.getParameter("EMAIL")%>" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="NUMERO">Número telefonico</label>
                        <input type="text" class="form-control" id="NUMERO" name="NUMERO"  value="<%=request.getParameter("NUMERO")%>" required placeholder="809-123-4567">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="DIRECCION">Dirección</label>
                        <input type="text" class="form-control" id="DIRECCION" required  value="<%=request.getParameter("DIRECCION")%>>" name="DIRECCION"
                               placeholder="Calle 17 # 78 La Fe">
                    </div>
                </div>
                <input type="hidden" name="IDCONTACTO" value="<%=request.getParameter("ID_CONTACTO")%>">
                <a href="indexUsuario.jsp" class="btn btn-danger">Cancelar</a>
                <button type="submit" name="enviar" class="btn btn-dark">Modificar contacto</button>
            </div>
        </form>

        <%
            if (request.getParameter("enviar") != null) {
                String id = request.getParameter("IDCONTACTO");
                String nombre = request.getParameter("NOMBRE");
                String apellido = request.getParameter("APELLIDO");
                String email = request.getParameter("EMAIL");
                String numero = request.getParameter("NUMERO");
                String direccion = request.getParameter("DIRECCION");
                try {

                    st.executeUpdate("UPDATE `contactos` SET `NOMBRE` = '" + nombre + "', `APELLIDO` = '" + apellido + "', `EMAIL` = '" + email + "', `NUMERO` = '" + numero + "', `DIRECCION` = '" + direccion + "' WHERE `contactos`.`ID` ='" + id +"'");
                    response.sendRedirect("indexUsuario.jsp");

                } catch (Exception e) {
                    out.println(e);

                }
            }
        %>
    </body>

</html>