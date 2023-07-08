<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
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
 
 
 PreparedStatement consultaP = con.prepareStatement("SELECT * FROM userregistry WHERE FirstName=? AND LastName=? AND Password=?");
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
     response.sendRedirect("Home.jsp");
 } else {

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INICIO</title>
</head>
<body>
    <h1>Error de inicio de sesión</h1>
    <p>Las credenciales proporcionadas son incorrectas. Por favor, inténtalo nuevamente.</p>
    <p><a href="registrousuario.html">¿No tienes una cuenta? Regístrate aquí</a></p>
</body>
</html>
<%
    }
%>