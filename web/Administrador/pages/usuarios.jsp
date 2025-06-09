<%@ include file="/proteger.jsp" %>
<%@ page import="Users.UsuarioDAO, Users.Usuario, java.util.LinkedList" %>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    LinkedList<Usuario> usuarios = usuarioDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Usuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                            <a href="../../Administrador/pages/usuarios.jsp" class="nav-link active">
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
                            <a href="<%=request.getContextPath()%>/logout"
                               <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Main Content -->
                <div class="col-md-10 main-content">
                    <h1 class="my-4">Gestión de Usuarios</h1>
                    <div class="card-form">
                        <h2 class="mb-4">Crear Nuevo Usuario</h2>
                        <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Nombres</label>
                                    <input type="text" name="nombres" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Apellidos</label>
                                    <input type="text" name="apellidos" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" name="correo" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Número de Teléfono</label>
                                    <input type="text" name="numero" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contraseña</label>
                                    <input type="password" name="contraseña" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Género</label>
                                    <select name="genero" class="form-select" required>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-user-plus"></i> Crear Usuario
                            </button>
                        </form>
                    </div>
                    <!-- Tabla de usuarios -->
                    <div class="card table-responsive table-users">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Lista de Usuarios</h2>
                        </div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Correo</th>
                                    <th>Número</th>
                                    <th>Género</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Usuario usuario : usuarios) {%>
                                <tr>
                                    <td><%= usuario.getId()%></td>
                                    <td><%= usuario.getNombre()%></td>
                                    <td><%= usuario.getApellido()%></td>
                                    <td><%= usuario.getEmail()%></td>
                                    <td><%= usuario.getNumero()%></td>
                                    <td><%= usuario.getGenero()%></td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <!-- Editar Usuario -->
                                            <button type="button" class="btn btn-info btn-action" data-bs-toggle="modal" data-bs-target="#editModal<%= usuario.getId()%>">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <!-- Eliminar Usuario -->
                                            <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post" class="d-inline">
                                                <input type="hidden" name="accion" value="eliminar">
                                                <input type="hidden" name="id" value="<%= usuario.getId()%>">
                                                <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este usuario?');">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Modal para editar usuario -->
                            <div class="modal fade" id="editModal<%= usuario.getId()%>" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Editar Usuario</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post">
                                            <div class="modal-body">
                                                <input type="hidden" name="accion" value="actualizar">
                                                <input type="hidden" name="id" value="<%= usuario.getId()%>">
                                                <div class="mb-3">
                                                    <label class="form-label">Nombres</label>
                                                    <input type="text" name="nombres" class="form-control" value="<%= usuario.getNombre()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Apellidos</label>
                                                    <input type="text" name="apellidos" class="form-control" value="<%= usuario.getApellido()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Correo</label>
                                                    <input type="email" name="correo" class="form-control" value="<%= usuario.getEmail()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Número</label>
                                                    <input type="text" name="numero" class="form-control" value="<%= usuario.getNumero()%>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Nueva Contraseña</label>
                                                    <input type="password" name="contraseña" class="form-control" placeholder="Dejar en blanco si no cambia">
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Género</label>
                                                    <select name="genero" class="form-select" required>
                                                        <option value="Masculino" <%= usuario.getGenero().equals("Masculino") ? "selected" : ""%>>Masculino</option>
                                                        <option value="Femenino" <%= usuario.getGenero().equals("Femenino") ? "selected" : ""%>>Femenino</option>
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
                            <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
