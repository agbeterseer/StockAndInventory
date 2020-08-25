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
public interface ItemsLocal extends EJBLocalObject {

    String getItemcode();

    void setItemcode(String itemcode);

    String getItemname();

    void setItemname(String itemname);

    String getCategory();

    void setCategory(String category);

    String getMakeorbuy();

    void setMakeorbuy(String makeorbuy);

    String getDescription();

    void setDescription(String description);

    String getAuthorisation();

    void setAuthorisation(String authorisation);

    String getDateadded();

    void setDateadded(String dateadded);

    String getDel();

    void setDel(String del);

    String getWhcode();

    void setWhcode(String whcode);


}
