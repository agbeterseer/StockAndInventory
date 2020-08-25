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
public abstract class SupplyBean implements EntityBean {

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

    public abstract String getCommodityId();

    public abstract void setCommodityId(String commodityId);

    public abstract String getIssuedBy();

    public abstract void setIssuedBy(String issuedBy);

    public abstract String getDistributorId();

    public abstract void setDistributorId(String distributorId);

    public abstract String getDateSupplied();

    public abstract void setDateSupplied(String dateSupplied);

    public abstract Integer getQuantitySupplied();

    public abstract void setQuantitySupplied(Integer quantitySupplied);
      
    public abstract Float getCogs();

    public abstract void setCogs(Float Cogs);

    public abstract String getWhcode();

    public abstract void setWhcode(String Whcode);

    public abstract Integer ejbSelectByMax() throws FinderException;

    public Integer ejbHomeMax() throws FinderException{
        SupplyLocalHome slh = (SupplyLocalHome)context.getEJBLocalHome();
        return ejbSelectByMax();
    }

    public abstract String getQtyleft();

    public abstract void setQtyleft(String qtyleft);

    public abstract String getComodityname();

    public abstract void setComodityname(String comodityname);

    public abstract String getLocation();

    public abstract void setLocation(String location);

    public abstract String getPhonenumber();

    public abstract void setPhonenumber(String phonenumber);
    
}
