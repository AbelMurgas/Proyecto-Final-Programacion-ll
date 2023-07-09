<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Obtener la sesi�n actual
    HttpSession sessions = request.getSession(false);
    if (sessions != null) {
        // Cerrar la sesi�n
        sessions.invalidate();
    }

    // Redirigir al usuario a la p�gina de inicio
    response.sendRedirect("../index.html");
%>