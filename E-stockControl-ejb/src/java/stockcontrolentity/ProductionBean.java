/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import javax.ejb.CreateException;
import javax.ejb.EntityBean;
import javax.ejb.EntityContext;


/**
 *
 * @author JPT TERSOO AGBE
 */
public abstract class ProductionBean implements EntityBean {

    private EntityContext context;
    
    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click on the + sign on the left to edit the code.">

    // TODO Consider creating Transfer Object to encapsulate data
    // TODO Review finder methods

    /**
     * @see javax.ejb.EntityBean#setEntityContext(javax.ejb.EntityContext)
     */
    public void setEntityContext(EntityContext aContext) {
        context = aContext;
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbActivate()
     */
    public void ejbActivate() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbPassivate()
     */
    public void ejbPassivate() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbRemove()
     */
    public void ejbRemove() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#unsetEntityContext()
     */
    public void unsetEntityContext() {
        context = null;
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbLoad()
     */
    public void ejbLoad() {
        
    }
    
    /**
     * @see javax.ejb.EntityBean#ejbStore()
     */
    public void ejbStore() {
        
    }

    // </editor-fold>
    
    
    public java.lang.String ejbCreate(java.lang.String key)  throws CreateException {
        if (key == null) {
            throw new CreateException("The field \"key\" must not be null");
        }
        
        // TODO add additional validation code, throw CreateException if data is not valid
this.setProductionId(key);
        return null;
    }

    public void ejbPostCreate(java.lang.String key) {
        // TODO populate relationships here if appropriate
    }

    public abstract String getProductionId();

    public abstract void setProductionId(String productionId);

    public abstract String getCommodityType();

    public abstract void setCommodityType(String commodityType);

    public abstract String getQuantityProduced();

    public abstract void setQuantityProduced(String quantityProduced);

    public abstract String getMatrialsUsed();

    public abstract void setMatrialsUsed(String matrialsUsed);

    public abstract String getDateOfProduced();

    public abstract void setDateOfProduced(String dateOfProduced);

    public abstract String getManager();

    public abstract void setManager(String manager);

    public abstract String getCommodityid();

    public abstract void setCommodityid(String commodityName);
    
    public abstract String getDel();

    public abstract void setDel(String del);


    

}
