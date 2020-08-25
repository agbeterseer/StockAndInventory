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
public interface LimitsLocal extends EJBLocalObject {

    String getCode();

    void setCode(String code);

    String getLower();

    void setLower(String lower);

    String getUpper();

    void setUpper(String upper);

    String getWhcode();

     void setWhcode(String Whcode);

     String getDel();

    void setDel(String setDel);


}
