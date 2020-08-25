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
public interface StockInventoryEditionsLocal extends EJBLocalObject {

    String getId();

    void setId(String id);

    String getEditionName();

    void setEditionName(String editionName);

    String getEditionStatus();

    void setEditionStatus(String editionStatus);


}
