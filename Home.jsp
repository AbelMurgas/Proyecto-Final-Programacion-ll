<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%-- Obtener la sesión actual --%>
    <% HttpSession sessions = request.getSession(false); %>

    <%-- Comprobar si la sesión y el atributo "userID" existen --%>
    <% if (sessions != null && session.getAttribute("userID") != null) { %>
        <%-- El UserID está presente en la sesión --%>
        <h1>Bienvenido a la página de inicio</h1>
        <%-- Acceder al UserID desde la sesión --%>
        <% String userID = (String) sessions.getAttribute("userID"); %>
        <%-- Mostrar el UserID --%>
        <p>Tu UserID: <%= userID %></p>
    <% } else { %>
        <%-- El UserID no está presente en la sesión --%>
        <h1>No has iniciado sesión</h1>
        <p>Por favor, inicia sesión para acceder a esta página.</p>
    <% } %>

    <p>Contenido de la página de inicio...</p>
    
    
    <a href="Home.jsp">Home</a><br>
    <a href="formulario1.html">Registrarse en el Curso de Ciencias Naturales</a><br>
    <a href="formulario2.html">Registrarse en el Curso de Química y Biología </a><br>
    <a href="formulario3.html">Registrarse en el Curso de programación</a><br>
    <a href="referencia.html">Referencias</a><br>
    
    <a href="logout.jsp">Logout</a>
    
</body>
</html>