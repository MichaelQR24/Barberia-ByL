/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

import java.lang.reflect.Proxy;
import java.util.*;

public class CarritoServletTest {

    private CarritoServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private Map<String, Object> sessionAttrs;
    private Map<String, String> requestParams;

    @Before
    public void setUp() {
        servlet = new CarritoServlet();
        sessionAttrs = new HashMap<>();
        requestParams = new HashMap<>();

        HttpSession sessionProxy = (HttpSession) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpSession.class},
                (proxy, method, args) -> {
                    String name = method.getName();
                    if ("getAttribute".equals(name)) {
                        return sessionAttrs.get(args[0]);
                    } else if ("setAttribute".equals(name)) {
                        sessionAttrs.put((String) args[0], args[1]);
                        return null;
                    } else if ("getId".equals(name)) {
                        return "mockSessionId";
                    }

                    Class<?> retType = method.getReturnType();
                    if (retType == boolean.class) {
                        return false;
                    }
                    if (retType == int.class) {
                        return 0;
                    }
                    if (retType == long.class) {
                        return 0L;
                    }
                    if (retType == float.class) {
                        return 0f;
                    }
                    if (retType == double.class) {
                        return 0d;
                    }
                    return null;
                }
        );

        request = (HttpServletRequest) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpServletRequest.class},
                (proxy, method, args) -> {
                    String name = method.getName();
                    if ("getSession".equals(name)) {
                        return sessionProxy;
                    } else if ("getParameter".equals(name)) {
                        return requestParams.get(args[0]);
                    }
                    return null;
                }
        );

        response = (HttpServletResponse) Proxy.newProxyInstance(
                getClass().getClassLoader(),
                new Class[]{HttpServletResponse.class},
                (proxy, method, args) -> {
                    return null;
                }
        );
    }

    @Test
    public void testCarritoNuevo() throws Exception {
        sessionAttrs.remove("carrito");

        requestParams.put("accion", "eliminar");
        requestParams.put("idProducto", "0");
        servlet.doPost(request, response);

        Object carritoObj = sessionAttrs.get("carrito");
        assertNotNull("El atributo 'carrito' no debe ser null", carritoObj);
        assertTrue("Debe ser una lista", carritoObj instanceof List);
        assertTrue("La lista debe comenzar vacía", ((List<?>) carritoObj).isEmpty());
    }

    @Test
    public void testAgregarProducto() throws Exception {
        sessionAttrs.put("carrito", new ArrayList<Map<String, Object>>());

        requestParams.put("accion", "agregar");
        requestParams.put("idProducto", "123");
        requestParams.put("nombre", "Producto 1");
        requestParams.put("precio", "100.0");

        servlet.doPost(request, response);

        Object carritoObj = sessionAttrs.get("carrito");
        assertNotNull(carritoObj);
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> carrito = (List<Map<String, Object>>) carritoObj;
        assertEquals(1, carrito.size());

        Map<String, Object> producto = carrito.get(0);
        assertEquals("123", producto.get("idProducto"));
        assertEquals("Producto 1", producto.get("nombre"));
        assertEquals(100.0, producto.get("precio"));
    }
}
