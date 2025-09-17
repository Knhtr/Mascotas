package Servlet;

import com.mycompany.mascotas.GestionarMascotas;
import com.mycompany.mascotas.Mascota;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svAgregar", urlPatterns = {"/svAgregar"})
public class svAgregar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String edad = request.getParameter("edad");
        String tipo = request.getParameter("tipo");
        String foto = request.getParameter("foto");

        // Verificar si ya existe el ID
        if (gestionar.buscarMascota(id) != null) {
            // Si existe, volver al formulario con un mensaje de error
            request.setAttribute("error", "⚠️ Ya existe una mascota con ese ID. Intenta con otro.");
            request.getRequestDispatcher("agregarMascota.jsp").forward(request, response);
        } else {
            // Si no existe, agregar normalmente
            Mascota miMascota = new Mascota(id, nombre, raza, edad, tipo, foto);
            gestionar.agregarMascota(miMascota);
            response.sendRedirect("index.jsp");
        }
    }

}
