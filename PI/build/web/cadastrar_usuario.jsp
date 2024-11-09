<%-- 
    Document   : cadastrar_usuario
    Created on : 17 de set. de 2024, 09:31:16
    Author     : breno.cpereira2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String u, s, n;
            //Receber os dados digitados no formulario
            u = request.getParameter("usuario");
            s = request.getParameter("senha");
            n = request.getParameter("nome");
            //Conectar no banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");//aponta para a biblioteca JDBC
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "p@$$w0rd");
            //Enviar os dados recebidos para a tabela do banco de dados
            st = conecta.prepareStatement("INSERT INTO usuarios VALUES(?,?,?)");
            st.setString(1, u);
            st.setString(2, s);
            st.setString(3, n);
            st.executeUpdate();//Executa o INSERT na tabela do BD
            //Informar o usuário que os dados foram gravados
            out.print("Usuário cadastrado com sucesso");
        %>
        <p>
            <a href="index.html">
                Logar
            </a>
        </p>
    </body>
</html>
