/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import org.junit.Test;
import static org.junit.Assert.*;

public class ServicioTest {

    @Test
    public void testGetAndSetIdServicio() {
        System.out.println("Iniciando prueba: testGetAndSetIdServicio");
        try {
            Servicio servicio = new Servicio();
            servicio.setIdServicio(10);
            assertEquals(10, servicio.getIdServicio());
            System.out.println("✅ Prueba testGetAndSetIdServicio pasada correctamente.\n");
        } catch (AssertionError e) {
            System.out.println("❌ Prueba testGetAndSetIdServicio falló: " + e.getMessage() + "\n");
        }
    }

    @Test
    public void testGetAndSetNombreServicio() {
        System.out.println("Iniciando prueba: testGetAndSetNombreServicio");
        try {
            Servicio servicio = new Servicio();
            servicio.setNombreservicio("Corte de Cabello");
            assertEquals("Corte de Cabello", servicio.getNombreservicio());
            System.out.println("✅ Prueba testGetAndSetNombreServicio pasada correctamente.\n");
        } catch (AssertionError e) {
            System.out.println("❌ Prueba testGetAndSetNombreServicio falló: " + e.getMessage() + "\n");
        }
    }

    @Test
    public void testGetAndSetPrecio() {
        System.out.println("Iniciando prueba: testGetAndSetPrecio");
        try {
            Servicio servicio = new Servicio();
            servicio.setPrecio(25.50);
            assertEquals(25.50, servicio.getPrecio(), 0.001);
            System.out.println("✅ Prueba testGetAndSetPrecio pasada correctamente.\n");
        } catch (AssertionError e) {
            System.out.println("❌ Prueba testGetAndSetPrecio falló: " + e.getMessage() + "\n");
        }
    }

    @Test
    public void testGetAndSetDescripcion() {
        System.out.println("Iniciando prueba: testGetAndSetDescripcion");
        try {
            Servicio servicio = new Servicio();
            servicio.setDescripcion("Corte de cabello con lavado y peinado.");
            assertEquals("Corte de cabello con lavado y peinado.", servicio.getDescripcion());
            System.out.println("✅ Prueba testGetAndSetDescripcion pasada correctamente.\n");
        } catch (AssertionError e) {
            System.out.println("❌ Prueba testGetAndSetDescripcion falló: " + e.getMessage() + "\n");
        }
    }

    @Test
    public void testConstructorConParametros() {
        System.out.println("Iniciando prueba: testConstructorConParametros");
        try {
            Servicio servicio = new Servicio(1, "Afeitado", 15.0, "Afeitado clásico con navaja");
            assertEquals(1, servicio.getIdServicio());
            assertEquals("Afeitado", servicio.getNombreservicio());
            assertEquals(15.0, servicio.getPrecio(), 0.001);
            assertEquals("Afeitado clásico con navaja", servicio.getDescripcion());
            System.out.println("✅ Prueba testConstructorConParametros pasada correctamente.\n");
        } catch (AssertionError e) {
            System.out.println("❌ Prueba testConstructorConParametros falló: " + e.getMessage() + "\n");
        }
    }
}