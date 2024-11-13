
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
            int id_pedido;
            String data_pedido, valor_pedido, desc_pedido;

            // Receber os dados do formulário
            id_pedido = Integer.parseInt(request.getParameter("id_cliente"));
            data_pedido = request.getParameter("nome_usuario");
            valor_pedido = request.getParameter("nome");
            desc_pedido = request.getParameter("senha");

            try {
                // Conectar ao banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3307/Teste", "root", "");

                // Atualizar os dados do usuário na tabela Cliente
                st = conecta.prepareStatement("UPDATE pedido SET data_pedido = ?, valor_pedido = ?, desc_pedido = ? WHERE id_pedido = ?");
                st.setString(1, data_pedido);
                st.setString(2, valor_pedido);
                st.setString(3, desc_pedido); 
                st.setInt(4, id_pedido);
                
                // Executa o UPDATE na tabela do BD
                int rowsUpdated = st.executeUpdate();
                
                // Informar o usuário do sucesso da operação
                if (rowsUpdated > 0) {
                    out.print("Usuário alterado com sucesso.");
                } else {
                    out.print("Erro: Alterado não encontrado.");
                }
                
            } catch (SQLException erro) {
                out.print("Erro: " + erro.getMessage());
            } catch (ClassNotFoundException erro) {
                out.print("Erro: Driver JDBC não encontrado.");
            }
        %>        
    </body>
</html>
