/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

public class ContactoProveedor {
    private int idContacto;
    private String numeroTelefono;
    private String numeroContacto;
    private String cargo;
    private String proveedor;

    // Constructor vacío
    public ContactoProveedor() {
    }

    // Getters y Setters
    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public String getNumeroContacto() {
        return numeroContacto;
    }

    public void setNumeroContacto(String numeroContacto) {
        this.numeroContacto = numeroContacto;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    // Validar que el número empiece con 9 y tenga 9 dígitos
    public boolean esNumeroTelefonoValido() {
        if (numeroTelefono == null) {
            return false;
        }
        return numeroTelefono.matches("^9\\d{8}$");
    }

    // Validar que el cargo sea uno de tres permitidos
    public boolean esCargoValido() {
        if (cargo == null) {
            return false;
        }
        return cargo.equalsIgnoreCase("Gerente") ||
               cargo.equalsIgnoreCase("Supervisor") ||
               cargo.equalsIgnoreCase("Administrador");
    }
}
