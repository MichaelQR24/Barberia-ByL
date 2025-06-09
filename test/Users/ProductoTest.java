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
public class ProductoTest {

    @Test
    public void testValidarPrecio() {
        System.out.println("Validar precio...");

        double precio = 7.7;
        boolean result = Producto.validarPrecio(precio);
        if (precio > 0) {
            if (result) {
                System.out.println("Precio válido: " + precio);
            } else {
                fail("Error: El precio fue considerado inválido.");
            }
        } else if (precio == 0) {
            if (!result) {
                System.out.println("Precio igual a cero, INVÁLIDO.");
            } else {
                fail("Error: El precio cero fue considerado válido.");
            }
        } else {
            if (!result) {
                System.out.println("Precio negativo " + precio + ", INVÁLIDO.");
            } else {
                fail("Error: El precio negativo fue considerado válido.");
            }        }
        System.out.println("----------------------------------------------");
    }
    
    /**
     * Test of setPrecio method, of class Producto.
     */
    @Test
    public void testValidarStock() {
        System.out.println("Validar stock...");

        int stock = -1;

        boolean result = Producto.validarStock(stock);

        if (stock >= 0) {
            if (result) {
                System.out.println("Stock válido: " + stock);
            } else {
                fail("Error: El stock válido fue considerado inválido.");
            }
        } else { 
            if (!result) {
                System.out.println("Stock negativo " + stock + ", INVÁLIDO.");
            } else {
                fail("Error: El stock negativo fue considerado válido.");
            }
        }

        System.out.println("----------------------------------------------");
    }
    @Test
    public void testValidarNombreProducto() {
        System.out.println("Validar nombre producto...");

        String nombre = "Cera";

        boolean result = Producto.validarNombreProducto(nombre);

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
}

