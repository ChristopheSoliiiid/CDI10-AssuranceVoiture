package Entity.Facade;

import javax.ejb.Stateless;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.Voiture;
import javax.persistence.Query;

@Stateless
@Named("voiture")
public class VoitureFacade extends AbstractFacade<Voiture, Long> {
    
    private static final String JPQL_SELECT_BY_MMV = 
            "SELECT v FROM Voiture v WHERE v.marque = :marque AND v.modele = :modele AND v.version = :version";

    @PersistenceContext(unitName = "ASSURANCE")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VoitureFacade() {
        super(Voiture.class);
    }

    /**
     * Fonction pour charger une voiture depuis la BDD avec en paramètre,
     * la marque, le modele et la version de la voiture.
     * @param marque (String) La marque de la voiture
     * @param modele (String) Le modele de la voiture
     * @param version (String) La version de la voiture
     * @return Une voiture ou null
     */
    public Voiture findByMMV(String marque, String modele, String version) {
        Voiture voiture;
        
        Query requete = em.createQuery(JPQL_SELECT_BY_MMV);
        requete.setParameter("marque", marque);
        requete.setParameter("modele", modele);
        requete.setParameter("version", version);
        
        try {
            voiture = (Voiture) requete.getSingleResult();
        } catch (Exception e) {
            return null;
        }        
        
        return voiture;
    }
    
}
