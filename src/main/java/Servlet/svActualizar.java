package Servlet;

import com.mycompany.mascotas.GestionarMascotas;
import com.mycompany.mascotas.Mascota;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "svActualizar", urlPatterns = {"/svActualizar"})
@MultipartConfig
public class svActualizar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        //objeto para llamar métodos
        String rutaDatos = getServletContext().getRealPath("/target/data/mascotas.txt");
        GestionarMascotas gestionar = new GestionarMascotas(rutaDatos);

        //obtener los parámetros enviados desde el formulario
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String edad = request.getParameter("edad");
        String tipo = request.getParameter("tipo");
        Part filePart = request.getPart("foto");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "imagenes"; 
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); 
        }
        
        File file = new File(uploadDir, fileName); 
        System.out.println("Guardando archivo en: " + file.getAbsolutePath());
        try (InputStream input = filePart.getInputStream()) {
       
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        
        System.out.println("Archivo guardado en: " + file.getAbsolutePath());
        
        String filePath = "imagenes/" + fileName;
        Mascota miMascota = new Mascota(id, nombre, raza, edad, tipo, filePath);
        gestionar.actualizarMascota(miMascota);
        
        //redirige al index
        response.sendRedirect("index.jsp");
    }

}
