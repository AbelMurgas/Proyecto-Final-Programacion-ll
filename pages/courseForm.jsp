<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    HttpSession sessions = request.getSession();
    String userID = (String) sessions.getAttribute("userID");

    // Check if the user is logged in
    if (userID != null) {
        // Determine the request method
        String requestMethod = request.getMethod();

        if (requestMethod.equalsIgnoreCase("POST")) {
            // Handle the POST request here
            String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("cedula");
            String courseID = request.getParameter("courseID");
            String fecha = request.getParameter("fecha");

            // Database connection details
            String url = "jdbc:mysql://localhost:3306/solociencia";
            String username = "root";
            String passwordDB = "";

            // Insert data into the courseregistry table
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, username, passwordDB);
                PreparedStatement stmt = con.prepareStatement("INSERT INTO courseregistry (UserID, CourseID, CourseDate, DisplayName, Cedula) VALUES (?, ?, ?, ?, ?)");
                stmt.setString(1, userID);
                stmt.setString(2, courseID);
                stmt.setString(3, fecha);
                stmt.setString(4, nombre);
                stmt.setString(5, cedula);
                stmt.executeUpdate();

                out.println("Registro exitoso.");
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Redirect to Home.jsp
            response.sendRedirect("Home.jsp");
        } else if (requestMethod.equalsIgnoreCase("GET")) {
            // Handle the GET request here
            String courseType = request.getParameter("courseType");
            if (courseType != null) {
                if (courseType.equalsIgnoreCase("cienciasnaturales")) {
                  out.println("CN");
                } else if (courseType.equalsIgnoreCase("quimicaybiologia")) {
                  out.println("QB");
                } else if (courseType.equalsIgnoreCase("programacion")) {
                  out.println("P");
                } else {
                  out.println("Registro exitoso.");
                }
            }
        }
    } else {
        // User is not logged in, redirect to Inicio.html
        response.sendRedirect("Inicio.html");
    }
%>