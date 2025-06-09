/*!
 * Start Bootstrap - Agency v7.0.12 (https://startbootstrap.com/theme/agency)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
 */
//
// Scripts
// 




const openModalBtn = document.getElementById("openLoginModal");
const modal = document.getElementById("loginModal");
const closeModalBtn = document.querySelector("#loginModal .close");
const modalContent = document.querySelector('.modal-content.login-wrapper');
const openBtn = document.getElementById('openLoginModal');

openBtn.addEventListener('click', () => {
  modal.style.display = 'block';
  modalContent.style.animation = 'none';
  void modalContent.offsetWidth; // reinicia
  modalContent.style.animation = 'fadeInUp 0.4s ease forwards';
});
closeModalBtn.addEventListener("click", () => {
    modal.style.display = "none";
});

window.addEventListener("click", (e) => {
    if (e.target === modal) {
        modal.style.display = "none";
    }
});

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    //  Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            rootMargin: '0px 0px -40%',
        });
    }
    ;

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
            document.querySelectorAll('#navbarResponsive .nav-link')
            );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});

function openModal(id) {
    document.getElementById(id).style.display = 'block';
  }

  function closeModal(id) {
    document.getElementById(id).style.display = 'none';
  }

  // Cierra modal si se hace clic fuera del contenido
  window.addEventListener('click', function(e) {
    if (e.target.classList.contains('modal')) {
      e.target.style.display = 'none';
    }
  });
  
function validateForm() {
    const email = document.querySelector('[name="correo"]').value;
    const phone = document.querySelector('[name="numero"]').value;
    const password = document.querySelector('[name="contraseña"]').value;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert('Por favor, ingresa un correo electrónico válido.');
        return false;
    }

    const phoneRegex = /^[0-9]{9}$/;
    if (!phoneRegex.test(phone)) {
        alert('Por favor, ingresa un número de celular válido de 9 dígitos.');
        return false;
    }

    if (password.length < 8) {
        alert('La contraseña debe tener al menos 8 caracteres.');
        return false;
    }

    return true;
}
