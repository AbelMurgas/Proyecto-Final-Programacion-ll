<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Obtener la sesión actual
    HttpSession sessions = request.getSession(false);
    if (sessions != null) {
        // Cerrar la sesión
        sessions.invalidate();
    }

    // Redirigir al usuario a la página de inicio
    response.sendRedirect("Inicio.html");
%>