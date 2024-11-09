<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt-br">
    <head>
        <title>Meu Site</title> <!-- titulo do site -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">


    </head>
    <body>
        <header>
            <div class="logo">
                <img src="logo.png.webp" alt="Logotipo da amazon">
            </div>

            <div class="texto">
                <h1>
                    Controle de produtos
                </h1>
            </div>



            <div class="saudacao">
                <p> 
                    Bem vindo,<%= request.getParameter("nome")%>
                </p>
            </div>

        </header>

        <nav>
            <a href="cadastrar_produtos.html" target="conteudo">Cadastro</a>
            <a href="alterar_produtos.html" target="conteudo">Alterar</a>
            <a href="consultar_produtos.html" target="conteudo">Consultar</a>
            <a href="listar_produtos.jsp" target="conteudo">Listar</a>
            <a href="excluir_produtos.html" target="conteudo">Excluir</a>
 
            
           

        </nav>
        <main>
            <iframe src="inicio.html" name="conteudo" class="quadro"></iframe>
        </main>
        <footer>

        </footer>
    </body>
</html>


