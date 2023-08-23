<%-- 
    Document   : index
    Created on : 23/08/2023, 03:33:28 PM
    Author     : katay
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>listado de veterinaria</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt_5">
            <div class="row">
                <div class="col-sm">
                    <h1>bienvenido a la veterinaria!</h1>
                    <table class="table table-striped table-dark">
                        <thead>
                             <tr>
                                <th scope="col" colspan="5" class="text-center">Nueva veterinaria</th>
                                <th scope="col" >
                                    <a href="crear.jsp"><i class="fa fa-paw" style="color: #e6e6e6;"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">RUT</th>
                                <th scope="col">DIRECCION</th>
                                <th scope="col">CORREO</th
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_veterinaria?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tbl_veterinaria ORDER BY 1 DESC");
                                while (rs.next()) {
                            %> 
                            <tr>
                                <tr>
                                <th scope="row"><%= rs.getInt(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><a href="editar.jsp?id_veterinaria=<%= rs.getInt(1)%>&nombre=<%= rs.getString(2)%>&rut=<%= rs.getString(3)%>&direccion=<%= rs.getString(4)%>&correo=<%= rs.getString(5)%>"<i class="fa fa-pencil-alt" style="color: #52BE80;"></i></a></td>
                                <td><a href="borrar.jsp?id_veterinaria=<%= rs.getInt(1)%>"><i class="fa fa-trash-alt" style="color: #EB180E;"></i></a></td>
                            </tr>
                            <% }

                            %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
