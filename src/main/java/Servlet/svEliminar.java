package Servlet;

import com.mycompany.mascotas.GestionarMascotas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svEliminar", urlPatterns = {"/svEliminar"})
public class svEliminar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Llama al método processRequest para configuraciones iniciales (opcional)
        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);
        processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("id"));
        gestionar.eliminarMascota(id);

        response.sendRedirect("index.jsp");
    }
}
