<%-- 
    Document   : agregarMascota
    Created on : 8/09/2025, 4:32:26 p. m.
    Author     : INTERNET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styless2.css">
        <title>Agregar Macota</title>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>🐾 Agregar Mascotas</h1>
            </div>

            <div class="form-container">
                <form action="svAgregar" method="POST">
                    <div class="form-group">
                        <label for="id">
                            <span class="label-icon">🔢</span>ID
                        </label>
                        <input type="text" id="id" name="id" placeholder="Ingrese el ID de la mascota">
                    </div>

                    <div class="form-group">
                        <label for="nombre">
                            <span class="label-icon">📝</span>Nombre
                        </label>
                        <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre de la mascota">
                    </div>

                    <div class="form-group">
                        <label for="raza">
                            <span class="label-icon">🏷️</span>Raza
                        </label>
                        <input type="text" id="raza" name="raza" placeholder="Ingrese la raza">
                    </div>

                    <div class="form-group">
                        <label for="edad">
                            <span class="label-icon">🎂</span>Edad
                        </label>
                        <input type="text" id="edad" name="edad" placeholder="Ingrese la edad de la mascota">
                    </div>

                    <div class="form-group">
                        <label for="tipo">
                            <span class="label-icon">🐕</span>Tipo
                        </label>
                        <input type="text" id="tipo" name="tipo" placeholder="Perro, Gato">
                    </div>

                    <input type="submit" value="✨ Agregar Mascota" class="submit-btn">
                </form>
            </div>
        </div>
    </body>
</html>
