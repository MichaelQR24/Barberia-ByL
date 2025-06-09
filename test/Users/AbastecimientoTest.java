/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import org.junit.Test;
import static org.junit.Assert.*;

public class AbastecimientoTest {

    @Test
    public void testCantidadValida() {
        Producto producto = new Producto(); // Suponemos que tienes un constructor vacío
        Proveedor proveedor = new Proveedor();
        Abastecimiento abastecimiento = new Abastecimiento(1, producto, proveedor, 10, LocalDateTime.now(), new BigDecimal("5.00"));

        assertTrue("La cantidad debe ser válida (mayor a 0)", abastecimiento.esCantidadValida());
    }   
    @Test
    public void testPrecioUnitarioValido() {
        Producto producto = new Producto();
        Proveedor proveedor = new Proveedor();
        Abastecimiento abastecimiento = new Abastecimiento(3, producto, proveedor, 5, LocalDateTime.now(), new BigDecimal("10.50"));

        assertTrue("El precio unitario debe ser válido (mayor a 0)", abastecimiento.esPrecioUnitarioValido());
    }    
}

