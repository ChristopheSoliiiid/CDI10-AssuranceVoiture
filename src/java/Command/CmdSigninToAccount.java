package Command;

import Entity.Facade.AssuranceFacade;
import Entity.Facade.UtilisateurFacade;
import Entity.Facade.VoitureFacade;
import Entity.Utilisateur;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CmdSigninToAccount implements ICommand {

    private UtilisateurFacade uf;
    private AssuranceFacade af;
    private VoitureFacade vf;

    CmdSigninToAccount(UtilisateurFacade utilisateurFacade, AssuranceFacade assuranceFacade, VoitureFacade voitureFacade) {
        this.uf = utilisateurFacade;
        this.af = assuranceFacade;
        this.vf = voitureFacade;
    }

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        // Recuperer le nom d'utilisateur et le mot de passe du formulaire
        // verifier que le mdp et l'identifiant correspond dans la bdd
        // rediriger vers la page du compte
        // ou de retour vers la page de connexion
        String mdpForm = "";

        try {
            mdpForm = Utilisateur.sha1(req.getParameter("motDePasse"));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CmdSigninToAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        String identifiantForm = req.getParameter("identifiant");

        Utilisateur user = uf.findByIdentifiant(identifiantForm);

        if (user != null) {
            if (user.getMotdepasse().equals(mdpForm)) {

                return "WEB-INF/account.jsp";
            }
        }

        return "WEB-INF/signin.jsp";
    }

}
