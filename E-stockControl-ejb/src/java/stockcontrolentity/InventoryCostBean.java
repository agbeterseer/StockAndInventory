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
public abstract class InventoryCostBean implements EntityBean {

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
this.setItemCode(key);
        return null;
    }

    public void ejbPostCreate(java.lang.String key) {
        // TODO populate relationships here if appropriate
    }

    public abstract String getItemCode();

    public abstract void setItemCode(String itemCode);

    public abstract Float getMaterialCost();

    public abstract void setMaterialCost(Float materialCost);

    public abstract Float getLabourCost();

    public abstract void setLabourCost(Float labourCost);

    public abstract Float getOverheadCost();

    public abstract void setOverheadCost(Float overheadCost);

    public abstract String getDel();

    public abstract void setDel(String del);

    public abstract Float getActualCost();

    public abstract void setActualCost(Float actualCost);

    public abstract String getDateCreated();

    public abstract void setDateCreated(String dateCreated);

    public abstract Float getExpenses();

    public abstract void setExpenses(Float expenses);

    public abstract Float getPurchesCost();

    public abstract void setPurchesCost(Float purchesCost);

    public abstract Float getExchangeRate();

    public abstract void setExchangeRate(Float exchangeRate);

    public abstract Float getFreight();

    public abstract void setFreight(Float freight);

}
