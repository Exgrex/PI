<%-- 
    Document   : atualizar_produtos
    Created on : 17 de set. de 2024, 09:31:16
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Declarar as variàveis
            Connection conecta;
            PreparedStatement st;
            int i;
            String n, m, d;
            double p;
            //Receber os dados digitados no formulario
            i = Integer.parseInt(request.getParameter("id"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            d = request.getParameter("data_fab");
            try {
                //Conectar no banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "p@$$w0rd");
                //Enviar os dados recebidos para a tabela do banco de dados
                st = conecta.prepareStatement("UPDATE produtos SET nome=?, marca=?, preco=?, data_fab=? WHERE id=?");
                st.setString(1, n);
                st.setString(2, m);
                st.setDouble(3, p);
                st.setString(4, d);
                st.setInt(5, i);
                st.executeUpdate();//Executa o UPDATE na tabela do BD
                //Informar o usuário que os dados foram gravados
                out.print("Produto alterado com sucesso");
            } catch (SQLException erro) {
                out.print("Erro=" + erro.getMessage());
            }
        %>        
    </body>
</html>
