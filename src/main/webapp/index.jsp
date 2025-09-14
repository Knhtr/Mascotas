<%-- 
    Document   : index
    Created on : 8/09/2025, 3:51:31 p. m.
    Author     : INTERNET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styless.css">
        <title>Listar Mascotas</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #fce4ec 0%, #f8bbd9 100%);
                min-height: 100vh;
                padding: 20px;
            }

            .container {
                max-width: 1000px;
                margin: 0 auto;
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(233, 30, 99, 0.2);
                overflow: hidden;
            }

            .header {
                background: linear-gradient(135deg, #e91e63 0%, #ad1457 100%);
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

            .add-button {
                display: inline-block;
                background: linear-gradient(135deg, #ff4081 0%, #e91e63 100%);
                color: white;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 25px;
                font-weight: 600;
                margin-bottom: 25px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
            }

            .add-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(233, 30, 99, 0.4);
                background: linear-gradient(135deg, #e91e63 0%, #ad1457 100%);
            }

            .table-container {
                overflow-x: auto;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
            }

            thead {
                background: linear-gradient(135deg, #f48fb1 0%, #e91e63 100%);
            }

            th {
                padding: 18px 15px;
                text-align: left;
                font-weight: 600;
                color: white;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 0.9rem;
            }

            tbody tr {
                transition: all 0.3s ease;
            }

            tbody tr:nth-child(even) {
                background-color: #fce4ec;
            }

            tbody tr:hover {
                background-color: #f8bbd9;
                transform: scale(1.01);
            }

            td {
                padding: 15px;
                border-bottom: 1px solid #f8bbd9;
                color: #424242;
            }

            .actions {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
            }

            .action-btn {
                padding: 6px 12px;
                border: none;
                border-radius: 15px;
                font-size: 0.8rem;
                font-weight: 500;
                transition: all 0.3s ease;
                text-decoration: none;
                color: white;
                display: inline-block;
            }

            .btn-view {
                background: linear-gradient(135deg, #4fc3f7 0%, #29b6f6 100%);
            }

            .btn-edit {
                background: linear-gradient(135deg, #ffb74d 0%, #ff9800 100%);
            }

            .btn-delete {
                background: linear-gradient(135deg, #ef5350 0%, #f44336 100%);
            }

            .action-btn:hover {
                transform: translateY(-1px);
                box-shadow: 0 3px 10px rgba(0,0,0,0.2);
            }

            .pet-icon {
                font-size: 1.2rem;
                margin-right: 5px;
            }

            .id-badge {
                background: linear-gradient(135deg, #e91e63 0%, #ad1457 100%);
                color: white;
                padding: 4px 10px;
                border-radius: 12px;
                font-weight: 600;
                font-size: 0.9rem;
            }

            @media (max-width: 768px) {
                .container {
                    margin: 10px;
                    border-radius: 15px;
                }

                .header {
                    padding: 20px;
                }

                .header h2 {
                    font-size: 2rem;
                }

                .content {
                    padding: 20px;
                }

                table {
                    font-size: 0.9rem;
                }

                th, td {
                    padding: 12px 8px;
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
                <h2>🐾 Listar Mascotas</h2>
            </div>

            <div class="content">
                <a href="agregarMascota.jsp" class="add-button">
                    ➕ Agregar Nueva Mascota
                </a>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Raza</th>
                                <th>Edad</th>
                                <th>Tipo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="id-badge">1</span></td>
                                <td><span class="pet-icon">🐕</span><strong>Pelusa</strong></td>
                                <td>Mestizo</td>
                                <td>5 años</td>
                                <td>Perro</td>
                                <td>
                                    <div class="actions">
                                        <a href="#" class="action-btn btn-view">👁️ Ver</a>
                                        <a href="#" class="action-btn btn-edit">✏️ Editar</a>
                                        <a href="#" class="action-btn btn-delete">🗑️ Borrar</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="id-badge">2</span></td>
                                <td><span class="pet-icon">🐱</span><strong>Copito</strong></td>
                                <td>Criollo</td>
                                <td>3 años</td>
                                <td>Gato</td>
                                <td>
                                    <div class="actions">
                                        <a href="#" class="action-btn btn-view">👁️ Ver</a>
                                        <a href="#" class="action-btn btn-edit">✏️ Editar</a>
                                        <a href="#" class="action-btn btn-delete">🗑️ Borrar</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</html>
