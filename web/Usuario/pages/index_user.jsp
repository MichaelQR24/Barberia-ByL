<%@ include file="/proteger.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barbería B&L</title>
        <link rel="stylesheet" href="../css/style1.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                min-height: 100vh;
                margin: 0;
                padding: 0;
                background: url('./assets/barberiaindex.png') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', 'Segoe UI', Arial, sans-serif;
            }
            body::before {
                content: "";
                position: fixed;
                inset: 0;
                background: rgba(44,33,22,0.85);
                z-index: 0;
                pointer-events: none;
            }
            body > * {
                position: relative;
                z-index: 1;
            }
            header {
                background: rgba(44,33,22,0.97);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 18px 38px;
                border-bottom: 2px solid #d4af37;
                box-shadow: 0 2px 12px #0008;
            }
            .logo {
                display: flex;
                align-items: center;
                gap: 16px;
            }
            .logo img {
                height: 48px;
                border-radius: 7px;
            }
            .logo h1 {
                font-size: 2rem !important;
                color: #d4af37;
                margin: 0;
                letter-spacing: 2px;
                font-weight: bold;
            }
            nav ul {
                display: flex;
                gap: 28px;
                list-style: none;
                margin: 0;
                padding: 0;
            }
            nav ul li a {
                color: #fff;
                font-weight: 500;
                font-size: 1.08rem;
                text-decoration: none;
                letter-spacing: 1px;
                transition: color .2s;
            }
            nav ul li a:hover {
                color: #d4af37;
            }
            .user-icon {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .user-icon h5 {
                margin: 0;
                color: #fff;
                font-weight: 600;
                font-size: 1rem;
                transition: color .2s;
            }
            .user-icon h5:hover {
                color: #d4af37;
            }
            .user-icon img {
                height: 34px;
                border-radius: 50%;
                border: 2px solid #d4af37;
                background: #fff;
            }
            main {
                max-width: 1400px;
                margin: 40px auto 0 auto;
                padding: 0 30px;
            }
            .hero-row {
                display: flex;
                align-items: stretch;
                gap: 38px;
                margin-bottom: 38px;
            }
            .hero-img-box {
                flex: 1 1 0;
                display: flex;
                align-items: stretch;
                min-width: 320px;
                max-width: 540px;
            }
            .hero-img-box .carousel-inner img {
                border-radius: 18px;
                height: 100%;
                object-fit: cover;
                min-height: 420px;
                max-height: 520px;
                box-shadow: 0 8px 32px #0005;
            }
            .hero-text-box {
                flex: 1 1 0;
                background: rgba(44,33,22,0.93);
                border-radius: 18px;
                box-shadow: 0 8px 32px #0005;
                color: #fff;
                padding: 48px 44px 38px 44px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                min-height: 420px;
                max-height: 520px;
            }
            .hero-text-box h2 {
                font-size: 2.3rem;
                font-weight: 800;
                letter-spacing: 2px;
                color: #fff;
                margin-bottom: 10px;
                text-transform: uppercase;
            }
            .hero-text-box h3 {
                font-size: 1.09rem;
                color: #d4af37;
                margin-bottom: 18px;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
            }
            .hero-text-box p {
                font-size: 1.08rem;
                color: #eee;
                margin-bottom: 22px;
                line-height: 1.6;
            }
            .btn-reservar {
                background: none;
                color: #d4af37;
                border: 2px solid #d4af37;
                font-weight: 700;
                padding: 8px 28px;
                border-radius: 25px;
                font-size: 1.05rem;
                transition: background .2s, color .2s, box-shadow .2s;
                margin-bottom: 10px;
                display: inline-block;
            }
            .btn-reservar:hover {
                background: #d4af37;
                color: #222;
                box-shadow: 0 4px 16px #d4af3750;
            }
            /* SERVICIOS */
            .servicios-row {
                display: flex;
                gap: 36px;
                margin-bottom: 40px;
                justify-content: center;
            }
            .servicio-item {
                background: rgba(44,33,22,0.93);
                border-radius: 15px;
                box-shadow: 0 4px 18px #0002;
                padding: 22px 16px;
                color: #fff;
                flex: 1 1 0;
                min-width: 260px;
                max-width: 360px;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .servicio-item h4 {
                color: #d4af37;
                font-weight: 700;
                margin-bottom: 10px;
                font-size: 1.18rem;
                letter-spacing: 1px;
            }
            .servicio-item .carousel-inner img {
                border-radius: 10px;
                width: 100%;
                height: 210px;
                object-fit: cover;
                margin-bottom: 8px;
            }
            .servicio-item p {
                color: #eee;
                font-size: 1rem;
            }
            /* PRODUCTOS */
            .productos-section {
                background: rgba(44,33,22,0.93);
                border-radius: 15px;
                padding: 32px 24px 18px 24px;
                margin-bottom: 40px;
                box-shadow: 0 4px 18px #0002;
            }
            .productos-title {
                font-size: 1.7rem;
                color: #d4af37;
                font-weight: 700;
                margin-bottom: 18px;
                text-align: center;
                letter-spacing: 1px;
            }
            .productos-list {
                display: flex;
                flex-wrap: wrap;
                gap: 18px;
                justify-content: center;
            }
            .producto-box {
                background: rgba(255,255,255,0.13);
                border-radius: 12px;
                box-shadow: 0 2px 10px #0001;
                margin: 0 6px;
                padding: 12px 8px 10px 8px;
                text-align: center;
                transition: transform .15s;
                width: 110px;
            }
            .producto-box:hover {
                transform: translateY(-8px) scale(1.04);
                box-shadow: 0 6px 18px #d4af3740;
            }
            .producto-box img {
                width: 65px;
                height: 65px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 8px;
                border: 2px solid #d4af37;
                background: #fff;
            }
            .producto-box p {
                font-size: 0.98rem;
                font-weight: 500;
                color: #fff;
                text-shadow: 0 1px 5px #000c;
            }
            /* VALORES */
            .valores-section {
                background: rgba(44,33,22,0.93);
                border-radius: 15px;
                box-shadow: 0 4px 18px #0002;
                padding: 32px 24px 18px 24px;
                margin-bottom: 40px;
            }
            .valores-title {
                font-size: 1.5rem;
                color: #d4af37;
                font-weight: 700;
                text-align: center;
                margin-bottom: 18px;
            }
            .valores-list {
                display: flex;
                flex-wrap: wrap;
                gap: 28px;
                justify-content: center;
            }
            .valor-box {
                background: rgba(255,255,255,0.10);
                border-radius: 12px;
                padding: 18px 20px;
                color: #fff;
                width: 250px;
                text-align: center;
                box-shadow: 0 2px 10px #0001;
                margin-bottom: 10px;
            }
            .valor-box i {
                font-size: 2.1rem;
                color: #d4af37;
                margin-bottom: 8px;
            }
            .valor-box h4 {
                font-size: 1.1rem;
                color: #d4af37;
                margin-bottom: 6px;
            }
            .valor-box p {
                font-size: 1rem;
                color: #eee;
            }
            /* TESTIMONIOS */
            .testimonios-section {
                background: rgba(44,33,22,0.93);
                border-radius: 15px;
                box-shadow: 0 4px 18px #0002;
                padding: 32px 24px 18px 24px;
                margin-bottom: 40px;
            }
            .testimonios-title {
                font-size: 1.5rem;
                color: #d4af37;
                font-weight: 700;
                text-align: center;
                margin-bottom: 18px;
            }
            .testimonios-list {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }
            .testimonio-box {
                background: rgba(255,255,255,0.10);
                border-radius: 12px;
                padding: 18px 20px;
                color: #fff;
                width: 280px;
                text-align: center;
                box-shadow: 0 2px 10px #0001;
                margin-bottom: 10px;
                font-style: italic;
                font-size: 1.02rem;
            }
            .testimonio-box .autor {
                margin-top: 8px;
                font-weight: bold;
                color: #d4af37;
                font-style: normal;
            }
            /* Footer */
            footer {
                background: rgba(44,33,22,0.95);
                color: #fff;
                padding: 32px 0 12px 0;
                margin-top: 40px;
            }
            .footer-content {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                max-width: 1200px;
                margin: auto;
                padding: 0 30px;
            }
            .footer-left, .footer-right {
                width: 48%;
                font-size: 1rem;
            }
            .footer-left p, .footer-right p {
                margin-bottom: 6px;
            }
            .copyright {
                text-align: center;
                color: #d4af37;
                font-size: 1rem;
                margin-top: 18px;
                letter-spacing: 1px;
            }
            @media (max-width: 1000px) {
                .hero-row, .servicios-row, .valores-list, .testimonios-list {
                    flex-direction: column;
                    gap: 24px;
                }
                .hero-img-box, .hero-text-box {
                    max-width: 100%;
                    min-height: 320px;
                }
            }
            @media (max-width: 700px) {
                header {
                    flex-direction: column;
                    gap: 18px;
                    padding: 14px 8px;
                }
                nav ul {
                    gap: 12px;
                }
                main {
                    margin-top: 15px;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="../../assets/logo.png" alt="Barberia B&L Logo">
                <h1>Barbería B&L</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="servicios.jsp">Servicios</a></li>
                    <li><a href="productos.jsp">Productos</a></li>
                    <li><a href="sedes.jsp">Sedes</a></li>
                    <li><a href="reservas.jsp">Reservas</a></li>
                </ul>
            </nav>
            <div class="user-icon">
                <a href="<%= request.getContextPath()%>/logout" 
                   class="nav-link" 
                   onclick="return confirm('¿Estás seguro de que deseas cerrar sesión?');">
                    <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                </a>

                <img src="../../assets/user-icon.png" alt="User Icon">
            </div>
        </header>

        <main>
            <!-- HERO: Imagen y Nosotros a la par -->
            <div class="hero-row">
                <div class="hero-img-box">
                    <div class="col-md-12" id="left_section_index_1" style="width:100%;">
                        <div id="carouselExampleIndicators" class="carousel slide h-100" data-ride="carousel">
                            <div class="carousel-inner h-100">
                                <div class="carousel-item active h-100">
                                    <img src="../../assets/imagen menu1.png" class="d-block w-100 h-100" alt="Imagen 1">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="../../assets/imagen menu2.png" class="d-block w-100 h-100" alt="Imagen 2">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="../../assets/imagen menu3.png" class="d-block w-100 h-100" alt="Imagen 3">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="hero-text-box">
                    <h2>LA BARBERÍA</h2>
                    <h3>NOSOTROS</h3>
                    <p>
                        Somos un punto de barbería auténtica. Nos hemos creado nuestro propio espacio para que disfrutes de cortes y afeitados de calidad en un ambiente que combina lo clásico y lo moderno. Nuestro equipo te espera con experiencia y pasión.
                    </p>
                    <a href="reservas.jsp" class="btn btn-reservar">Reservar cita</a>
                </div>
            </div>

            <!-- SERVICIOS -->
            <div class="servicios-row">
                <div class="servicio-item">
                    <h4>Corte de Cabello</h4>
                    <div id="carruselCorteCabello" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../assets/CorteDeCabello1.png" class="d-block w-100" alt="Corte de Cabello 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/CorteDeCabello2.png" class="d-block w-100" alt="Corte de Cabello 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/CorteDeCabello3.png" class="d-block w-100" alt="Corte de Cabello 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselCorteCabello" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselCorteCabello" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                    <p>Desde estilos clásicos hasta las últimas tendencias. ¡Déjate asesorar!</p>
                </div>
                <div class="servicio-item">
                    <h4>Afeitado Clásico</h4>
                    <div id="carruselAfeitadoClasico" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../assets/AfeitadoClasico1.png" class="d-block w-100" alt="Afeitado Clásico 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/AfeitadoClasico2.png" class="d-block w-100" alt="Afeitado Clásico 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/AfeitadoClasico3.png" class="d-block w-100" alt="Afeitado Clasico 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselAfeitadoClasico" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselAfeitadoClasico" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                    <p>Afeitado tradicional con toalla caliente y productos exclusivos.</p>
                </div>
            </div>

            <!-- PRODUCTOS -->
            <section class="productos-section">
                <div class="productos-title">Nuestros Productos</div>
                <div class="productos-list">
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto1.png" alt="Producto 1">
                        <p>Pomada Fijadora</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto2.png" alt="Producto 2">
                        <p>Cera Mate</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto3.png" alt="Producto 3">
                        <p>Shampoo para Barba</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto4.png" alt="Producto 4">
                        <p>Aceite para Barba</p>
                    </div>
                    <div class="producto-box">
                        <img src="../../assets/servicios-producto5.png" alt="Producto 5">
                        <p>After Shave</p>
                    </div>
                </div>
            </section>

            <!-- VALORES DE LA BARBERÍA -->
            <section class="valores-section">
                <div class="valores-title">Nuestra Esencia y Valores</div>
                <div class="valores-list">
                    <div class="valor-box">
                        <i class="fas fa-gem"></i>
                        <h4>Calidad Premium</h4>
                        <p>Nos esforzamos por ofrecerte solo lo mejor en cada servicio y producto.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-heart"></i>
                        <h4>Atención Personalizada</h4>
                        <p>Cada cliente es único, por eso te asesoramos y cuidamos como mereces.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-users"></i>
                        <h4>Ambiente Familiar</h4>
                        <p>Un espacio donde te sentirás cómodo, relajado y parte de la familia B&L.</p>
                    </div>
                    <div class="valor-box">
                        <i class="fas fa-star"></i>
                        <h4>Innovación y Tendencia</h4>
                        <p>Siempre a la vanguardia en estilos, técnicas y productos para ti.</p>
                    </div>
                </div>
            </section>

            <!-- TESTIMONIOS -->
            <section class="testimonios-section">
                <div class="testimonios-title">Lo que dicen nuestros clientes</div>
                <div class="testimonios-list">
                    <div class="testimonio-box">
                        "¡Excelente atención y los mejores cortes! Recomiendo Barbería B&L al 100%."
                        <div class="autor">- Luis G.</div>
                    </div>
                    <div class="testimonio-box">
                        "Ambiente súper cómodo y barberos profesionales. ¡Volveré siempre!"
                        <div class="autor">- Ricardo M.</div>
                    </div>
                    <div class="testimonio-box">
                        "Productos de calidad y un trato increíble. Mi barba nunca estuvo mejor."
                        <div class="autor">- Juan P.</div>
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-left">
                    <p><strong>Contacto:</strong> +51 997 259 085 / +51 950 758 586</p>
                    <p><strong>Dirección:</strong> Cdr 3. Calle Teselia, San Carlos, San Juan de Lurigancho</p>
                    <p><strong>Teléfono:</strong> (123) 456-7890</p>
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
