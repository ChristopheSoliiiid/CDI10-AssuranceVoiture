package Entity.Facade;

import javax.ejb.Stateless;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.Utilisateur;
import javax.persistence.Query;

@Stateless
@Named("utilisateur")
public class UtilisateurFacade extends AbstractFacade<Utilisateur, Long> {
    
    private static final String JPQL_SELECT_BY_IDENTIFIANT = 
            "SELECT u FROM Utilisateur u WHERE u.identifiant = :identifiant";

    @PersistenceContext(unitName = "ASSURANCE")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UtilisateurFacade() {
        super(Utilisateur.class);
    }

    public Utilisateur findByIdentifiant(String identifiant) {
        Utilisateur utilisateur;
        
        Query requete = em.createQuery(JPQL_SELECT_BY_IDENTIFIANT);
        requete.setParameter("identifiant", identifiant);
        
        try {
            utilisateur = (Utilisateur) requete.getSingleResult();
        } catch (Exception e) {
            return null;
        }
        
        return utilisateur;
    }
    
}
