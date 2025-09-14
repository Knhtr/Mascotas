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
    
    //processRequest(request, response);
    
    //objeto para llamar metodos
    String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
    GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);
        
        //recepcionar las variables
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String edad = request.getParameter("edad");
        String tipo = request.getParameter("tipo");
        
        Mascota miMascota = new Mascota(id, nombre, raza, edad, tipo);
        gestionar.agregarMascota(miMascota);
        // Redirige al index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);   
    }
}
