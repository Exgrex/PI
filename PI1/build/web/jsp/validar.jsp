<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
    <%
        Connection conecta = null;
        PreparedStatement st = null;
        ResultSet resultado = null;
        String u = request.getParameter("name");
        String s = request.getParameter("password");

        try {
            // Carrega o driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Estabelece a conexão com o banco de dados
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3307/Teste", "root", "");
            
            // Prepara a consulta SQL
            String sql = "SELECT * FROM cliente WHERE nome_usuario = ? AND senha = ?";
            st = conecta.prepareStatement(sql);
            st.setString(1, u);
            st.setString(2, s);
            
            // Executa a consulta
            resultado = st.executeQuery();
            
            // Verifica se o resultado contém algum registro
            if (resultado.next()) {
                // Redireciona o usuário para o menu caso a autenticação seja bem-sucedida
                response.sendRedirect("../paginas/menu.html");
            } else {
                // Caso usuário ou senha sejam inválidos, exibe uma mensagem
                out.println("Usuário e/ou senha inválidos.");
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            // Em caso de erro, exibe uma mensagem de erro
            out.println("Erro ao acessar o banco de dados. Tente novamente.");
            e.printStackTrace();
        } finally {
            // Libera os recursos usados no banco de dados
            try {
                if (resultado != null) resultado.close();
                if (st != null) st.close();
                if (conecta != null) conecta.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
