<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es"> 
<%
    // Obtener los datos enviados desde el formulario
    String nombre = request.getParameter("FirstName");
    String apellido = request.getParameter("LastName");
    String password = request.getParameter("password");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/solociencia";
    String username = "root";
    String passwordDB = "";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, username, passwordDB);

    // Check the request method
    String requestMethod = request.getMethod();

    if (requestMethod.equalsIgnoreCase("POST")) {
        PreparedStatement consultaP = con.prepareStatement("SELECT * FROM user WHERE FirstName=? AND LastName=? AND Password=?");
        consultaP.setString(1, nombre);
        consultaP.setString(2, apellido);
        consultaP.setString(3, password);

        ResultSet result = consultaP.executeQuery();

        if (result.next()) {
            //para almacenar la session
            String userID = result.getString("UserID");
            HttpSession sessions = request.getSession();
            sessions.setAttribute("userID", userID);

            out.print("inicio Correcto");
            response.sendRedirect("../index.html");
        } else {
            %>
            <head>
                <meta charset="ISO-8859-1">
                <title>INICIO ERROR</title>
            </head>
            <body>
                <section>
                    <h1>Error de inicio de sesión</h1>
                    <p>Las credenciales proporcionadas son incorrectas. Por favor, inténtalo nuevamente.</p>
                    <p><a href="../usuarioRegistro/registro.html">¿No tienes una cuenta? Regístrate aquí</a></p>
                </section>
            </body>
            </html>
            
         <% } 
    }else if (requestMethod.equalsIgnoreCase("GET")) {
    %>

        <!--Pagina de inicio donde el Usuario ingresa con su cuenta si ya existe, y puede ir a crearla-->
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>INICIO</title>
            <link rel="stylesheet" href="../../styles/auth.css" />
        </head>
        <body>
            <section class="container">
                <h1>Bienvenido a solociencia.com</h1>
                <p>Por favor introduce tus credenciales</p>
                <form action="./login.jsp" method="post">
                    <label for="FirstName">Nombre:</label>
                    <input type="text" id="FirstName" name="FirstName" required><br>
                
                    <label for="LastName">Apellido:</label>
                    <input type="text" id="LastName" name="LastName" required><br>

                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required><br>

                    <input type="submit" value="Iniciar sesión">
                </form>

                <p class="link">¿No tienes una cuenta? <a href="../usuarioRegistro/registro.html">Regístrate aquí</a></p>
            </section>
        </body>
        </html>
        
    <%
    }
    %>