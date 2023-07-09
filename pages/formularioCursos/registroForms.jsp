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
                PreparedStatement stmt = con.prepareStatement("INSERT INTO course_registry (UserID, CourseID, CourseDate, DisplayName, Cedula) VALUES (?, ?, ?, ?, ?)");
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
            response.sendRedirect("../index.html");
        } 
    } else {
        // User is not logged in, redirect to login
        response.sendRedirect("../login/login.jsp");
    }
%>