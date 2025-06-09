/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

public class svAdministradorTest {

    private svAdministrador servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private Map<String, Object> sessionAttrs;
    private Map<String, String> requestParams;
    private String[] redirectUrl;

    @Before
    public void setUp() {
        servlet = new svAdministrador();
        sessionAttrs = new HashMap<>();
        requestParams = new HashMap<>();
        redirectUrl = new String[1];

        HttpSession sessionProxy = (HttpSession) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpSession.class},
                (proxy, method, args) -> {
                    if ("setAttribute".equals(method.getName())) {
                        sessionAttrs.put((String) args[0], args[1]);
                    } else if ("getAttribute".equals(method.getName())) {
                        return sessionAttrs.get(args[0]);
                    }
                    return null;
                }
        );

        request = (HttpServletRequest) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpServletRequest.class},
                (proxy, method, args) -> {
                    if ("getParameter".equals(method.getName())) {
                        return requestParams.get(args[0]);
                    } else if ("getSession".equals(method.getName())) {
                        return sessionProxy;
                    } else if ("getContextPath".equals(method.getName())) {
                        return "";
                    }
                    return null;
                }
        );

        response = (HttpServletResponse) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpServletResponse.class},
                (proxy, method, args) -> {
                    if ("sendRedirect".equals(method.getName())) {
                        redirectUrl[0] = (String) args[0];
                    }
                    return null;
                }
        );
    }

    @Test
    public void loginTest() throws Exception {
        System.out.println("Validaciones de login");

        requestParams.put("username", "admin");
        requestParams.put("password", "1234");

        // Validaciones username
        assertNotNull("El username no debe ser nulo", requestParams.get("username"));
        assertFalse("El username no debe estar vacío", requestParams.get("username").trim().isEmpty());
        assertTrue("El username solo debe contener letras, números o guiones bajos",
                requestParams.get("username").matches("^[A-Za-z0-9_]+$"));

        // Validaciones password
        assertNotNull("La contraseña no debe ser nula", requestParams.get("password"));
        assertFalse("La contraseña no debe estar vacía", requestParams.get("password").trim().isEmpty());
        assertTrue("La contraseña debe tener mínimo 4 caracteres",
                requestParams.get("password").length() >= 4);

        //si valida...
        servlet.doPost(request, response);

        assertNotNull("Debe haberse producido una redirección", redirectUrl[0]);
        assertTrue("Debe redirigir a login_administrador.jsp por error o éxito",
                redirectUrl[0].contains("login_administrador.jsp")
                || redirectUrl[0].contains("pages/citas.jsp"));
    }
}

