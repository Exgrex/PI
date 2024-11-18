<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Validar</title>
</head>
<body>
    <%
        Connection conecta = null;
        PreparedStatement st = null;
        ResultSet resultado = null;
        String u = request.getParameter("name");
        String s = request.getParameter("password");

        if (u == null || u.trim().isEmpty() || s == null || s.trim().isEmpty()) {
            out.println("Usuário ou senha não podem estar vazios.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Carrega o driver do MySQL
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bolos", "root", "root"); // Conexão ao BD
            String sql = "SELECT * FROM cliente WHERE nome_usuario = ? AND senha = ?";
            st = conecta.prepareStatement(sql);
            st.setString(1, u);
            st.setString(2, s);
            resultado = st.executeQuery();

            if (resultado.next()) {
                response.sendRedirect("../paginas/menu.html");
            } else {
                out.println("Usuário ou senha inválidos.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Erro ao acessar o banco de dados.");
        } finally {
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
