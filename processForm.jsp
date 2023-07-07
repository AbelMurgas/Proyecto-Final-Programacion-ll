<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // sacar la info
  String nombre = request.getParameter("nombre");
  String apellido = request.getParameter("apellido");
  String edad = request.getParameter("edad");
  String password = request.getParameter("password");

  // Database connection details
  String url = "jdbc:mysql://localhost:3306/solociencia";
  String username = "root";
  String passwordDB = "";

  // Insertar a tabla UserRegistry
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, username, passwordDB);
    PreparedStatement stmt = con.prepareStatement("INSERT INTO userregistry (firstname, lastname, age, password) VALUES (?, ?, ?, ?)");
    stmt.setString(1, nombre);
    stmt.setString(2, apellido);
    stmt.setString(3, edad);
    stmt.setString(4, password);
    stmt.executeUpdate();

    out.println("Registro exitoso.");

    stmt.close();
    con.close();
  } catch (Exception e) {
    e.printStackTrace();
  }

  // Redirigir a home.html
  response.sendRedirect("Inicio.html");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Submitted</title>
</head>
<body>
    <h1>Form Submitted</h1>
    <p>Your form data has been successfully submitted.</p>
</body>
</html>
