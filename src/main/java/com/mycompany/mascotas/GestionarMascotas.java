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
                        miMascota.getTipo()
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
                if (datos.length == 5) {
                    Mascota miMascota = new Mascota(
                            Integer.parseInt(datos[0]),
                            datos[1],
                            datos[2],
                            datos[3],
                            datos[4]
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
