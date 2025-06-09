<%@ page import="java.sql.*, java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Reporte de Productos en Stock</title>
    <style>
        /* Reset básico */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9fafb;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 15px;
        }

        h1 {
            font-size: 2.5rem;
            border-bottom: 3px solid #2980b9;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        h2 {
            font-size: 1.8rem;
            margin-top: 40px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 8px;
        }

        p {
            font-size: 1.1rem;
            margin: 10px 0 30px;
            line-height: 1.5;
        }

        /* Contenedor principal */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        /* Tablas */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 40px;
            background-color: #ffffff;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            font-size: 1rem;
        }

        th {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 3px solid #1c5980;
        }

        tr:nth-child(even) {
            background-color: #f4f7fb;
        }

        tr:hover {
            background-color: #dbe9f9;
            transition: background-color 0.3s ease;
        }

        /* Botón de descarga */
        form {
            text-align: center;
            margin-top: 30px;
        }

        button {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(41, 128, 185, 0.4);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        button:hover {
            background-color: #1c5980;
            box-shadow: 0 6px 16px rgba(28, 89, 128, 0.7);
        }

        /* Mensajes de error */
        .error-message {
            background-color: #fce4e4;
            color: #c0392b;
            padding: 15px 20px;
            border-radius: 6px;
            margin-bottom: 30px;
            border: 1px solid #e74c3c;
            font-weight: 600;
        }

        /* Resumen general */
        .summary {
            background-color: #f9f9f9;
            padding: 20px 25px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            margin-bottom: 40px;
        }

        .summary p {
            font-size: 1.15rem;
            margin: 8px 0;
        }

        /* Resumen producto mayor stock */
        .highlight {
            background-color: #eaf4fc;
            border-left: 6px solid #2980b9;
            padding: 15px 20px;
            margin-bottom: 30px;
            border-radius: 6px;
            font-size: 1.15rem;
            color: #2c3e50;
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }
            .container {
                padding: 20px;
            }
            th, td {
                padding: 10px 12px;
                font-size: 0.9rem;
            }
            button {
                width: 100%;
                padding: 14px 0;
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reporte de Productos en Stock</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Establecer conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                stmt = conn.createStatement();

                // Formato moneda (USD)
                java.text.NumberFormat currencyFormat = java.text.NumberFormat.getCurrencyInstance(Locale.US);

                // Consultar el producto con mayor stock
                String queryMayorStock = "SELECT nombre, stock, sede, precio " +
                    "FROM Productos " +
                    "ORDER BY stock DESC " +
                    "LIMIT 1";
                rs = stmt.executeQuery(queryMayorStock);

                if (rs.next()) {
                    out.println("<div class='highlight'>Producto con Mayor Stock: <b>" + rs.getString("nombre") + "</b> " +
                        "(Stock: <strong>" + rs.getInt("stock") + " unidades</strong>) - Sede: <strong>" + rs.getString("sede") + "</strong> - Precio: <strong>" + currencyFormat.format(rs.getDouble("precio")) + "</strong></div>");
                }

                // Consultar resumen de productos por sede
                String queryProductosPorSede = "SELECT " +
                    "sede, " +
                    "COUNT(*) as total_productos, " +
                    "SUM(stock) as stock_total, " +
                    "ROUND(AVG(precio), 2) as precio_promedio " +
                    "FROM Productos " +
                    "GROUP BY sede " +
                    "ORDER BY stock_total DESC";
                rs = stmt.executeQuery(queryProductosPorSede);

                out.println("<h2>Resumen de Productos por Sede</h2>");
                out.println("<table>");
                out.println("<thead><tr><th>Sede</th><th>Total Productos</th><th>Stock Total</th><th>Precio Promedio</th></tr></thead>");
                out.println("<tbody>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("sede") + "</td>");
                    out.println("<td>" + rs.getInt("total_productos") + "</td>");
                    out.println("<td>" + rs.getInt("stock_total") + "</td>");
                    out.println("<td>" + currencyFormat.format(rs.getDouble("precio_promedio")) + "</td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");

                // Consultar detalle de productos
                String queryDetalleProductos = "SELECT " +
                    "nombre, " +
                    "stock, " +
                    "precio, " +
                    "sede " +
                    "FROM Productos " +
                    "ORDER BY stock DESC";
                rs = stmt.executeQuery(queryDetalleProductos);

                out.println("<h2>Detalle de Productos</h2>");
                out.println("<table>");
                out.println("<thead><tr><th>Nombre</th><th>Stock</th><th>Precio</th><th>Sede</th></tr></thead>");
                out.println("<tbody>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("nombre") + "</td>");
                    out.println("<td>" + rs.getInt("stock") + "</td>");
                    out.println("<td>" + currencyFormat.format(rs.getDouble("precio")) + "</td>");
                    out.println("<td>" + rs.getString("sede") + "</td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");

                // Consultar total de productos
                String queryTotalProductos = "SELECT " +
                    "COUNT(*) as total_productos, " +
                    "SUM(stock) as stock_total, " +
                    "ROUND(AVG(precio), 2) as precio_promedio " +
                    "FROM Productos";
                rs = stmt.executeQuery(queryTotalProductos);

                if (rs.next()) {
                    out.println("<div class='summary'>");
                    out.println("<h2>Resumen General</h2>");
                    out.println("<p>Total de Productos: <strong>" + rs.getInt("total_productos") + "</strong></p>");
                    out.println("<p>Stock Total: <strong>" + rs.getInt("stock_total") + " unidades</strong></p>");
                    out.println("<p>Precio Promedio: <strong>" + currencyFormat.format(rs.getDouble("precio_promedio")) + "</strong></p>");
                    out.println("</div>");
                }

            } catch (Exception e) {
                out.println("<div class='error-message'>Error en la generación del reporte: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                // Cerrar recursos de base de datos
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<div class='error-message'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
                }
            }
        %>

        <form action="/Proyecto-Barberia-BYL/GenerarReporteProductosPDF" method="get">
            <button type="submit">Descargar Reporte de Productos en PDF</button>
        </form>
    </div>
</body>
</html>
