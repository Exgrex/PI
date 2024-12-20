<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibição de Clientes</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        
        <%
            // Declara as variáveis
            Connection conecta = null;
            PreparedStatement st = null;
            ResultSet resultado = null;

            try {
                // Aponta para a biblioteca JDBC
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/Teste", "root", "");

                // Consulta os dados da tabela cliente
                st = conecta.prepareStatement("SELECT id_cliente, nome_usuario, nome, senha FROM cliente");

                // Executa a consulta
                resultado = st.executeQuery(); 

                // Inicia a tabela HTML
                out.print("<table>");
                out.print("<tr><th>ID Cliente</th><th>Nome de Usuário</th><th>Nome</th><th>Senha</th></tr>");

                // Preenche a tabela com os dados da consulta
                while(resultado.next()){
                    out.print("<tr>" +
                              "<td>" + resultado.getInt("id_cliente") + "</td>" +
                              "<td>" + resultado.getString("nome_usuario") + "</td>" +
                              "<td>" + resultado.getString("nome") + "</td>" +
                              "<td>" + resultado.getString("senha") + "</td>" +
                              "</tr>");
                }
                out.print("</table>");

            } catch (SQLException e) {
                out.print("Erro ao acessar o banco de dados: " + e.getMessage());
            } catch (ClassNotFoundException e) {
                out.print("Erro ao carregar o driver JDBC: " + e.getMessage());
            } finally {
                // Fechar os recursos
                if (resultado != null) try { resultado.close(); } catch (SQLException e) { }
                if (st != null) try { st.close(); } catch (SQLException e) { }
                if (conecta != null) try { conecta.close(); } catch (SQLException e) { }
            }
        %>
        
    </body>
</html>
