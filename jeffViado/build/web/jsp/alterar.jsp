<%-- 
    Document   : atualizar_usuario
    Created on : 11 de nov. de 2024
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Usuário</title>
    </head>
    <body>
        <%
            // Declarar as variáveis de conexão e os dados do usuário
            Connection conecta;
            PreparedStatement st;
            int id_cliente;
            String nome_usuario, nome, senha;

            // Receber os dados do formulário
            id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            nome_usuario = request.getParameter("nome_usuario");
            nome = request.getParameter("nome");
            senha = request.getParameter("senha");

            try {
                // Conectar ao banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bolos", "root", "p@$$w0rd");

                // Atualizar os dados do usuário na tabela Cliente
                st = conecta.prepareStatement("UPDATE cliente SET nome_usuario = ?, nome = ?, senha = ? WHERE id_cliente = ?");
                st.setString(1, nome_usuario);
                st.setString(2, nome);
                st.setString(3, senha); // Considere usar hash para senhas antes de salvar
                st.setInt(4, id_cliente);
                
                // Executa o UPDATE na tabela do BD
                int rowsUpdated = st.executeUpdate();
                
                // Informar o usuário do sucesso da operação
                if (rowsUpdated > 0) {
                    out.print("Usuário alterado com sucesso.");
                } else {
                    out.print("Erro: Usuário não encontrado.");
                }
                
            } catch (SQLException erro) {
                out.print("Erro: " + erro.getMessage());
            } catch (ClassNotFoundException erro) {
                out.print("Erro: Driver JDBC não encontrado.");
            }
        %>        
    </body>
</html>
