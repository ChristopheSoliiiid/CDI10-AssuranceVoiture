package Command;

import Entity.Assurance;
import Entity.Facade.AssuranceFacade;
import Entity.Facade.UtilisateurFacade;
import Entity.Facade.VoitureFacade;
import Entity.Utilisateur;
import Entity.Voiture;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CmdSignupEndToValidation implements ICommand {

    private UtilisateurFacade uf;    
    private AssuranceFacade af;    
    private VoitureFacade vf;
    
    CmdSignupEndToValidation(UtilisateurFacade utilisateurFacade, AssuranceFacade assuranceFacade, VoitureFacade voitureFacade) {
        this.uf = utilisateurFacade;
        this.af = assuranceFacade;
        this.vf = voitureFacade;
    }

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        HttpSession hs = req.getSession(false);

        if (hs != null) {

            Utilisateur utilisateur = (Utilisateur) hs.getAttribute("Utilisateur");
            Voiture voiture = (Voiture) hs.getAttribute("Voiture");
            Assurance assurance = (Assurance) hs.getAttribute("Assurance");

            try {
                // Cryptage du mot de passe en sha1
                utilisateur.setMotdepasse(utilisateur.sha1(utilisateur.getMotdepasse()));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(CmdSignupEndToValidation.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            // 1. Ajout de l'utilisateur à la bdd
            uf.create(utilisateur);

            // 2. Recupérer l'id de l'utilisateur qui viens d'être généré
            Utilisateur userFromDB = uf.findByIdentifiant(utilisateur.getIdentifiant());
            
            // 3. Recupérer l'id de la voiture en fonction des choix de l'utilisateur
            System.out.println("Marque:" + voiture.getMarque() + ". Modele:" + voiture.getModele() + ". Version:" + voiture.getVersion());
            String marque = voiture.getMarque();
            String modele = voiture.getModele();
            String version = voiture.getVersion();
            
            Voiture voitureFromDB = vf.findByMMV(marque, modele, version);

            // 4. Ajout de l'utilisateur et de la voiture dans l'assurance
            assurance.setUtilisateur(userFromDB);
            assurance.setVoiture(voitureFromDB);

            // 5. Ajout du contrat d'assurance à la bdd
            af.create(assurance);
            
            // Suppression de la session
            hs.invalidate();

            return "WEB-INF/accountValidation.jsp";
        } else {
            return "WEB-INF/error.jsp";
        }
    }

}
