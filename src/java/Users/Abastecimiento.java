/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Abastecimiento {
    private int idAbastecimiento;
    private Producto producto;
    private Proveedor proveedor;
    private int cantidad;
    private LocalDateTime fecha;
    private BigDecimal precioUnitario;
    private BigDecimal totalCompra;

    public Abastecimiento(int idAbastecimiento, Producto producto, Proveedor proveedor, int cantidad, LocalDateTime fecha, BigDecimal precioUnitario) {
        this.idAbastecimiento = idAbastecimiento;
        this.producto = producto;
        this.proveedor = proveedor;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.precioUnitario = precioUnitario;
        this.totalCompra = calcularTotal();
    }

    public BigDecimal calcularTotal() {
        return precioUnitario.multiply(new BigDecimal(cantidad));
    }

    // Getters y Setters

    public int getIdAbastecimiento() {
        return idAbastecimiento;
    }

    public void setIdAbastecimiento(int idAbastecimiento) {
        this.idAbastecimiento = idAbastecimiento;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
        this.totalCompra = calcularTotal();
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(BigDecimal precioUnitario) {
        this.precioUnitario = precioUnitario;
        this.totalCompra = calcularTotal();
    }

    public BigDecimal getTotalCompra() {
        return totalCompra;
    }

    // --------- NUEVOS METODOS PUBLIC BOOLEAN --------

    // Validar que la cantidad sea mayor a 0
    public boolean esCantidadValida() {
        return cantidad > 0;
    }

    // Validar que el precio unitario sea mayor a 0
    public boolean esPrecioUnitarioValido() {
        return precioUnitario != null && precioUnitario.compareTo(BigDecimal.ZERO) > 0;
    }
}
