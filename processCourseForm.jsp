<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	HttpSession sessions = request.getSession();
	String userID = (String) sessions.getAttribute("userID");
	if(userID != null){
  // Sacar la info the la form
	  String nombre = request.getParameter("nombre");
	  String cedula = request.getParameter("cedula");
	  String courseID = request.getParameter("courseID");
	  String fecha = request.getParameter("fecha");
  
  
  //obtener datos de sesion actual
  
 
  
  // Database detalles
  String url = "jdbc:mysql://localhost:3306/solociencia";
  String username = "root";
  String passwordDB = "";

  // insertar data a tabla CourseRegistry
   
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

  // Redirgir to home.html
 response.sendRedirect("Home.jsp");
   }
   else{
	   response.sendRedirect("Inicio.html");
   }
%>