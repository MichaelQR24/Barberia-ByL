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
public class EmpleadoTest {
    
    public EmpleadoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Empleado.
     */
    
    @Test
    public void testvalidartelefono() {
    System.out.println("validarTelefono");
    Integer numero = 978541454;  
    Empleado emp = new Empleado();
     emp.setTelefono(numero.toString());
     String numeros=emp.getTelefono();
    boolean expResult = true; 
    boolean result = Empleado.validarTelefono(numeros); 
   if(expResult != result)
        {
            fail("FALLÓ TELÉFONO.");
    }
}
   @Test
     public void testValidarCorreoValido() {
        System.out.println("validarCorreo");
        String correo = "prof_eun20@gmail.com"; 
        Empleado emp = new Empleado();
        emp.setCorreo(correo);
        String dato=emp.getCorreo();   
        boolean expResult = true; 
        boolean result = Empleado.validarCorreo(dato);
        if(expResult != result)
        {
            fail("FALLÓ CORREO.");
    }
    }
    
}
