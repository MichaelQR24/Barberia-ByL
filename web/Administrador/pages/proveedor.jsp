<%@ include file="/proteger.jsp" %>
<%@ page import="Users.ProveedorDAO, Users.Proveedor, java.util.LinkedList" %>
<%    // Obtenemos la lista de proveedores desde el DAO
    ProveedorDAO proveedorDAO = new ProveedorDAO();
    LinkedList<Proveedor> proveedores = proveedorDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Proveedores</title>
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
                width: 70%;
                max-width: 100px;
                margin: 0 auto;
                display: block;
                border-bottom: 2px solid #7f8c8d;
                border-radius: 50%;
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
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <div class="logo text-center my-4">
                        <img src="../../Administrador/img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle">
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
                            <a href="../../Administrador/pages/proveedor.jsp" class="nav-link active">
                                <i class="fas fa-store"></i> <span>Proveedores</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/servicio.jsp" class="nav-link">
                                <i class="fas fa-concierge-bell"></i> <span>Servicios</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../Administrador/pages/productos.jsp" class="nav-link">
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
                    <h1 class="my-4">Gestión de Proveedores</h1>

                    <!-- Formulario para crear proveedor -->
                    <div class="card-form">
                        <h2 class="mb-4">Crear Proveedor</h2>
                        <form action="/Proyecto-Barberia-BYL/ProveedorServlet" method="post">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Nombre del Proveedor</label>
                                    <input type="text" name="nombre" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">RUC</label>
                                    <input type="text" name="ruc" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Teléfono</label>
                                    <input type="text" name="telefono" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Dirección</label>
                                    <input type="text" name="direccion" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Descripción</label>
                                <input type="text" name="descripcion" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus"></i> Crear Proveedor
                            </button>
                        </form>
                    </div>
                    <!-- Tabla de proveedores -->
                    <div class="card table-responsive">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Lista de Proveedores</h2>
                        </div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>RUC</th>
                                    <th>Teléfono</th>
                                    <th>Dirección</th>
                                    <th>Descripción</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Proveedor proveedor : proveedores) {%>
                                <tr>
                                    <td><%= proveedor.getIdProveedor()%></td>
                                    <td><%= proveedor.getNombre()%></td>
                                    <td><%= proveedor.getRuc()%></td>
                                    <td><%= proveedor.getTelefono()%></td>
                                    <td><%= proveedor.getDireccion()%></td>
                                    <td><%= proveedor.getDescripcion()%></td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <!-- Botón para Editar Proveedor -->
                                            <button type="button" class="btn btn-warning btn-action" data-bs-toggle="modal" data-bs-target="#editModal<%= proveedor.getIdProveedor()%>">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <!-- Botón para Eliminar Proveedor -->
                                            <form action="/Proyecto-Barberia-BYL/ProveedorServlet" method="post" class="d-inline">
                                                <input type="hidden" name="accion" value="eliminar">
                                                <input type="hidden" name="idProveedor" value="<%= proveedor.getIdProveedor()%>">
                                                <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este proveedor?');">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Modal para editar proveedor -->
                            <div class="modal fade" id="editModal<%= proveedor.getIdProveedor()%>" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Editar Proveedor</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <form action="/Proyecto-Barberia-BYL/ProveedorServlet" method="post">
                                            <div class="modal-body">
                                                <input type="hidden" name="accion" value="actualizar">
                                                <input type="hidden" name="idProveedor" value="<%= proveedor.getIdProveedor()%>">
                                                <div class="mb-3">
                                                    <label class="form-label">Nombre del Proveedor</label>
                                                    <input type="text" name="nombre" class="form-control" value="<%= proveedor.getNombre()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">RUC</label>
                                                    <input type="text" name="ruc" class="form-control" value="<%= proveedor.getRuc()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Teléfono</label>
                                                    <input type="text" name="telefono" class="form-control" value="<%= proveedor.getTelefono()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Dirección</label>
                                                    <input type="text" name="direccion" class="form-control" value="<%= proveedor.getDireccion()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Descripción</label>
                                                    <input type="text" name="descripcion" class="form-control" value="<%= proveedor.getDescripcion()%>" required>
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
