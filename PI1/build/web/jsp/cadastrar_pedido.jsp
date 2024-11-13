<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>

<%
    Connection conecta = null;
    PreparedStatement st = null;
    String nome = request.getParameter("name");
    String nome_usuario = request.getParameter("user");
    String senha = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3307/Teste", "root", "");
        
        st = conecta.prepareStatement("INSERT INTO pedido (data_pedido, valor_pedido, desc_pedido) VALUES (?, ?, ?)");
        st.setString(1, nome);
        st.setString(2, nome_usuario);
        st.setString(3, senha);
        st.executeUpdate();

        
        response.getWriter().print("success");

    } catch (Exception e) {
        e.printStackTrace(); 
        response.getWriter().print("error");
    } finally {
        if (st != null) st.close();
        if (conecta != null) conecta.close();
    }
%>
