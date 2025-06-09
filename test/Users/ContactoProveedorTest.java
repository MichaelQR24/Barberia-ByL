/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import org.junit.Test;
import static org.junit.Assert.*;

public class ContactoProveedorTest {

    @Test
    public void testNumeroTelefonoCorrecto() {
        ContactoProveedor contacto = new ContactoProveedor();
        contacto.setNumeroTelefono("912345678");
        assertTrue(contacto.esNumeroTelefonoValido());
    }    

    @Test
    public void testCargoCorrecto() {
        ContactoProveedor contacto = new ContactoProveedor();

        contacto.setCargo("Gerente");
        assertTrue(contacto.esCargoValido());        
    }    
}