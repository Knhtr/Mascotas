package com.mycompany.mascotas;

import java.io.*;
import java.util.ArrayList;

public class GestionarMascotas {
     // Aquí se guardará el archivo
    private final String rutaArchivo;
    private final ArrayList<Mascota> misMascotas;

    // Constructor: lee las mascotas al iniciar
    public GestionarMascotas(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
        this.misMascotas = leerArchivo();
    }

    // Método para agregar y guardar en archivo
    public void agregarMascota(Mascota miMascota) {
        misMascotas.add(miMascota);
        guardarArchivo();
    }
    
    public void actualizarMascota(Mascota miMascota){
        for (int i = 0; i < misMascotas.size(); i++){
            Mascota m = misMascotas.get(i);
        }
        
        boolean encontrado = false;
        for(int i = 0; i < misMascotas.size(); i++){
            Mascota m = misMascotas.get(i);
            if (m.getId() == miMascota.getId()){
                m.setNombre(miMascota.getNombre());
                m.setRaza(miMascota.getRaza());
                m.setEdad(miMascota.getEdad());
                m.setTipo(miMascota.getTipo());
                m.setFoto(miMascota.getFoto());
                encontrado = true;
                break;
            }
        }
        guardarArchivo();
    }
    
    //método para eliminar una mascota
      public void eliminarMascota(int id) {
        for (int i = 0; i < misMascotas.size(); i++) {
            Mascota miMascota = misMascotas.get(i);
            if (miMascota.getId() == id) {
                misMascotas.remove(i);
                guardarArchivo();
                break;
            }
        }
    }
      
    //método para buscar una mascota
        public Mascota buscarMascota(int id) {
        for (Mascota miMascota : misMascotas) {
            if (miMascota.getId() == id) {
                return miMascota;
            }
        }
        return null;
    }
    
    //eliminar foto
    private void eliminarFoto(String foto) {
        String ruta = "/target/data/libros.txt";
        File archivo = new File(ruta + File.separator + foto);
        if (archivo.exists()) {
            archivo.delete();
        }
    }

    // Devuelve la lista actual
    public ArrayList<Mascota> getMisMascotas() {
        return new ArrayList<>(misMascotas);
    }

    // Métodos para archivo
    private void guardarArchivo() {
        File archivo = new File(rutaArchivo);
        File carpeta = archivo.getParentFile();

        // Crea la carpeta si no existe
        if (carpeta != null && !carpeta.exists()) {
            boolean creada = carpeta.mkdirs();
            System.out.println("Carpeta creada: " + creada + " en " + carpeta.getAbsolutePath());
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, false))) {
            for (Mascota miMascota : misMascotas) {
                bw.write(String.join(",",
                        String.valueOf(miMascota.getId()),
                        miMascota.getNombre(),
                        miMascota.getRaza(),
                        miMascota.getEdad(),
                        miMascota.getTipo(),
                        miMascota.getFoto()
                ));
                bw.newLine();
            }
            System.out.println("Archivo guardado en: " + archivo.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error al guardar el archivo: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private ArrayList<Mascota> leerArchivo() {
        File archivo = new File(rutaArchivo);
        ArrayList<Mascota> lista = new ArrayList<>();

        if (!archivo.exists()) {
            return lista; // Si no existe, lista vacía
        }

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] datos = linea.split(",");
                if (datos.length == 6) {
                    Mascota miMascota = new Mascota(
                            Integer.parseInt(datos[0]),
                            datos[1],
                            datos[2],
                            datos[3],
                            datos[4],
                            datos[5]
                    );
                    lista.add(miMascota);
                }
            }
        } catch (IOException e) {
            System.err.println("❌ Error al leer archivo: " + e.getMessage());
        }
        return lista;
    }
}
