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
public interface WarehouseLocal extends EJBLocalObject {

    String getWhcode();

    void setWhcode(String whcode);

    String getHouseName();

    void setHouseName(String houseName);

    String getDateCreated();

    void setDateCreated(String dateCreated);

    String getStatus();

    void setStatus(String status);

    String getAddress();

    void setAddress(String address);

    String getCapacity();

    void setCapacity(String capacity);

    String getDel();

    void setDel(String del);

    String getBcode();

    void setBcode(String bcode);


}
