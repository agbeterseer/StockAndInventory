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
public abstract class UnitBean implements EntityBean {

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

    public abstract String getUnitcode();

    public abstract void setUnitcode(String unitcode);

    public abstract String getUnitName();

    public abstract void setUnitName(String unitName);

    public abstract String getUnitType();

    public abstract void setUnitType(String unitType);

    public abstract String getCommodidtyType();

    public abstract void setCommodidtyType(String commodidtyType);

    public abstract String getWhcode();

    public abstract void setWhcode(String whcode);

    public abstract String getDel();

    public abstract void setDel(String del);

    public abstract Integer ejbSelectByMax() throws FinderException;

    public Integer ejbHomeMax() throws FinderException{
        UnitLocalHome uh = (UnitLocalHome)context.getEJBLocalHome();
        return ejbSelectByMax();
    }

}
