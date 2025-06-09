<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos | Barbería B&L</title>
        <link rel="stylesheet" href="../css/productos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header style="display: flex; flex-direction: row;">  
            <div class="logo">
                <img src="../../assets/logo.png" alt="Barbería B&L Logo">
                <h1 style="font-size: 35px !important;">Barbería B&L</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index_user.jsp">Inicio</a></li>
                    <li><a href="servicios.jsp">Servicios</a></li>
                    <li><a href="productos.jsp">Productos</a></li>
                    <li><a href="sedes.jsp">Sedes</a></li>
                    <li><a href="reservas.jsp">Reservas</a></li>
                </ul>
            </nav>
            <div style="display: flex; flex-direction: row;" class="user-icon">
                <a href="<%= request.getContextPath()%>/logout" 
                   class="nav-link" 
                   onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                    <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                </a>

                <img src="../../assets/user-icon.png" alt="User Icon">
            </div>
        </header>
        <main>
            <div class="producto-container">
                <!-- Fila 1 -->
                <div class="producto-box">
                    <img src="../../assets/servicios-producto1.png" alt="Talco para Hombre">
                    <p>TALCO PARA HOMBRE</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="1">
                        <input type="hidden" name="nombre" value="TALCO PARA HOMBRE">
                        <input type="hidden" name="precio" value="10.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto2.png" alt="Gel para Cabello">
                    <p>GEL PARA CABELLO</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="2">
                        <input type="hidden" name="nombre" value="GEL PARA CABELLO">
                        <input type="hidden" name="precio" value="20.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto3.png" alt="Crema para la Cara">
                    <p>CREMA PARA LA CARA</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="3">
                        <input type="hidden" name="nombre" value="CREMA PARA LA CARA">
                        <input type="hidden" name="precio" value="30.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto4.png" alt="Nombre del Producto 4">
                    <p>NOMBRE DEL PRODUCTO 4</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="4">
                        <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 4">
                        <input type="hidden" name="precio" value="40.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto5.png" alt="Crema para Granos">
                    <p>CREMA PARA GRANOS</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="5">
                        <input type="hidden" name="nombre" value="CREMA PARA GRANOS">
                        <input type="hidden" name="precio" value="50.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <!-- Fila 2 -->
                <div class="producto-box">
                    <img src="../../assets/servicios-producto6.png" alt="Gel Moco de Gorila">
                    <p>GEL MOCO DE GORILA</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="6">
                        <input type="hidden" name="nombre" value="GEL MOCO DE GORILA">
                        <input type="hidden" name="precio" value="60.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto7.png" alt="Sprite Hidratante">
                    <p>SPRITE HIDRATANTE</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="7">
                        <input type="hidden" name="nombre" value="SPRITE HIDRATANTE">
                        <input type="hidden" name="precio" value="70.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto8.png" alt="Pomada para Hombre">
                    <p>POMADA PARA HOMBRE</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="8">
                        <input type="hidden" name="nombre" value="POMADA PARA HOMBRE">
                        <input type="hidden" name="precio" value="80.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto9.png" alt="Crema para Hidratar el Cabello">
                    <p>CREMA PARA HIDRATAR EL CABELLO</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="9">
                        <input type="hidden" name="nombre" value="CREMA PARA HIDRATAR EL CABELLO">
                        <input type="hidden" name="precio" value="90.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
                <div class="producto-box">
                    <img src="../../assets/servicios-producto10.png" alt="Crema de Mascarilla">
                    <p>CREMA DE MASCARILLA</p>
                    <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                        <input type="hidden" name="idProducto" value="10">
                        <input type="hidden" name="nombre" value="CREMA DE MASCARILLA">
                        <input type="hidden" name="precio" value="100.00">
                        <button type="submit">Añadir al carrito</button>
                    </form>
                </div>
            </div>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-left">
                    <p>Contacto: +51 997 259 085 / +51 950 758 586</p>
                    <p>Dirección: Cdr 3. Calle Teselia, San Carlos, San Juan de Lurigancho</p>
                    <p>Teléfono: (123) 456-7890</p>
                </div>
                <div class="footer-right">
                    <p>Cancelaciones con 24 horas de anticipación.</p>
                    <p>Reembolsos no disponibles.</p>
                    <p>Diseño web: "Los Terreneitor de San Carlos"</p>
                </div>
            </div>
            <div class="copyright">
                <p>© 2024 Barbería B&L. Todos los derechos reservados.</p>
            </div>
        </footer>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
