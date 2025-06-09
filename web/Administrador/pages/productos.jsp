<%@ include file="/proteger.jsp" %>
<%@ page import="Users.ProductoDAO, Users.Producto, java.util.LinkedList" %>
<%    // Obtenemos la lista de productos desde el DAO
    ProductoDAO productoDAO = new ProductoDAO();
    LinkedList<Producto> productos = productoDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Productos</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #e67e22;
                --accent-color: #ecf0f1;
                --background-color: #34495e;
                --highlight-color: #f39c12;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: var(--background-color);
                color: white;
                margin: 0;
                padding: 0;
            }

            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                width: 250px;
                height: 100%;
                background-color: var(--primary-color);
                color: white;
                z-index: 1000;
                transition: none;
            }

            .sidebar .nav-link {
                color: #ecf0f1;
                padding: 15px;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing: 1px;
                border-bottom: 1px solid #7f8c8d;
                transition: background-color 0.3s;
            }

            .sidebar .nav-link:hover {
                background-color: var(--secondary-color);
                color: white;
            }

            .sidebar .nav-link.active {
                background-color: var(--highlight-color);
                color: white;
            }

            .sidebar img {
                width: 70% !important;
                max-width: 100px !important;
                margin: 0 auto !important;
                display: block !important;
                border-bottom: 2px solid #7f8c8d !important;
                border-radius: 50% !important;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
                transition: none;
            }

            .card-form,
            .table-empleados {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
            }

            .card-form h2,
            .table-empleados h2 {
                color: var(--primary-color);
            }

            .table-empleados thead {
                background-color: var(--primary-color);
                color: white;
            }

            .table-empleados th,
            .table-empleados td {
                vertical-align: middle;
            }

            .btn-action {
                margin: 0 5px;
            }

            @media (max-width: 768px) {
                .sidebar {
                    width: 200px;
                }
                .main-content {
                    margin-left: 200px;
                }
            }

            .card-form label {
                color: #2c3e50;
                font-weight: 600;
            }

            .card-form input,
            .card-form select,
            .card-form textarea {
                background-color: #f9f9f9;
                color: #2c3e50;
                border: 1px solid #ccc;
            }

            .modal input,
            .modal select,
            .modal textarea {
                background-color: #f9f9f9 !important;
                color: #2c3e50 !important;
                border: 1px solid #ccc;
            }

            .modal label {
                color: #2c3e50 !important;
                font-weight: 600;
            }

            /* --- BARRA AZUL ESTILO EMPLEADOS --- */
            .barra-titulo {
                background: #1683fa;
                color: #fff;
                font-size: 2rem;
                font-weight: bold;
                padding: 8px 15px;
                margin: 0;
                width: 100%;
                box-sizing: border-box;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                border: 1px solid #aaa;
                border-bottom: none;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <div class="logo text-center my-4">
                        <img src="../../Administrador/img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle" style="width: 80px;">
                    </div>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="../../Administrador/pages/citas.jsp" class="nav-link">
                                <i class="fas fa-calendar"></i> <span>Citas</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/usuarios.jsp" class="nav-link">
                                <i class="fas fa-users"></i> <span>Usuarios</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/proveedor.jsp" class="nav-link">
                                <i class="fas fa-store"></i> <span>Proveedores</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/servicio.jsp" class="nav-link">
                                <i class="fas fa-concierge-bell"></i> <span>Servicios</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/productos.jsp" class="nav-link active">
                                <i class="fas fa-box"></i> <span>Productos</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/empleado.jsp" class="nav-link">
                                <i class="fas fa-users-cog"></i> <span>Empleados</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/boletas.jsp" class="nav-link">
                                <i class="fas fa-receipt"></i> <span>Boletas</span>
                            </a>
                        </li>
                        <li class="nav-item mt-5">
                            <a href="<%= request.getContextPath()%>/logout" 
                               class="nav-link" 
                               onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                                <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                            </a>

                        </li>
                    </ul>
                </div>
                <!-- Main Content -->
                <div class="col-md-10 main-content">
                    <h1 class="my-4">Gestión de Productos</h1>

                    <!-- Botón para reporte de servicios -->
                    <div class="mb-4">
                        <a href="reportedeproductosmassolicitados.jsp" class="btn btn-secondary">
                            <i class="fas fa-file-pdf"></i> Ver Reporte de Productos
                        </a>
                    </div>
                    <!-- Formulario para crear producto -->
                    <div class="card-form">
                        <h2 class="mb-4">Crear Producto</h2>
                        <form action="/Proyecto-Barberia-BYL/ProductoServlet" method="post">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" name="nombre" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Descripción</label>
                                    <textarea name="descripcion" class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Precio</label>
                                    <input type="number" name="precio" class="form-control" step="0.01" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Cantidad</label>
                                    <input type="number" name="stock" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Sede</label>
                                <select name="sede" class="form-select" required>
                                    <option value="">Seleccione una sede</option>
                                    <option value="Sede A">Sede A</option>
                                    <option value="Sede B">Sede B</option>
                                    <option value="Sede C">Sede C</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Crear Producto
                            </button>
                        </form>
                    </div>
                    <!-- Tabla de productos -->
                    <div class="card table-responsive">
                        <div class="barra-titulo">Lista de Productos</div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Sede</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Producto producto : productos) {%>
                                <tr>
                                    <td><%= producto.getId()%></td>
                                    <td><%= producto.getNombre()%></td>
                                    <td><%= producto.getDescripcion()%></td>
                                    <td><%= producto.getPrecio()%></td>
                                    <td><%= producto.getStock()%></td>
                                    <td><%= producto.getSede()%></td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <!-- Editar Producto ABRE MODAL -->
                                            <button type="button" class="btn btn-warning btn-action" data-bs-toggle="modal" data-bs-target="#editModal<%= producto.getId()%>">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <!-- Eliminar Producto -->
                                            <form action="/Proyecto-Barberia-BYL/ProductoServlet" method="post" class="d-inline">
                                                <input type="hidden" name="accion" value="eliminar">
                                                <input type="hidden" name="id" value="<%= producto.getId()%>">
                                                <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este producto?');">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <!-- Modal de edición para este producto -->
                                        <div class="modal fade" id="editModal<%= producto.getId()%>" tabindex="-1" aria-labelledby="editModalLabel<%= producto.getId()%>" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="/Proyecto-Barberia-BYL/ProductoServlet" method="post">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="editModalLabel<%= producto.getId()%>">Editar Producto</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" name="accion" value="actualizar">
                                                            <input type="hidden" name="id" value="<%= producto.getId()%>">
                                                            <div class="mb-3">
                                                                <label class="form-label">Nombre</label>
                                                                <input type="text" name="nombre" class="form-control" value="<%= producto.getNombre()%>" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Descripción</label>
                                                                <textarea name="descripcion" class="form-control" required><%= producto.getDescripcion()%></textarea>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Precio</label>
                                                                <input type="number" name="precio" class="form-control" step="0.01" value="<%= producto.getPrecio()%>" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Cantidad</label>
                                                                <input type="number" name="stock" class="form-control" value="<%= producto.getStock()%>" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Sede</label>
                                                                <select name="sede" class="form-select" required>
                                                                    <option value="">Seleccione una sede</option>
                                                                    <option value="Sede A" <%= producto.getSede().equals("Sede A") ? "selected" : ""%>>Sede A</option>
                                                                    <option value="Sede B" <%= producto.getSede().equals("Sede B") ? "selected" : ""%>>Sede B</option>
                                                                    <option value="Sede C" <%= producto.getSede().equals("Sede C") ? "selected" : ""%>>Sede C</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
