package Users;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "svAdministrador", urlPatterns = {"/svAdministrador"})
public class svAdministrador extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("username");
        String contrasena = request.getParameter("password");

        try {
            // Usamos la clase Conexion para conectarnos a Azure
            Conexion conexion = new Conexion();
            Connection conn = conexion.conecta();

            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM Administrador WHERE usuario = ? AND contrasena = ?"
            );
            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Credenciales válidas
                HttpSession session = request.getSession();
                session.setAttribute("username", usuario);
                response.sendRedirect(request.getContextPath() + "/Administrador/pages/citas.jsp");
            } else {
                // Credenciales inválidas
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=invalid");
            }

            // Cierre de recursos
            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().write("Este servlet solo admite POST para iniciar sesión.");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para inicio de sesión de administradores.";
    }
}