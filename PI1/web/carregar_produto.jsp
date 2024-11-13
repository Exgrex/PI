<%-- 
    Document   : consultar
    Created on : 3 de set. de 2024, 11:11:28
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*Declaração de variaveis*/
            String i;
            Connection conecta;
            PreparedStatement st;
            ResultSet resultado;
            /* Receber o id digitado no formulário*/
            i = request.getParameter("id");
            /* Conectar com o banco de dados...*/
            Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "p@$$w0rd");
            /*verificar se o produto com o id informado está na tabela do banco de dados*/
            st = conecta.prepareStatement("SELECT * FROM produtos WHERE id=?");
            st.setString(1, i);//coloca o conteudo da variavel i no Select
            resultado = st.executeQuery();//Executa o Select e armazena os dados do usuário
            /*Verifica se o id foi encontrado na tabela do Banco de daos*/
            if (resultado.next()) { //se foi encontrado
        %>
        <form method="post" action="atualizar_produtos.jsp">
            <p>
                <label for="i">ID</label>
                <input id="i" type="number" min="0" step="1" name="id" value="<%= resultado.getString("id")%>" readonly>
            </p>
            <p>
                <label for="n">Nome</label>
                <input id="n" type="text" name="nome" maxlength="50" size="50" value="<%= resultado.getString("nome")%>" required>
            </p>
            <p>
                <label for="m">Marca</label>
                <input id="m" type="text" name="marca" maxlength="40" size="40" value="<%= resultado.getString("marca")%>">
            </p>
            <p>
                <label for="p">Preço</label>
                <input id="p" type="number" name="preco" min="0" step="0.01" value="<%= resultado.getString("preco")%>" required>
            </p>
            <p>
                <label for="d">Data de fabricação</label>
                <input id="d" type="date" name="data_fab" value="<%= resultado.getString("data_fab")%>">
            </p>
            <p>
                <input type="submit" value="Salvar Alteração">
            </p>
        </form>
        <%
            } else { //se não foi encontrado
                out.print("Produto não cadastrado");
            }

        %>
    </body>
</html>
