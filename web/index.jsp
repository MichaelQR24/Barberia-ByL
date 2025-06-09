<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barbería B&L</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="index.css" rel="stylesheet" />

    </head>
    <body>
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/ByLogo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse w-100 text-center navbar-nav" id="navbarResponsive">
                    <ul class="navbar-nav  ms-auto py-4 py-lg-0">
                        <li class="nav-item w-100"><a class="nav-link" href="#services">Nosotros</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="#portfolio">Servicios</a></li>                       
                        <li class="nav-item w-100"><a class="nav-link" href="#about">Historia</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="#team">Team</a></li>
                        <li class="nav-item w-100"><a class="nav-link" href="#contact">Contacto</a></li>
                    </ul>
                    <!-- Botones de sesión -->
                    <div class="d-flex ms-lg-3">
                        <button id="openLoginModal" class="btn btn-outline-light me-2">Iniciar Sesión</button>
                        <a href="javascript:void(0)" onclick="openModal('registroUsuario')" class="btn btn-light">Registrarse</a>
                    </div>



                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Bienvenidos!</div>
                <div class="masthead-heading text-uppercase">Donde El Estilo Encuentra Su Esencia</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Mas de Nosotros</a>
            </div>
        </header>       
        <!-- Empresas -->
        <div class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/empresa4.svg" alt="..."  /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/empresa3.svg" alt="..."  /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/empresa2.svg" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/empresa6.svg" alt="..." /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Nosotros-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Sobre Nosotros</h2>
                    <h3 class="section-subheading text-muted">Desde el servicio hasta la seguridad, te ofrecemos mucho más que un corte.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Tienda Exclusiva</h4>
                        <p class="text-muted">Accede a productos profesionales para el cuidado de tu barba y cabello.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Reserva Online</h4>
                        <p class="text-muted">Elige tu barbero, tu servicio y tu horario desde cualquier dispositivo.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Confianza y Seguridad</h4>
                        <p class="text-muted">Tus datos y tu experiencia están protegidos.</p>
                    </div>
                </div>
            </div>
        </section>
        <!--servicios-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Nuestros Servicios</h2>
                    <h3 class="section-subheading text-muted">Transformamos tu look, realzamos tu actitud.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/corteclasico.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Corte clásico</div>
                                <div class="portfolio-caption-subheading text-muted">Estilo tradicional con acabado profesional.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/cortemoderno.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Corte moderno</div>
                                <div class="portfolio-caption-subheading text-muted">Cortes con técnicas como low, mid o high fade.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/corteinfantil.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Corte infantil</div>
                                <div class="portfolio-caption-subheading text-muted">Paciencia y precisión para los más pequeños.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/perfiladobarba.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Perfilado de barba</div>
                                <div class="portfolio-caption-subheading text-muted">Contorno perfecto según tu rostro.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/disenio.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Diseño personalizado</div>
                                <div class="portfolio-caption-subheading text-muted">Líneas, figuras o detalles artísticos.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/coloracion.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Coloración de Cabello</div>
                                <div class="portfolio-caption-subheading text-muted">Tinte, cobertura de canas o efectos modernos.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Historia-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Nuestra Historia</h2>
                    <h3 class="section-subheading text-muted">Una historia forjada con tijeras, pasión y confianza.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2017-2019</h4>
                                <h4 class="subheading">Nuestros Primeros Trazos</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">La pasión por el arte del barbero nació en un pequeño local de barrio, donde cada corte se hacía con dedicación, tijera en mano y sueños por delante. Durante estos años, Barbería B&L se forjó con esfuerzo, ganando confianza y fidelidad en cada cliente atendido. Lo que empezó como un sueño personal, se convirtió en una marca con identidad propia.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Marzo 2020</h4>
                                <h4 class="subheading">Resiliencia en Tiempos Difíciles</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">La pandemia supuso un desafío global, y en B&L no fue la excepción. Pero lejos de detenernos, adaptamos nuestros protocolos, fortalecimos nuestros canales digitales y demostramos que la verdadera barbería no solo corta cabello, también cultiva vínculos. Fue el año en que entendimos que nuestra esencia va más allá del local físico.</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Diciembre 2023</h4>
                                <h4 class="subheading">Renovación y Expansión</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Con una nueva visión, renovamos nuestra imagen y abrimos una segunda sede. Incorporamos nuevos servicios, tecnología de reservas online y formamos un equipo de barberos altamente capacitados. B&L pasó de ser un negocio familiar a consolidarse como una barbería de referencia en la ciudad.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Enero 2025</h4>
                                <h4 class="subheading">El Futuro se Corta Aquí</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Hoy, Barbería B&L no solo ofrece servicios, ofrece una experiencia. Con presencia digital sólida, alianzas estratégicas y una comunidad leal, nuestro objetivo es seguir creciendo sin perder lo más importante: la calidad humana y el amor por nuestro oficio. Porque el futuro también se construye con estilo.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                Nuestra
                                <br />
                                Historia
                                <br />
                                Continua!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Nuestro Team</h2>
                    <h3 class="section-subheading text-muted">Manos expertas, corazones comprometidos.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/Lucas.jpg" alt="..." />
                            <h4>Lucas</h4>
                            <p class="text-muted">Fade Maestro</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" ><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" ><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" ><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/Henrry.jpg" alt="..." />
                            <h4>Henrry</h4>
                            <p class="text-muted">Barba Precisa</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/Gotti.jpg" alt="..." />
                            <h4>Gotti</h4>
                            <p class="text-muted">Estilo Urbano</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Nuestro team de barberos combina técnica, creatividad y pasión en cada corte. Son artistas de la imagen que entienden tu estilo, lo perfeccionan y lo transforman en una experiencia única que vas a querer repetir.</p></div>
                </div>
            </div>
        </section>       
        <!-- Contacto-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contáctanos</h2>
                    <h3 class="section-subheading text-muted">
                        ¿Deseas reservar un servicio, tienes una duda o necesitas ayuda? Nuestro equipo está listo para atenderte.
                    </h3>
                </div>

                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                    <div class="row align-items-stretch mb-5">
                        <!-- Datos personales -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <input class="form-control" id="name" type="text" placeholder="Tu nombre completo *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required">Por favor, ingresa tu nombre.</div>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="email" type="email" placeholder="Correo electrónico *" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">Por favor, ingresa tu correo.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Formato de correo inválido.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <input class="form-control" id="phone" type="tel" placeholder="Número de teléfono *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">Por favor, ingresa tu teléfono.</div>
                            </div>
                        </div>

                        <!-- Mensaje -->
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <textarea class="form-control" id="message" placeholder="Escribe aquí tu mensaje o consulta *" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">Por favor, escribe un mensaje.</div>
                            </div>
                        </div>
                    </div>

                    <!-- Mensaje de éxito -->
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-success mb-3">
                            <div class="fw-bolder">¡Mensaje enviado con éxito!</div>
                            Pronto nos pondremos en contacto contigo.
                        </div>
                    </div>

                    <!-- Mensaje de error -->
                    <div class="d-none" id="submitErrorMessage">
                        <div class="text-center text-danger mb-3">¡Error al enviar el mensaje! Intenta nuevamente.</div>
                    </div>

                    <!-- Botón -->
                    <div class="text-center">
                        <button class="btn btn-warning btn-xl text-uppercase disabled" id="submitButton" type="submit">
                            Enviar mensaje
                        </button>
                    </div>
                </form>
            </div>
        </section>



        <!-- Servicios Modals-->
        <!-- Servicio item 1 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Corte Clasico</h2>
                                    <p class="item-intro text-muted">Estilo tradicional con acabado profesional.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/corteclasico.jpg" alt="..." />
                                    <p>Un corte temporal que nunca pasa de moda. Ideal para quienes buscan elegancia y sobriedad. Realizado con precisión para mantener un estilo limpio, simétrico y prolijo, perfecto para cualquier ocasión.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Servicio item 2 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Corte Moderno</h2>
                                    <p class="item-intro text-muted">Cortes con técnicas como low, mid o high fade.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/cortemoderno.jpg" alt="..." />
                                    <p>Estilo urbano con carácter. Incluye técnicas como fade, taper o undercut para un look fresco y actual. Adaptamos cada corte a tu personalidad, siguiendo las últimas tendencias y cuidando cada detalle.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Servicio item 3 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Corte infantil</h2>
                                    <p class="item-intro text-muted">Paciencia y precisión para los más pequeños.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/corteinfantil.jpg" alt="..." />
                                    <p>Experiencia amigable y divertida para los más pequeños. Cortes modernos o clásicos realizados con paciencia y cuidado, garantizando comodidad y un acabado impecable para los reyes de la casa.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Servicio item 4 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Perfilado de barba</h2>
                                    <p class="item-intro text-muted">Contorno perfecto según tu rostro.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/perfiladobarba.jpg" alt="..." />
                                    <p>Dale forma y carácter a tu barba. Contorneamos y alineamos según tu tipo de rostro, eliminando exceso de vello y realzando tu estilo. Incluye toalla caliente para mayor confort y precisión.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Servicio item 5 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Diseño Personalizado</h2>
                                    <p class="item-intro text-muted">Líneas, figuras o detalles artísticos.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/disenio.jpg" alt="..." />
                                    <p>Exprésate con estilo. Creamos líneas, figuras, logos o trazos artísticos en el cabello, ajustados a tu gusto. Ideal para quienes buscan destacar con creatividad y originalidad en su look.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Servicio item 6 modal -->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="assets/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">Coloración de Cabello</h2>
                                    <p class="item-intro text-muted">Tinte, cobertura de canas o efectos modernos.</p>
                                    <img class="img-fluid d-block mx-auto" src="assets/coloracion.jpg" alt="..." />
                                    <p>Transforma tu imagen con colores vibrantes o discretos. Aplicamos tintes para cubrir canas, lograr efectos modernos o simplemente renovar tu estilo. Incluye diagnóstico capilar y asesoría personalizada.</p>

                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-xmark me-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Selección de Usuario/Admin -->
        <div id="loginModal" class="modal">
            <div class="modal-content login-wrapper">
                <span class="close" onclick="closeModal('loginModal')">&times;</span>
                <div class="login-left">
                    <a class="navbar-brand" href="#page-top"><img src="assets/ByLogo.svg" alt="..." /></a>
                    <h2>Tradición, Estilo y Elegancia Masculina</h2>
                    <p>Selecciona cómo deseas ingresar para continuar.</p>

                    <!-- Usuario -->
                    <div class="btn-center-group">
                        <button class="btn-access" onclick="openModal('adminUser')">
                            <i class="fas fa-user"></i> Ingresar como Usuario
                        </button>

                        <!-- Administrador -->
                        <button class="btn-access" onclick="openModal('adminModal')">
                            <i class="fas fa-user-shield"></i> Ingresar como Administrador
                        </button>
                    </div>

                    <div class="mt-4 text-muted text-center">© Barbería B&amp;L 2025</div>
                </div>
                <div class="login-right">
                    <img src="assets/BarberPreLogin.jpg" />
                </div>
            </div>
        </div>

        <!-- Modal de Login Administrador -->
        <div id="adminModal" class="modal">
            <div class="modal-content login-wrapper">
                <span class="close" onclick="closeModal('adminModal')">&times;</span>
                <div class="login-left">
                    <h2>Iniciar Sesión</h2>
                    <h2>Administrador</h2>
                    <form action="svAdministrador" method="post" novalidate style="width:100%;max-width:360px;text-align:left;">
                        <label for="username">Correo Electrónico</label>
                        <input type="text" id="username" name="username" placeholder="Ingresa tu correo" required autocomplete="username" />

                        <label for="password">Contraseña</label>
                        <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required autocomplete="current-password" />

                        <button type="submit" class="btn-access">Entrar</button>
                    </form>
                    <% String error = request.getParameter("error"); %>
                    <% if ("invalid".equals(error)) { %>
                    <div class="message-box error">Usuario o contraseña incorrectos. Por favor, verifica tus datos.</div>
                    <% } else if ("error".equals(error)) { %>
                    <div class="message-box warning">Hubo un error inesperado. Inténtalo nuevamente más tarde.</div>
                    <% }%>
                    <div class="mt-4 text-muted text-center">© Barbería B&amp;L 2025</div>
                </div>
                <div class="login-right">
                    <img src="assets/BarberPreLogin.jpg" />
                </div>
            </div>
        </div>

        <!-- Modal de Login Usuario -->
        <div id="adminUser" class="modal">
            <div class="modal-content login-wrapper">
                <span class="close" onclick="closeModal('adminUser')">&times;</span>

                <!-- Panel izquierdo: formulario de login -->
                <div class="login-left">
                    <h2>Iniciar Sesión</h2>
                    <h2>Cliente</h2>
                    <form action="/Proyecto-Barberia-BYL/LoginServlet" method="post" novalidate style="width:100%;max-width:360px;text-align:left;">
                        <label for="correo-cuadro1-login-usuario">Correo Electrónico:</label>
                        <input type="email" id="correo-cuadro1-login-usuario" name="email" placeholder="Ingresa tu correo" required autocomplete="email" />

                        <label for="password-cuadro1-login-usuario">Contraseña:</label>
                        <input type="password" id="password-cuadro1-login-usuario" name="contraseña" placeholder="Ingresa tu contraseña" required autocomplete="current-password" />

                        <button type="submit" class="btn-access">Entrar</button>

                        <!-- Recuperar contraseña -->
                        <a href="javascript:void(0)" onclick="openModal('RecuperarContra')" class="mt-4 text-muted text-center" style="font-size: 13px; color: #3b2e20; text-decoration: none; display: block; margin-top: 8px;">
                            ¿Olvidaste tu contraseña?
                            <span style="color: #1D1D30; margin-left: 8px;">Recuperar</span>
                        </a>

                        <!-- Registrarse -->
                        <a href="javascript:void(0)" onclick="openModal('registroUsuario')" class="mt-4 text-muted text-center" style="font-size: 13px; color: #3b2e20; text-decoration: none; display: block; margin-top: 8px;">
                            ¿Aún no tienes una cuenta?
                            <span style="color: #1D1D30; margin-left: 8px;">Regístrate</span>
                        </a>
                    </form>
                    <div class="mt-4 text-muted text-center">© Barbería B&amp;L 2025</div>
                </div>


                <!-- Panel derecho: registro -->
                <div class="login-right">
                    <img src="assets/BarberPreLogin.jpg" />
                </div>
            </div>
        </div>



        <!-- Modal de Recuperar Contraseña Usuario -->
        <div id="RecuperarContra" class="modal">
            <div class="modal-content login-wrapper">
                <span class="close" onclick="closeModal('RecuperarContra')">&times;</span>

                <!-- Panel izquierdo: formulario de recuperación -->
                <div class="login-left">                  
                    <h2>¡Tranquilo SOBRINO!</h2>
                    <p>En breves podrás recuperar tu contraseña</p>

                    <form style="width:100%; max-width:360px; text-align:left;">
                        <label for="correo-recuperar-usuario">Ingresa tu correo electrónic o numero de telefono</label>
                        <input type="email" id="correo-recuperar-usuario" placeholder="Correo electrónico" required>
                        <button type="button" class="btn-access">Recuperar</button>
                    </form>
                    <div class="mt-4 text-muted text-center">© Barbería B&amp;L 2025</div>
                </div>


                <!-- Panel derecho -->
                <div class="login-right">
                    <img src="assets/BarberPreLogin.jpg" />
                </div>
            </div>
        </div>

        <!-- Modal de Registro de Usuario -->
        <div id="registroUsuario" class="modal">
            <div class="modal-content login-wrapper">
                <span class="close" onclick="closeModal('registroUsuario')">&times;</span>

                <!-- Panel izquierdo: formulario de registro -->
                <div class="login-left">
                    <h2>Regístrate</h2>
                    <form 
                        action="/Proyecto-Barberia-BYL/UsuarioServlet" 
                        method="post" 
                        onsubmit="return validateForm()" 
                        style="width:100%; max-width:360px; text-align:left;">

                        <!-- Cambiado a 'registrar' para redirigir a index_user.jsp -->
                        <input type="hidden" name="accion" value="registrar">

                        <div style="display:flex; flex-direction: column; gap: 10px;">
                            <input type="text" name="nombres" placeholder="Nombres" required pattern="[A-Za-zÁáÉéÍíÓóÚú\s]+" title="Solo se permiten letras">

                            <input type="text" name="apellidos" placeholder="Apellidos" required pattern="[A-Za-zÁáÉéÍíÓóÚú\s]+" title="Solo se permiten letras">

                            <input type="email" name="correo" placeholder="Correo Electrónico" required>

                            <input type="tel" name="numero" placeholder="Número de celular" required pattern="[0-9]{9}" title="Ingresa un número de 9 dígitos">

                            <input type="password" name="contraseña" placeholder="Contraseña" required minlength="8" title="La contraseña debe tener al menos 8 caracteres.">

                            <select name="genero" required class="form-select-custom">
                                <option value="" disabled selected>--Seleccionar Género--</option>
                                <option value="Femenino">Femenino</option>
                                <option value="Masculino">Masculino</option>
                                <option value="no_decirlo">Prefiero no decirlo</option>
                            </select>

                            <button id="boton-cuadro1-registrate-usuario" type="submit" class="btn-access">Registrarse</button>

                            <!-- Ya tengo cuenta -->
                            <a href="javascript:void(0)" onclick="closeModal('registroUsuario'); openModal('adminUser')" 
                               class="mt-4 text-muted text-center" 
                               style="font-size: 13px; color: #3b2e20; text-decoration: none; display: block; margin-top: 8px;">
                                ¿Ya tienes una cuenta?
                                <span style="color: #1D1D30; margin-left: 8px;">Inicia Sesión</span>
                            </a>
                        </div>
                    </form>
                    <div class="mt-4 text-muted text-center">© Barbería B&L 2025</div>
                </div>
            </div>
        </div>





        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Barberia ByL 2025</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Politica Privacidad</a>
                        <a class="link-dark text-decoration-none" href="#!">Informacion</a>
                    </div>
                </div>
            </div>
        </footer>


        <script src="index.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>