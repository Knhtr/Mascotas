<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mycompany.mascotas.Mascota" %>
<%@ page import="com.mycompany.mascotas.GestionarMascotas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Los Pelagatos</title>
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
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
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

            .header h2 {
                font-size: 2.5rem;
                margin-bottom: 10px;
                text-shadow: 0 2px 4px rgba(0,0,0,0.3);
            }

            .content {
                padding: 30px;
            }

            .search-section {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 15px;
                margin-bottom: 25px;
                border: 2px solid #e3f2fd;
            }

            .search-form {
                display: flex;
                gap: 15px;
                align-items: center;
                flex-wrap: wrap;
            }

            .search-input {
                flex: 1;
                min-width: 200px;
                padding: 12px 15px;
                border: 2px solid #ddd;
                border-radius: 10px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            .search-input:focus {
                outline: none;
                border-color: #42a5f5;
                box-shadow: 0 0 0 3px rgba(66, 165, 245, 0.1);
            }

            .search-button {
                padding: 12px 25px;
                border: none;
                border-radius: 10px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 16px;
                background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%);
                color: white;
                box-shadow: 0 4px 15px rgba(66, 165, 245, 0.3);
            }

            .search-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(66, 165, 245, 0.4);
            }

            .add-button {
                display: inline-block;
                background: linear-gradient(135deg, #64b5f6 0%, #42a5f5 100%);
                color: white;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 25px;
                font-weight: 600;
                margin-bottom: 25px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(66, 165, 245, 0.3);
            }

            .add-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(66, 165, 245, 0.4);
            }

            .pets-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
                gap: 20px;
                margin-top: 20px;
            }

            .pet-card {
                background: white;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                border: 2px solid #f0f0f0;
                transition: all 0.3s ease;
                position: relative;
            }

            .pet-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
                border-color: #42a5f5;
            }

            .pet-photo {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #42a5f5;
                margin-bottom: 15px;
                box-shadow: 0 4px 10px rgba(66, 165, 245, 0.3);
            }

            .pet-id {
                background: linear-gradient(135deg, #42a5f5 0%, #1976d2 100%);
                color: white;
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 600;
                display: inline-block;
                margin-bottom: 10px;
                position: absolute;
                top: 15px;
                right: 15px;
            }

            .pet-name {
                font-size: 1.4rem;
                font-weight: 700;
                color: #333;
                margin-bottom: 8px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .pet-info {
                color: #666;
                margin-bottom: 5px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .pet-info strong {
                color: #333;
                min-width: 60px;
            }

            .actions {
                display: flex;
                gap: 10px;
                margin-top: 15px;
                padding-top: 15px;
                border-top: 1px solid #eee;
            }

            .action-btn {
                flex: 1;
                padding: 8px 12px;
                border-radius: 8px;
                text-decoration: none;
                font-size: 14px;
                font-weight: 600;
                text-align: center;
                transition: all 0.3s ease;
            }

            .btn-edit {
                background: #e8f5e8;
                color: #2e7d32;
                border: 2px solid #4caf50;
            }

            .btn-edit:hover {
                background: #4caf50;
                color: white;
            }

            .btn-delete {
                background: #ffebee;
                color: #c62828;
                border: 2px solid #f44336;
            }

            .btn-delete:hover {
                background: #f44336;
                color: white;
            }

            .no-results {
                text-align: center;
                padding: 40px;
                color: #666;
                font-size: 1.1rem;
                grid-column: 1 / -1;
            }

            .no-results .icon {
                font-size: 3rem;
                margin-bottom: 15px;
                opacity: 0.5;
            }

            @media (max-width: 768px) {
                .search-form {
                    flex-direction: column;
                    align-items: stretch;
                }

                .search-input {
                    min-width: auto;
                }

                .pets-grid {
                    grid-template-columns: 1fr;
                }

                .actions {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h2>🐾 Lista de Masootas</h2>
            </div>

            <div class="content">
                <div class="search-section">
                    <h3 style="margin-bottom: 15px; color: #333;">🔍 Buscar Mascota por ID</h3>
                    <form action="svBuscar" method="GET" class="search-form">
                        <input type="number" name="id" class="search-input" placeholder="Ingresa el ID de la mascota..." min="1">
                        <button type="submit" class="search-button">🔍 Buscar</button>
                        <a href="index.jsp" class="search-button" style="text-align:center; text-decoration:none;">📋 Mostrar Todas</a>
                    </form>
                </div>

                <a href="agregarMascota.jsp" class="add-button">➕ Agregar Nueva Mascota</a>

                <%
                    // Obtener las mascotas (desde servlet o directamente)
                    ArrayList<Mascota> misMascotas = (ArrayList<Mascota>) request.getAttribute("misMascotas");

                    // Si no hay mascotas del servlet, cargar todas
                    if (misMascotas == null) {
                        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
                        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);
                        misMascotas = gestionar.getMisMascotas();
                    }

                    // Determinar el mensaje de resultados
                    String idParam = request.getParameter("id");
                    boolean esBusqueda = (idParam != null && !idParam.isEmpty());
                    int totalMascotas = (misMascotas != null) ? misMascotas.size() : 0;
                %>

                <div id="resultados">
                    <div class="pets-grid">
                        <% if (misMascotas != null && !misMascotas.isEmpty()) { %>
                        <% for (Mascota miMascota : misMascotas) {%>
                        <div class="pet-card">
                            <div class="pet-id">ID: <%= miMascota.getId()%></div>

                            <img src="<%= miMascota.getFoto()%>" 
                                 alt="Foto de <%= miMascota.getNombre()%>" 
                                 class="pet-photo"
                                 onerror="this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAiIGhlaWdodD0iODAiIHZpZXdCb3g9IjAgMCA4MCA4MCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGNpcmNsZSBjeD0iNDAiIGN5PSI0MCIgcj0iNDAiIGZpbGw9IiNmNWY1ZjUiLz4KPHN2ZyB4PSIyMCIgeT0iMjAiIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSIjOTk5Ij4KPHA+8J+QvjwvcD4KPHN2Zz4KPC9zdmc+'; this.alt='Sin foto';">

                            <div class="pet-name">
                                🐾 <%= miMascota.getNombre()%>
                            </div>

                            <div class="pet-info">
                                <strong>Tipo:</strong> <%= miMascota.getTipo()%>
                            </div>
                            <div class="pet-info">
                                <strong>Raza:</strong> <%= miMascota.getRaza()%>
                            </div>
                            <div class="pet-info">
                                <strong>Edad:</strong> <%= miMascota.getEdad()%>
                            </div>

                            <div class="actions">
                                <a href="editarMascotas.jsp?id=<%= miMascota.getId()%>" class="action-btn btn-edit">
                                    ✏️ Editar
                                </a>
                                <a href="svEliminar?id=<%= miMascota.getId()%>" 
                                   class="action-btn btn-delete"
                                   onclick="return confirm('¿Seguro que quieres eliminar a <%= miMascota.getNombre()%>?');">
                                    🗑️ Borrar
                                </a>
                            </div>
                        </div>
                        <% } %>
                        <% } else {%>
                        <div class="no-results">
                            <div class="icon">
                                <%= esBusqueda ? "🔍" : "🐾"%>
                            </div>
                            <p>
                                <%= esBusqueda ? "No se encontró ninguna mascota con ese ID" : "No hay mascotas registradas"%>
                            </p>
                            <% if (esBusqueda) { %>
                            <p style="margin-top: 10px; font-size: 0.9rem; opacity: 0.8;">
                                <a href="index.jsp" style="color: #42a5f5; text-decoration: none;">Ver todas las mascotas</a>
                            </p>
                            <% } %>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
</html>
