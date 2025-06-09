<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Reporte de Especialidades de Empleados</title>
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
        <h1>Reporte de Especialidades de Empleados</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Establecer conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                stmt = conn.createStatement();
                
                // Consultar la especialidad con más empleados
                String queryEspecialidadMasDemandada = "SELECT " +
                    "especialidad, " +
                    "COUNT(*) as total_empleados, " +
                    "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje " +
                    "FROM Empleado " +
                    "GROUP BY especialidad " +
                    "ORDER BY total_empleados DESC " +
                    "LIMIT 1";
                rs = stmt.executeQuery(queryEspecialidadMasDemandada);
                
                if (rs.next()) {
                    out.println("<p><strong>Especialidad más demandada:</strong> <span style='color:#2980b9; font-weight:700;'>" + rs.getString("especialidad") + "</span>");
                    out.println(" (Total de Empleados: <strong>" + rs.getInt("total_empleados") + "</strong>)");
                    out.println(" - Porcentaje: <strong>" + rs.getDouble("porcentaje") + "%</strong></p>");
                }
                
                // Consultar resumen de especialidades
                String queryResumenEspecialidades = "SELECT " +
                    "especialidad, " +
                    "COUNT(*) as total_empleados, " +
                    "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje, " +
                    "GROUP_CONCAT(nombre, ' ', apellido SEPARATOR ', ') as empleados " +
                    "FROM Empleado " +
                    "GROUP BY especialidad " +
                    "ORDER BY total_empleados DESC";
                rs = stmt.executeQuery(queryResumenEspecialidades);
                
                out.println("<h2>Resumen de Especialidades</h2>");
                out.println("<table>");
                out.println("<thead><tr><th>Especialidad</th><th>Total Empleados</th><th>Porcentaje</th><th>Empleados</th></tr></thead>");
                out.println("<tbody>");
                
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("especialidad") + "</td>");
                    out.println("<td>" + rs.getInt("total_empleados") + "</td>");
                    out.println("<td>" + rs.getDouble("porcentaje") + "%</td>");
                    out.println("<td>" + rs.getString("empleados") + "</td>");
                    out.println("</tr>");
                }
                
                out.println("</tbody>");
                out.println("</table>");
                
                // Consultar detalle de empleados por especialidad
                String queryDetalleEmpleados = "SELECT " +
                    "nombre, " +
                    "apellido, " +
                    "especialidad, " +
                    "correo, " +
                    "telefono " +
                    "FROM Empleado " +
                    "ORDER BY especialidad, nombre";
                rs = stmt.executeQuery(queryDetalleEmpleados);
                
                out.println("<h2>Detalle de Empleados</h2>");
                out.println("<table>");
                out.println("<thead><tr><th>Nombre</th><th>Apellido</th><th>Especialidad</th><th>Correo</th><th>Teléfono</th></tr></thead>");
                out.println("<tbody>");
                
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("nombre") + "</td>");
                    out.println("<td>" + rs.getString("apellido") + "</td>");
                    out.println("<td>" + rs.getString("especialidad") + "</td>");
                    out.println("<td>" + rs.getString("correo") + "</td>");
                    out.println("<td>" + rs.getString("telefono") + "</td>");
                    out.println("</tr>");
                }
                
                out.println("</tbody>");
                out.println("</table>");
                
                // Consultar total de empleados
                String queryTotalEmpleados = "SELECT " +
                    "COUNT(*) as total_empleados, " +
                    "COUNT(DISTINCT especialidad) as total_especialidades " +
                    "FROM Empleado";
                rs = stmt.executeQuery(queryTotalEmpleados);
                
                if (rs.next()) {
                    out.println("<div class='summary'>");
                    out.println("<h2>Resumen General</h2>");
                    out.println("<p>Total de Empleados: <strong>" + rs.getInt("total_empleados") + "</strong></p>");
                    out.println("<p>Total de Especialidades Únicas: <strong>" + rs.getInt("total_especialidades") + "</strong></p>");
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
        
        <form action="/Proyecto-Barberia-BYL/GenerarReporteEspecialidadPDF" method="get">
            <button type="submit">Descargar Reporte de Especialidades en PDF</button>
        </form>
    </div>
</body>
</html>
