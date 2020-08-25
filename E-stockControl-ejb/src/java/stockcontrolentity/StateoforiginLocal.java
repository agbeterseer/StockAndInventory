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
public interface StateoforiginLocal extends EJBLocalObject {

    String getCode();

    void setCode(String code);

    String getState();

    void setState(String state);

    String getCountry();

    void setCountry(String country);


}
