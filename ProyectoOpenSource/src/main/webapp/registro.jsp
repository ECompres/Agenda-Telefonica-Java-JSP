<%-- 
    Document   : registro
    Created on : 7 jun. 2020, 1:12:39 p. m.
    Author     : usuario
--%>
<%@page import="Encriptacion.EncriptarMD5"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <title>Registrarse</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    </head>

    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logeado") == "1") {
                response.sendRedirect("indexUsuario.jsp");
            }
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
                    <a class="nav-item nav-link" href="index.jsp">Iniciar sesión</a>
                    <a class="nav-item nav-link active" href="#">Registrarse</a>
                </div>
            </div>
        </nav>

        <br>
        <form action="registro.jsp" method="post">
            <div class="container">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="NAME">Nombres: </label>
                        <input type="text" class="form-control" id="NAME" required name="NAME" placeholder="Mario Luis">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="LASTNAME">Apellidos: </label>
                        <input type="text" class="form-control" id="LASTNAME" required name="LASTNAME" placeholder="Perez Rodriguez">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="EMAIL">Correo Electronico:</label>
                        <input type="email" class="form-control" id="EMAIL" required name="EMAIL" placeholder="ejemplo@prueba.com">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="PASSWORD">Contraseña: </label>
                        <input type="text" class="form-control" id="PASSWORD" required name="PASSWORD" placeholder="">
                    </div>
                </div>
                <button type="submit" name="enviar" class="btn btn-dark">Registrarse</button>
            </div>
        </form>
        <%
            if (request.getParameter("enviar") != null) {

                String name = request.getParameter("NAME");
                String lastname = request.getParameter("LASTNAME");
                String email = request.getParameter("EMAIL");
                String password = request.getParameter("PASSWORD");
                int userType = 1;
                try {
                    EncriptarMD5 enc = new EncriptarMD5();
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/agendajava?user=root");
                    st = con.createStatement();
                    st.executeUpdate("INSERT INTO usuarios(NAME,LASTNAME,EMAIL,PASSWORD,USER_TYPE) VALUES('" + name + "','" + lastname + "','" + email + "','" + enc.getMD5(password) + "','" + userType + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } catch (Exception e) {
                    out.println(e);

                }
            }
        %>
    </body>

</html>