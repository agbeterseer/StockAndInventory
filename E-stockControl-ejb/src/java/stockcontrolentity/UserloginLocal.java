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
public interface UserloginLocal extends EJBLocalObject {

    String getUsername();

    void setUsername(String username);

    String getPassword();

    void setPassword(String password);

    String getRole();

    void setRole(String role);

    String getDel();

    void setDel(String del);


}
