
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        
        <%
            
        //Declara as variáveis
        Connection conecta;
        String id;
        PreparedStatement st;
        ResultSet resultado;
        //Receber o ID digitados no formulário
        id = request.getParameter("id");
       
        //Conectar com o banco de dados
        
        
        //aponta para a biblioteca JDBC
         Class.forName("com.mysql.cj.jdbc.Driver");
         
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bolos", "root", "p@$$w0rd");
        //Enviar os dados recebidos para a tabela do banco de dados

        //verificar se o produto com o id inforado esta na tebela do banco de dapds 
        st = conecta.prepareStatement("SELECT * FROM produto WHERE id_produto=?" );
        st.setString(1,id);
        resultado = st.executeQuery(); 
        //Esse comando executa o comando SELECT na tabela do BD
      
  //Informar o usuário que os dados foram gravados
        if(resultado.next()){
            out.print("Produto ID: "+resultado.getString("id_produto")+"<br>");
             out.print("Nome Produto: "+resultado.getString("nome_produto")+"<br>");
              out.print("Preco Unidade: "+resultado.getString("preco_uni")+"<br>");
              out.print("Categoria: "+resultado.getString("categoria")+"<br>");
        }
       else{
        out.print("Produto nao cadastrado");
       }
        
       
        
        %>
        
        

    </body>
</html>