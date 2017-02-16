package Command;

import Entity.Utilisateur;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CmdSignupToSignupNext implements ICommand {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        // Récupération de la session
        HttpSession hs = req.getSession(true);

        // Si une session existe, récupération des data dans les params de la session
        if (hs != null) {

            // Permet de savoir si l'utilisateur viens de la page
            // signupEnd, et par conséquent évite de refaire les setter du UserBean
            // qui aurait pour conséquence de réécrire avec des données vides
            if (hs.getAttribute("fromSignupEnd") != null) {
                return "WEB-INF/signupNext.jsp";
                
            } else {                
                Utilisateur ub = new Utilisateur();
                ub.setCivilite(req.getParameter("civ"));
                ub.setNom(req.getParameter("nom"));
                ub.setPrenom(req.getParameter("prenom"));
                ub.setDatenaissance(req.getParameter("dateNaissance"));
                ub.setAdresse(req.getParameter("adresse"));
                ub.setVille(req.getParameter("ville"));
                ub.setCp(req.getParameter("cp"));
                ub.setEmail(req.getParameter("email"));
                ub.setIdentifiant(req.getParameter("identifiant"));
                ub.setMotdepasse(req.getParameter("pass"));

                hs.setAttribute("Utilisateur", ub);

                return "WEB-INF/signupNext.jsp";
            }
        } else { // Sinon, redirection vers la page d'error
            return "WEB-INF/error.jsp";
        }

    }

}
