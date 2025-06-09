package Users;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="LogoutServlet", urlPatterns={"/logout"})
public class LogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recupera la sesión si existe
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Elimina atributos específicos si existen
            session.removeAttribute("usuario");
            session.removeAttribute("username");
            // Invalida toda la sesión
            session.invalidate();  
        }
        
        // Redirige al inicio
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
