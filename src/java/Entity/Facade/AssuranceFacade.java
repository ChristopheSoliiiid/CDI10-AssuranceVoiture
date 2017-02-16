package Entity.Facade;

import javax.ejb.Stateless;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.Assurance;

@Stateless
@Named("assurance")
public class AssuranceFacade extends AbstractFacade<Assurance, Long> {

    @PersistenceContext(unitName = "ASSURANCE")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssuranceFacade() {
        super(Assurance.class);
    }

}
