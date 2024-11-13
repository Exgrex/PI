<%-- 
    Document   : consultar
    Created on : 3 de set. de 2024, 11:11:28
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            out.print("ID:" + resultado.getString("id")+"<br>");
            out.print("Nome:" + resultado.getString("nome")+"<br>");
            out.print("Marca:" + resultado.getString("marca")+"<br>");
            out.print("Preço:" + resultado.getString("preco")+"<br>");
            out.print("Data de fabricação:" + resultado.getString("data_fab"));
            
            } else { //se não foi encontrado
                out.print("Produto não cadastrado");
            }

            %>
    </body>
</html>
