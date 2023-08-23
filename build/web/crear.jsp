<%-- 
    Document   : crear
    Created on : 23/08/2023, 04:09:08 PM
    Author     : katay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>nuevos  cliente</title>
    </head>
    <body>
       <div class="container mt_5">
            <div class="row">
                <div class="col-sm">
                    <h1>ingresar mascotas</h1>
                    <form  action="crear.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label>Nombre animal</label>
                                <input name="nombre" type="text" class="form-control"  placeholder="nombre" required="">
                            </div>
                            <div class="form-group col-md-5">
                                <label>Rut</label>
                                <input name="rut" type="text" class="form-control"  placeholder="rut" required="">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label>Direccion</label>
                            <input name="direccion" type="text" class="form-control"  placeholder="direccion" required="">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Correo </label>
                            <input name="correo" type="text" class="form-control" aria-describedby="emailHelp" placeholder=" correo" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">Registrar<i class="fa fa-arrow-right"></i></button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre");
                String strRut = request.getParameter("rut");
                String strDireccion = request.getParameter("direccion");
                String strCorreo = request.getParameter("correo");
                try {
                    Connection con = null;
                    Statement st = null;
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_veterinaria?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_veterinaria(nombre,rut,direccion,correo) VALUES('" + strNombre + "', '" + strRut + "','" + strDireccion + "' ,'" + strCorreo + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
