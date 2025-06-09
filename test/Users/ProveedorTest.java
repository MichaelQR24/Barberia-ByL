/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author PROPIETARIO
 */
public class ProveedorTest {

    @Test
    public void testValidarNombreProveedor() {
        System.out.println("Validar nombre...");

        String nombre = "Caseritas";

        boolean result = Proveedor.validarNombreProveedor(nombre);

        if (nombre != null && !nombre.trim().isEmpty()) {
            if (result) {
                System.out.println("Nombre válido: '" + nombre + "'");
            } else {
                fail("Error: El nombre válido fue considerado inválido.");
            }
        } else {
            if (!result) {
                System.out.println("Nombre inválido: '" + nombre + "'");
            } else {
                fail("Error: El nombre inválido fue considerado válido.");
            }
        }

        System.out.println("----------------------------------------------");
    }

    @Test
    public void testValidarRuc() {
        System.out.println("Validar RUC...");

        String ruc = "20123456928";

        boolean result = Proveedor.validarRuc(ruc);

        if (ruc != null && ruc.matches("^\\d{11}$")) {
            if (result) {
                System.out.println("RUC válido: '" + ruc + "'");
            } else {
                fail("Error: El RUC válido fue considerado inválido.");
            }
        } else {
            if (!result) {
                System.out.println("RUC inválido: '" + ruc + "'");
            } else {
                fail("Error: El RUC inválido fue considerado válido.");
            }
        }

        System.out.println("----------------------------------------------");
    }

    @Test
    public void testValidarTelefono() {
        System.out.println("Validar teléfono...");

        String telefono = "963918844";

        boolean result = Proveedor.validarTelefono(telefono);

        if (telefono != null && telefono.matches("^9\\d{8}$")) {
            if (result) {
                System.out.println("Teléfono válido: '" + telefono + "'");
            } else {
                fail("Error: El teléfono válido fue considerado inválido.");
            }
        } else {
            if (!result) {
                System.out.println("Teléfono inválido: '" + telefono + "'");
            } else {
                fail("Error: El teléfono inválido fue considerado válido.");
            }
        }

        System.out.println("----------------------------------------------");
    }

    @Test
    public void testValidarDireccion() {
        System.out.println("Validar dirección...");

        String direccion = "SJL. San Carlos 123";

        boolean result = Proveedor.validarDireccion(direccion);

        if (direccion != null && !direccion.trim().isEmpty()) {
            if (result) {
                System.out.println("Dirección válida: '" + direccion + "'");
            } else {
                fail("Error: La dirección válida fue considerada inválida.");
            }
        } else {
            if (!result) {
                System.out.println("Dirección inválida: '" + direccion + "'");
            } else {
                fail("Error: La dirección inválida fue considerada válida.");
            }
        }

        System.out.println("----------------------------------------------");
    }
}