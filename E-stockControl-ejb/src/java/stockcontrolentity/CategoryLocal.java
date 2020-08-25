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
public interface CategoryLocal extends EJBLocalObject {

    String getCategorycode();

    void setCategorycode(String categorycode);

    String getStockItemType();

    void setStockItemType(String stockItemType);

    String getCategorydescription();

    void setCategorydescription(String categorydescription);

    String getStatus();

    void setStatus(String status);

    String getDel();

    void setDel(String del);


}
