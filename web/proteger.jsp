<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // 🔒 Desactivar caché para evitar acceso con el botón "atrás"
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Obtener sesión sin crear nueva
    HttpSession sesion = request.getSession(false);

    // Variables de sesión
    String adminUsername = (sesion != null) ? (String) sesion.getAttribute("username") : null;
    Object clienteUsuario = (sesion != null) ? sesion.getAttribute("usuario") : null;

    // Ruta actual solicitada
    String rutaSolicitada = request.getRequestURI().substring(request.getContextPath().length());

    boolean accedeAdmin = rutaSolicitada.startsWith("/Administrador/pages/");
    boolean accedeUser  = rutaSolicitada.startsWith("/Usuario/pages/");

    // 🚫 Intento de acceder a zona de administrador
    if (accedeAdmin) {
        if (adminUsername == null) {
            if (clienteUsuario != null) {
                response.sendRedirect(request.getContextPath() + "/sin_permisos.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            return;
        }
    }

    // 🚫 Intento de acceder a zona de usuario
    if (accedeUser) {
        if (clienteUsuario == null) {
            if (adminUsername != null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            return;
        }
    }
%>
