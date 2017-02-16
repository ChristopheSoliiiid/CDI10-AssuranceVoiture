/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class AjaxServeur extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* Remplacer par du JSON ! */          
            
            if (request.getParameter("marque") != null) {
                String marque = request.getParameter("marque");
                List<String> modeles = new ArrayList<>();

                switch (marque) {

                    case "BMW":
                        modeles.add("Serie 1");
                        modeles.add("Serie 5");
                        modeles.add("X5");
                        modeles.add("Z4");
                        break;
                    case "Citroen":
                        modeles.add("C4");
                        modeles.add("C5");
                        modeles.add("DS3");
                        modeles.add("DS4");
                        break;

                    case "Ford":
                        modeles.add("Fiesta");
                        modeles.add("Focus");
                        break;

                    case "Porsche":
                        modeles.add("718 Boxster");
                        modeles.add("911");
                        modeles.add("Cayenne");
                        break;

                    case "Tesla":
                        modeles.add("Model S");
                        modeles.add("Model X");
                        modeles.add("Model 3");
                        modeles.add("Roadster");
                        break;
                }
                out.println(modeles);
                
            } else {
                
                if(request.getParameter("modele") != null) {
                    
                    String modele = request.getParameter("modele");
                    List<String> versions = new ArrayList<>();
                    
                    switch (modele) {
                        
                        case "Serie 1": case "Serie 5":
                            versions.add("Business");
                            versions.add("Lounge");
                            versions.add("Premiere");
                            break;
                            
                        case "X5": case "Z4":
                            versions.add("Business");
                            versions.add("Lounge");
                            versions.add("M Sport");
                            versions.add("Premiere");
                            break;
                            
                        case "C4":
                            versions.add("PureTech 110");
                            versions.add("PureTech 130");
                            versions.add("BlueHDi 100");
                            versions.add("BleuHDi 120");
                            break;
                        
                        case "C5":
                            versions.add("BlueHDi 150");
                            versions.add("BlueHDi 180");
                            break;
                            
                        case "DS3": case "DS4":
                            versions.add("PureTech 82");
                            versions.add("PureTech 100");
                            versions.add("PureTech 110");
                            break;
                            
                        case "Fiesta": 
                            versions.add("3P 1.25 82Ch Edition");
                            versions.add("5P 1.25 82Ch Edition");
                            versions.add("3P 1.0 EcoBoost");
                            versions.add("5P 1.0 EcoBoost");
                            break;
                            
                        case "Focus": 
                            versions.add("1.0 EcoBoost");
                            versions.add("1.5 TDCi");
                            versions.add("1.6 Ti-VCT");
                            break;
                            
                        case "718 Boxster": 
                            versions.add("Boxster");
                            versions.add("Boxster S");
                            break;
                            
                        case "911": 
                            versions.add("Type 991");
                            versions.add("Type 996");
                            versions.add("Type 997");
                            break;
                            
                        case "Cayenne": 
                            versions.add("V6 3.2L");
                            versions.add("V8 4.5L");
                            versions.add("V8 4.5L Biturbo");
                            break;
                            
                        case "Model S": case "Model 3":
                            versions.add("60");
                            versions.add("60D");
                            versions.add("75");
                            versions.add("75D");
                            versions.add("90D");
                            versions.add("P100D");
                            break;
                            
                        case "Model X":
                            versions.add("75D");
                            versions.add("90D");
                            versions.add("P100D");
                            break;
                            
                        case "Roadster":
                            versions.add("Sport");
                            versions.add("Final Edition");
                            break;
                    }
                    
                    out.println(versions);
                } else {
                    out.println("Erreur...");
                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
