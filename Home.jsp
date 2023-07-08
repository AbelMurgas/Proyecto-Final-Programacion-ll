<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%-- Obtener la sesi�n actual --%>
    <% HttpSession sessions = request.getSession(false); %>

    <%-- Comprobar si la sesi�n y el atributo "userID" existen --%>
    <% if (sessions != null && session.getAttribute("userID") != null) { %>
        <%-- El UserID est� presente en la sesi�n --%>
        <h1>Bienvenido a la p�gina de inicio</h1>
        <%-- Acceder al UserID desde la sesi�n --%>
        <% String userID = (String) sessions.getAttribute("userID"); %>
        <%-- Mostrar el UserID --%>
        <p>Tu UserID: <%= userID %></p>
    <% } else { %>
        <%-- El UserID no est� presente en la sesi�n --%>
        <h1>No has iniciado sesi�n</h1>
        <p>Por favor, inicia sesi�n para acceder a esta p�gina.</p>
    <% } %>

    <p>Contenido de la p�gina de inicio...</p>
    
    
    <a href="Home.jsp">Home</a><br>
    <a href="formulario1.html">Registrarse en el Curso de Ciencias Naturales</a><br>
    <a href="formulario2.html">Registrarse en el Curso de Qu�mica y Biolog�a </a><br>
    <a href="formulario3.html">Registrarse en el Curso de programaci�n</a><br>
    <a href="referencia.html">Referencias</a><br>
    
    <a href="logout.jsp">Logout</a>
    
</body>
</html>