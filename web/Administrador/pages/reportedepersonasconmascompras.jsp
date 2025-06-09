<%@ page import="java.sql.*, java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Reporte de Clientes con Más Compras</title>
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
        <h1>Reporte de Clientes con Más Compras</h1>

        <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Establecer conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
            
            // Formato de moneda
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("es", "PE"));
            
            // Consulta para obtener clientes con más compras pagadas
            String queryTopClientes = "SELECT " +
                "cliente, " +
                "COUNT(*) as total_compras, " +
                "SUM(total_neto) as total_comprado, " +
                "ROUND(AVG(total_neto), 2) as promedio_compra, " +
                "MAX(fecha) as ultima_compra " +
                "FROM boletas " +
                "WHERE estado = 'Pagado' " +
                "GROUP BY cliente " +
                "ORDER BY total_comprado DESC " +
                "LIMIT 10"; // Top 10 clientes
            
            pstmt = conn.prepareStatement(queryTopClientes);
            rs = pstmt.executeQuery();
            
            // Sección de Resumen de Top Clientes
            out.println("<div class='summary'>");
            out.println("<h2>Resumen de Top Clientes</h2>");
            
            out.println("<table>");
            out.println("<thead><tr>" +
                "<th>Cliente</th>" +
                "<th>Total Compras</th>" +
                "<th>Total Comprado</th>" +
                "<th>Promedio por Compra</th>" +
                "<th>Última Compra</th>" +
            "</tr></thead>");
            out.println("<tbody>");
            
            boolean hasClientes = false;
            while (rs.next()) {
                hasClientes = true;
                out.println("<tr>");
                out.println("<td>" + rs.getString("cliente") + "</td>");
                out.println("<td>" + rs.getInt("total_compras") + "</td>");
                out.println("<td>" + currencyFormat.format(rs.getDouble("total_comprado")) + "</td>");
                out.println("<td>" + currencyFormat.format(rs.getDouble("promedio_compra")) + "</td>");
                out.println("<td>" + rs.getDate("ultima_compra") + "</td>");
                out.println("</tr>");
            }
            
            if (!hasClientes) {
                out.println("<tr><td colspan='5'>No hay compras registradas</td></tr>");
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            
            // Detalles de Clientes
            out.println("<h2>Detalle de Compras por Cliente</h2>");
            
            // Consulta detallada de compras por cliente
            String queryDetalleClientes = "SELECT " +
                "cliente, " +
                "fecha, " +
                "total_bruto, " +
                "igv, " +
                "total_neto, " +
                "metodo_pago " +
                "FROM boletas " +
                "WHERE estado = 'Pagado' " +
                "ORDER BY cliente, fecha DESC";
            
            pstmt = conn.prepareStatement(queryDetalleClientes);
            rs = pstmt.executeQuery();
            
            out.println("<table>");
            out.println("<thead><tr>" +
                "<th>Cliente</th>" +
                "<th>Fecha</th>" +
                "<th>Total Bruto</th>" +
                "<th>IGV</th>" +
                "<th>Total Neto</th>" +
                "<th>Método de Pago</th>" +
            "</tr></thead>");
            out.println("<tbody>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("cliente") + "</td>");
                out.println("<td>" + rs.getDate("fecha") + "</td>");
                out.println("<td>" + currencyFormat.format(rs.getDouble("total_bruto")) + "</td>");
                out.println("<td>" + currencyFormat.format(rs.getDouble("igv")) + "</td>");
                out.println("<td>" + currencyFormat.format(rs.getDouble("total_neto")) + "</td>");
                out.println("<td>" + rs.getString("metodo_pago") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</tbody>");
            out.println("</table>");
            
            // Resumen General
            String querySumaTotal = "SELECT " +
                "COUNT(*) as total_boletas, " +
                "SUM(total_neto) as total_ventas, " +
                "COUNT(DISTINCT cliente) as total_clientes " +
                "FROM boletas " +
                "WHERE estado = 'Pagado'";
            
            pstmt = conn.prepareStatement(querySumaTotal);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                out.println("<div class='summary'>");
                out.println("<h2>Resumen General</h2>");
                out.println("<p>Total de Boletas Pagadas: <strong>" + rs.getInt("total_boletas") + "</strong></p>");
                out.println("<p>Total de Ventas: <strong>" + currencyFormat.format(rs.getDouble("total_ventas")) + "</strong></p>");
                out.println("<p>Total de Clientes: <strong>" + rs.getInt("total_clientes") + "</strong></p>");
                out.println("</div>");
            }
            
        } catch (Exception e) {
            out.println("<div class='error-message'>Error en la generación del reporte: " + e.getMessage() + "</div>");
            e.printStackTrace();
        } finally {
            // Cerrar recursos de base de datos
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<div class='error-message'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
            }
        }
        %>
        
        <form action="/Proyecto-Barberia-BYL/GenerarReporteBoletasPDF" method="get">
            <button type="submit">Descargar Reporte de Boletas en PDF</button>
        </form>
    </div>
</body>
</html>
