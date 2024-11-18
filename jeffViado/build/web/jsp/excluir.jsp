<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir</title>
    </head>
    <body>
        <% 
            Connection conecta = null;
            PreparedStatement st = null;

            try {
                // Receber o ID do produto a ser excluído
                  String id = request.getParameter("id");
                

                /* Conectar com o banco de dados */
                Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bolos", "root", "p@$$w0rd");

                /* Excluir produto do banco de dados */
                st = conecta.prepareStatement("DELETE FROM cliente WHERE id_cliente = ?");
                st.setString(1, id); // Define o valor do parâmetro ID

                int status = st.executeUpdate(); // Executa o DELETE na tabela do DB

                if (status == 1) {
                    out.print("ID excluído com sucesso.");
                } else {
                    out.print("ID não encontrado.");
                }

            } catch (Exception e) {
                out.print("Erro ao excluir o matricula " + e.getMessage());
            } finally {
                // Fechar recursos para evitar vazamento de memória
                if (st != null) try { st.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conecta != null) try { conecta.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </body>
</html>
