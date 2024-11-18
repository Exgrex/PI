document.addEventListener("DOMContentLoaded", function() {
    const overlay = document.getElementById('overlay');
    const dropdowns = document.querySelectorAll(".dropdown_Usuarios");
    const closeButton = document.getElementById('closePopupBtnRegister');

    // Função para abrir o modal
    function openModal(modal) {
        modal.classList.add('active');  // Adiciona a classe 'active' para ativar a animação
        overlay.classList.add('active');  // Torna o overlay visível
    }

    // Função para fechar o modal
    function closeModal(modal) {
        modal.classList.remove('active');  // Remove a classe 'active' para desativar a animação
        // Verifica se não há outros modais ativos
        const activeModals = document.querySelectorAll('.modal.active');
        if (activeModals.length === 0) {
            overlay.classList.remove('active');  // Torna o overlay invisível se não houver modais ativos
        }
    }

    // Fecha o modal ao clicar no overlay
    overlay.addEventListener('click', function() {
        const activeModal = document.querySelector('.modal.active');
        if (activeModal) {
            closeModal(activeModal);
        }
    });

    // Função para alternar a exibição do submenu
    function toggleDropdown(event, dropdownId) {
        event.preventDefault();
        const dropdown = document.getElementById(dropdownId);

        // Fecha todos os outros dropdowns
        dropdowns.forEach(menu => {
            if (menu !== dropdown) {
                menu.style.display = "none";
            }
        });

        // Alterna a exibição do dropdown
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    // Função para adicionar eventos aos links principais
    function addDropdownEventListeners() {
        document.getElementById("nav-link-users").addEventListener("click", function(event) {
            toggleDropdown(event, "dropdown-users");
        });

        document.getElementById("nav-link-products").addEventListener("click", function(event) {
            toggleDropdown(event, "dropdown-products");
        });

        document.getElementById("nav-link-orders").addEventListener("click", function(event) {
            toggleDropdown(event, "dropdown-orders");
        });

        document.getElementById("nav-link-stores").addEventListener("click", function(event) {
            toggleDropdown(event, "dropdown-stores");
        });
    }

    // Função de setup para abrir o modal ao clicar no botão de cadastrar
    function setupModalButton() {
        const cadastrarButtons = document.querySelectorAll('.nav__link__drop a');
        cadastrarButtons.forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                const targetModal = document.getElementById(event.target.dataset.modal);
                if (targetModal) {
                    openModal(targetModal);
                }
            });
        });
    }

    // Evento de clique no botão "Skip" para fechar o modal
    if (closeButton) {
        closeButton.addEventListener('click', function(event) {
            const modal = event.target.closest('.modal'); // Encontrando o modal mais próximo do botão
            if (modal) {
                closeModal(modal); // Fecha o modal ao clicar no botão "Skip"
            }
        });
    }

    // Inicializa as funções
    addDropdownEventListeners();
    setupModalButton();
});
