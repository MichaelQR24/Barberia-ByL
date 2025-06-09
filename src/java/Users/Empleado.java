/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Nameless
 */
public class Empleado {
    private int id;              
    private String nombre;      
    private String apellido;      
    private String correo;       
    private String especialidad; 
    private String telefono;      

    // Constructor vacío
    public Empleado() {}

    // Constructor con todos los parámetros
    public Empleado(int id, String nombre, String apellido, String correo, String especialidad, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.especialidad = especialidad;
        this.telefono = telefono;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
    public static boolean validarTelefono(String numero) {
        Pattern p = Pattern.compile("^[9][0-9]{8}$"); 
        Matcher m = p.matcher(numero);
        return m.find(); 
    }
    
     public static boolean validarCorreo(String correo) {
        Pattern p = Pattern.compile("^[a-zA-Z0-9_]+@(gmail\\.com|hotmail\\.com)$"); 
        Matcher m = p.matcher(correo);
        return m.find(); 
    }
}