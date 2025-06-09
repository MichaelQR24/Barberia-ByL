<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Reporte de Servicios Solicitados</title>
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
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        /* Tabla */
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

        /* Resumen destacado */
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
        <h1>Reporte de Servicios Solicitados</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String servicioMasSolicitado = "";
            int totalSolicitudes = 0;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                stmt = conn.createStatement();

                // Consultar el servicio más solicitado
                String query = "SELECT servicio, COUNT(*) as total_solicitudes " +
                    "FROM citas " +
                    "GROUP BY servicio " +
                    "ORDER BY total_solicitudes DESC " +
                    "LIMIT 1";
                rs = stmt.executeQuery(query);

                if (rs.next()) {
                    servicioMasSolicitado = rs.getString("servicio");
                    totalSolicitudes = rs.getInt("total_solicitudes");
                    out.println("<div class='highlight'>Servicio más solicitado: <b>" + servicioMasSolicitado + "</b> (Total: " + totalSolicitudes + " solicitudes)</div>");
                }

                // Consultar total de tipos de servicios
                query = "SELECT COUNT(DISTINCT servicio) as total_servicios FROM citas";
                rs = stmt.executeQuery(query);

                if (rs.next()) {
                    out.println("<p>Total de Tipos de Servicios: <strong>" + rs.getInt("total_servicios") + "</strong></p>");
                }

                // Detalles de solicitudes por servicio
                query = "SELECT servicio, COUNT(*) as total_solicitudes, " +
                    "(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM citas)) AS porcentaje " +
                    "FROM citas " +
                    "GROUP BY servicio " +
                    "ORDER BY total_solicitudes DESC";
                rs = stmt.executeQuery(query);

                out.println("<h2>Detalle de Servicios</h2>");
                out.println("<table>");
                out.println("<thead><tr><th>Servicio</th><th>Total Solicitudes</th><th>Porcentaje</th></tr></thead>");
                out.println("<tbody>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("servicio") + "</td>");
                    out.println("<td>" + rs.getInt("total_solicitudes") + "</td>");
                    out.println("<td>" + String.format("%.2f%%", rs.getDouble("porcentaje")) + "</td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");

            } catch (Exception e) {
                out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<div class='error-message'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
                }
            }
        %>

        <form action="/Proyecto-Barberia-BYL/GenerarReporteServiciosPDF" method="get">
            <button type="submit">Descargar Reporte de Servicios en PDF</button>
        </form>
    </div>
</body>
</html>
