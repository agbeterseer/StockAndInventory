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
public interface RolesLocal extends EJBLocalObject {

    String getRoleName();

    void setRoleName(String roleName);

    String getDefaultName();

    void setDefaultName(String defaultName);

   String getDel();

   void setDel(String del);


}
