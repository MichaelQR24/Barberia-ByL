package Users;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener los datos del formulario
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");

        // Acceso a datos
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.login(email, contraseña);

        if (usuario != null) {
            // Iniciar sesión: invalida cualquier sesión existente y crea una nueva
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // Redirige a zona segura del cliente
            response.sendRedirect(request.getContextPath() + "/Usuario/pages/index_user.jsp");
        } else {
            // Redirige al login con mensaje de error (opcionalmente podrías pasar ?error=1)
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=login");
        }
    }
}