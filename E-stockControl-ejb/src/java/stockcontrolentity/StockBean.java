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
public abstract class StockBean implements EntityBean {

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
    public java.lang.String ejbCreate(java.lang.String key) throws CreateException {
        if (key == null) {
            throw new CreateException("The field \"key\" must not be null");
        }

        // TODO add additional validation code, throw CreateException if data is not valid
        this.setCommodityId(key);
        return null;
    }

    public void ejbPostCreate(java.lang.String key) {
        // TODO populate relationships here if appropriate
    }

    public abstract String getCommodityId();

    public abstract void setCommodityId(String commodityId);

    public abstract Integer getQuantityIn();

    public abstract void setQuantityIn(Integer quantityIn);

    public abstract String getReceivedDate();

    public abstract void setReceivedDate(String receivedDate);

    public abstract Integer getQuantityLeft();

    public abstract void setQuantityLeft(Integer quantityLeft);

    public abstract String getReceivedBy();

    public abstract void setReceivedBy(String receivedBy);

    public abstract Float getUnitprice();

    public abstract void setUnitprice(Float unitprice);

    public abstract String getCommodityName();

    public abstract void setCommodityName(String commodityName);

    public abstract String getUnitcode();

    public abstract void setUnitcode(String unitcode);

    public abstract String getDel();

    public abstract void setDel(String del);

    public abstract String getCompartments();

    public abstract void setCompartments(String Compartments);

    public abstract String getWhcode();

    public abstract void setWhcode(String whcode);

    public abstract String getBarcode();

    public abstract void setBarcode(String barcode);

    public abstract String getMakeOrBuy();

    public abstract void setMakeOrBuy(String makeOrBuy);
    
    public abstract String getDiscountCategory();

    public abstract void setDiscountCategory(String DiscountCategory);


    public abstract String getCategory();

    public abstract void setCategory(String category);
    
     public abstract String getBatchcode();

    public abstract void setBatchcode(String batchcode);


}
