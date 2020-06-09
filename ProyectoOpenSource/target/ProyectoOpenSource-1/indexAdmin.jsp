<%-- 
    Document   : indexAdmin
    Created on : 7 jun. 2020, 1:15:51 p. m.
    Author     : usuario
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.beans.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel administrador</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    </head>

    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
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
                    <a class="nav-item nav-link active" href="#">Lista de contactos</a>
                    <a class="nav-item nav-link" href="agregarContacto.jsp">Agregar contacto</a>
                    <a class="nav-item nav-link" href="index.jsp">Cerrar sesión</a>
                </div>
            </div>
        </nav>
        <br>
        <div class="container">

            <form action="">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Email</th>
                            <th scope="col">Numero</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>
                                <button type="button" class="btn btn-warning">Modificar</button>
                                <button type="button" class="btn btn-danger">Borrar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>

    </body>

</html>