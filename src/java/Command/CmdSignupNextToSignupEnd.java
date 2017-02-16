package Command;

import Entity.Assurance;
import Entity.Voiture;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CmdSignupNextToSignupEnd implements ICommand {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession hs = req.getSession(false);

        if (hs != null) {
            /* Création du VéhiculeBean */
            Voiture voiture = new Voiture();
            voiture.setMarque(req.getParameter("marque"));
            voiture.setModele(req.getParameter("modele"));
            voiture.setVersion(req.getParameter("version"));
            
            /* Ajout du VB dans la session */
            hs.setAttribute("Voiture", voiture);
            
            /* Problème d'encodage, se ul solution pour le moment est d'utiliser replace. */
            String usage = req.getParameter("usage");
            usage = usage.replace("Ã©", "é");
            
            String parking = req.getParameter("parking");
            parking = parking.replace("Ã©", "é");
            
            String packAssu = req.getParameter("packAssurance");
            packAssu = packAssu.replace("Ã©", "é");
            
            /* Création de l'AssuranceBean */
            Assurance assurance = new Assurance();
            assurance.setUtilsationvoiture(usage);
            assurance.setParking(parking);
            assurance.setPackassurance(packAssu);
            
            int km = Integer.parseInt(req.getParameter("km"));
            assurance.setKmmax(km);
            
            /* Ajout de l'AB dans la session */
            hs.setAttribute("Assurance", assurance);
            
            // Va permettre de savoir si l'utilisateur viens de la page signupEnd
            // pour ne pas réécrire sur les autres attributs si l'utilisateur
            // retourne en arrière pour modifier ses informations
            hs.setAttribute("fromSignupEnd", true);

            return "WEB-INF/signupEnd.jsp";
        } else {
            return "WEB-INF/error.jsp";
        }

    }

}
