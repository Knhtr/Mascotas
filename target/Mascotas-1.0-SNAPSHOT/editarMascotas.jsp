<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.mascotas.Mascota" %>
<%@ page import="com.mycompany.mascotas.GestionarMascotas" %>
<%
    String idParam = request.getParameter("id");
    Mascota miMascota = null;

    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);
        miMascota = gestionar.buscarMascota(id);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styless2.css">
        <title>Editar Mascota</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
                min-height: 100vh;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .container {
                max-width: 500px;
                width: 100%;
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(33, 150, 243, 0.2);
                overflow: hidden;
            }

            .header {
                background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%);
                color: white;
                padding: 30px;
                text-align: center;
            }

            .header h1 {
                font-size: 2.2rem;
                text-shadow: 0 2px 4px rgba(0,0,0,0.3);
                margin: 0;
            }

            .form-container {
                padding: 40px;
            }

            .form-group {
                margin-bottom: 25px;
                position: relative;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #424242;
                font-size: 1rem;
            }

            .label-icon {
                margin-right: 8px;
                font-size: 1.1rem;
            }

            input[type="text"] {
                width: 100%;
                padding: 15px 20px;
                border: 2px solid #bbdefb;
                border-radius: 12px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background: #fafafa;
                color: #424242;
            }

            input[type="text"]:focus {
                outline: none;
                border-color: #42a5f5;
                background: white;
                box-shadow: 0 0 0 3px rgba(66, 165, 245, 0.1);
                transform: translateY(-1px);
            }

            input[type="text"]:hover {
                border-color: #90caf9;
                background: white;
            }
            
                        /* Ocultar el botón original */
            input[type="file"] {
                display: none;
            }

            /* Label con estilo de botón */
            .custom-file-upload {
                display: inline-block;
                width: 100%;
                padding: 15px;
                background: #fafafa;
                color: grey;
                border-radius: 12px;
                border: 2px solid #bbdefb;
                font-size: 1.1rem;
                font-weight: 600;
                text-align: center;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
            }

            .custom-file-upload:hover {
                border-color: #90caf9;
                transform: translateY(-2px);
            }

            .custom-file-upload:active {
                transform: translateY(0);
            }

            .submit-btn {
                width: 100%;
                padding: 15px;
                background: linear-gradient(135deg, #64b5f6 0%, #42a5f5 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(66, 165, 245, 0.3);
                margin-top: 10px;
            }

            .submit-btn:hover {
                background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%);
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(66, 165, 245, 0.4);
            }

            .submit-btn:active {
                transform: translateY(0);
                box-shadow: 0 2px 10px rgba(66, 165, 245, 0.3);
            }

            @media (max-width: 768px) {
                .container {
                    margin: 10px;
                    border-radius: 15px;
                }

                .header {
                    padding: 25px 20px;
                }

                .header h1 {
                    font-size: 1.8rem;
                }

                .form-container {
                    padding: 30px 25px;
                }

                input[type="text"], .submit-btn {
                    padding: 12px 15px;
                }
            }

            input[type="text"]::placeholder {
                color: #bbb;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>🐾 Editar Mascotas</h1>
            </div>

            <div class="form-container">
                <form action="svActualizar" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="id">
                            <span class="label-icon">🔢</span>ID
                        </label>
                        <input type="text" id="id" name="id" value="<%= miMascota != null ? miMascota.getId() : ""%>" readonly>
                    </div>

                    <div class="form-group">
                        <label for="nombre">
                            <span class="label-icon">📝</span>Nombre
                        </label>
                        <input type="text" id="nombre" name="nombre" value="<%= miMascota != null ? miMascota.getNombre() : ""%>">
                    </div>

                    <div class="form-group">
                        <label for="raza">
                            <span class="label-icon">🏷️</span>Raza
                        </label>
                        <input type="text" id="raza" name="raza" value="<%= miMascota != null ? miMascota.getRaza() : ""%>">
                    </div>

                    <div class="form-group">
                        <label for="edad">
                            <span class="label-icon">🎂</span>Edad
                        </label>
                        <input type="text" id="edad" name="edad" value="<%= miMascota != null ? miMascota.getEdad() : ""%>">
                    </div>

                    <div class="form-group">
                        <label for="tipo">
                            <span class="label-icon">🐕</span>Tipo
                        </label>
                        <input type="text" id="tipo" name="tipo" value="<%= miMascota != null ? miMascota.getTipo() : ""%>">
                    </div>
                    <div class="form-group">
                        <label for="foto">
                            <span class="label-icon">📷</span>Foto
                        </label>
                        <label for="foto" class="custom-file-upload">📁 Seleccionar Foto</label>
                        <input type="file" id="foto" name="foto" accept="image/*" required>
                    </div>

                    <input type="submit" value="✨ Guardar cambios" class="submit-btn">
                </form>
            </div>
        </div>
    </body>
</html>
