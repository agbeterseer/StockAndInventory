/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import javax.ejb.EJBLocalObject;

/**
 *
 * @author JPT TERSOO AGBE
 */
public interface InventoryCostLocal extends EJBLocalObject {

    String getItemCode();

    void setItemCode(String itemCode);

    Float getMaterialCost();

    void setMaterialCost(Float materialCost);

    Float getLabourCost();

    void setLabourCost(Float labourCost);

    Float getOverheadCost();

    void setOverheadCost(Float overheadCost);

    String getDel();

    void setDel(String del);

    Float getActualCost();

    void setActualCost(Float actualCost);

    String getDateCreated();

    void setDateCreated(String dateCreated);

    Float getExpenses();

    void setExpenses(Float expenses);

    Float getPurchesCost();

    void setPurchesCost(Float purchesCost);

    Float getExchangeRate();

    void setExchangeRate(Float exchangeRate);

    Float getFreight();

    void setFreight(Float freight);


}
