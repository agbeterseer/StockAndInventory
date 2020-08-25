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
public interface InventoryCostSetupLocal extends EJBLocalObject {

    String getCostType();

    void setCostType(String costType);

    String getStatus();

    void setStatus(String status);

    String getWhcode();

    void setWhcode(String whcode);


}
