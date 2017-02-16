package Command;

import Entity.Facade.AssuranceFacade;
import Entity.Facade.UtilisateurFacade;
import Entity.Facade.VoitureFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controleur extends HttpServlet {

    private final Map commands = new HashMap();
    
    @EJB
    private UtilisateurFacade utilisateurFacade;
    
    @EJB
    private VoitureFacade voitureFacade;
    
    @EJB
    private AssuranceFacade assuranceFacade;
    
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
            
            String cmd = request.getParameter("cmd");
            String urlSuite = "WEB-INF/error.jsp";

            if (cmd != null) {
                ICommand com = (ICommand) commands.get(cmd);

                if (commands.get(cmd) != null) {
                    urlSuite = com.execute(request, response);
                }
            }
            
            request.getRequestDispatcher(urlSuite).forward(request, response);
        }
    }

    @Override
    public void init() {
        commands.put("signup", new CmdToSignup());
        commands.put("signupNext", new CmdSignupToSignupNext());
        commands.put("signupEnd", new CmdSignupNextToSignupEnd());
        commands.put("createAccount", new CmdSignupEndToValidation(utilisateurFacade, assuranceFacade, voitureFacade));
        commands.put("signin", new CmdToSignin());
        commands.put("admin", new CmdToAdmin());
        commands.put("account", new CmdSigninToAccount(utilisateurFacade, assuranceFacade, voitureFacade));
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
