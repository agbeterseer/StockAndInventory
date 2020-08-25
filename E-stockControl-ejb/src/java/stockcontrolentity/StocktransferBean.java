/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import javax.ejb.CreateException;
import javax.ejb.EntityBean;
import javax.ejb.EntityContext;
import javax.ejb.FinderException;

/**
 *
 * @author JPT TERSOO AGBE
 */
public abstract class StocktransferBean implements EntityBean {

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
    
    
    public java.lang.Integer ejbCreate(java.lang.Integer key)  throws CreateException {
        if (key == null) {
            throw new CreateException("The field \"key\" must not be null");
        }
        
        // TODO add additional validation code, throw CreateException if data is not valid
this.setSno(key);
        return null;
    }

    public void ejbPostCreate(java.lang.Integer key) {
        // TODO populate relationships here if appropriate
    }

    public abstract Integer getSno();

    public abstract void setSno(Integer sno);

    public abstract String getItemcode();

    public abstract void setItemcode(String itemcode);

    public abstract String getItemname();

    public abstract void setItemname(String itemname);

    public abstract Integer getQuantity();

    public abstract void setQuantity(Integer quantity);

    public abstract String getDatetransferred();

    public abstract void setDatetransferred(String datetransferred);

    public abstract String getStatus();

    public abstract void setStatus(String status);

    public abstract String getFromwarehouse();

    public abstract void setFromwarehouse(String fromwarehouse);

    public abstract String getDestination();

    public abstract void setDestination(String destination);

    public abstract String getBarcode();

    public abstract void setBarcode(String barcode);

    public abstract String getMakeorbuy();

    public abstract void setMakeorbuy(String makeorbuy);

    public abstract String getCategory();

    public abstract void setCategory(String category);

    public abstract Float getUnitprice();

    public abstract void setUnitprice(Float unitprice);

    public abstract Integer ejbSelectByMax() throws FinderException;

    public Integer ejbHomeMax() throws FinderException{
        StocktransferLocalHome sf = (StocktransferLocalHome)context.getEJBLocalHome();
        return ejbSelectByMax();
    }

}
