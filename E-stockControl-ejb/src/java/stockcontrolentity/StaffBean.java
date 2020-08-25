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
public abstract class StaffBean implements EntityBean {

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
        this.setUsername(key);
        // TODO add additional validation code, throw CreateException if data is not valid

        return null;
    }

    public void ejbPostCreate(java.lang.String key) {
        // TODO populate relationships here if appropriate
    }

    public abstract String getUsername();

    public abstract void setUsername(String username);

    public abstract String getFirstName();

    public abstract void setFirstName(String firstName);

    public abstract String getLastName();

    public abstract void setLastName(String lastName);

    public abstract String getGender();

    public abstract void setGender(String gender);

    public abstract String getPosition();

    public abstract void setPosition(String position);

    public abstract String getNationality();

    public abstract void setNationality(String nationality);

    public abstract String getStateOfOrigin();

    public abstract void setStateOfOrigin(String stateOfOrigin);

    public abstract String getLga();

    public abstract void setLga(String lga);

    public abstract String getHomeAddress();

    public abstract void setHomeAddress(String homeAddress);

    public abstract String getPhoneNumber();

    public abstract void setPhoneNumber(String phoneNumber);

    public abstract String getDateOfAppointment();

    public abstract void setDateOfAppointment(String dateOfAppointment); 

    public abstract byte [] getPassport();

    public abstract void setPassport(byte [] passport);

    public abstract String getDel();

    public abstract void setDel(String del);

     public abstract String getWhcode();

    public abstract void setWhcode(String whcode);
    
}
