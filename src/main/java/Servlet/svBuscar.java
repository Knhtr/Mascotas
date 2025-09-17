package Servlet;

import com.mycompany.mascotas.GestionarMascotas;
import com.mycompany.mascotas.Mascota;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svBuscar", urlPatterns = {"/svBuscar"})
public class svBuscar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);

        String idParam = request.getParameter("id");
        ArrayList<Mascota> resultado = new ArrayList<>();

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Mascota encontrada = gestionar.buscarMascota(id);
                if (encontrada != null) {
                    resultado.add(encontrada); // Solo la encontrada
                }
                // Si no encuentra nada, la lista queda vacía
            } catch (NumberFormatException e) {
                // Si el ID no es válido, también queda vacío
            }
        } else {
            // Si no hay ID, mostramos todas las mascotas
            resultado = gestionar.getMisMascotas();
        }

        request.setAttribute("misMascotas", resultado);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}