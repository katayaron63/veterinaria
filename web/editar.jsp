<%-- 
    Document   : editar
    Created on : 23/08/2023, 04:30:05 PM
    Author     : katay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Actualizar veterinaria</title>
    </head>
    <body>
        <%
            String strID = request.getParameter("id_veterinaria");
            String strNombre = request.getParameter("nombre");
            String strRut = request.getParameter("rut");
            String strDireccion = request.getParameter("direccion");
            String strCorreo = request.getParameter("correo");
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h1>editar veterinaria</h1>
                    <form  action="editar.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label>Nombre mascotas</label>
                                <input name="nombre" value="<%=strNombre%>" type="text" class="form-control"  placeholder="nombre" required="">
                            </div>
                            <div class="form-group col-md-5">
                                <label>Rut</label>
                                <input name="rut" value="<%=strRut%>" type="text" class="form-control"  placeholder="rut" required="">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                             <label>Dirreccion</label>
                            <input name="direccion" value="<%=strDireccion%>" type="text" class="form-control"  placeholder="direccion" required="">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Correo</label>
                            <input name="correo" value="<%=strCorreo%>" type="text" class="form-control" aria-describedby="emailHelp" placeholder="correo" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">Registrar <i class="fa fa-arrow-right"></i></button>
                        <a href="index.jsp" class="bnt btn-success">Cancelar <i class="fa fa-user-alt-slash"></i></a>
                        <input type="hidden" name="id_veterinaria" value="<%=strID%>">
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_veterinaria?user=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE tbl_veterinaria SET nombre = '" + strNombre + "', rut='" + strRut + "', direccion='" + strDireccion + "', correo='" + strCorreo + "' WHERE id_veterinaria='" + strID + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
