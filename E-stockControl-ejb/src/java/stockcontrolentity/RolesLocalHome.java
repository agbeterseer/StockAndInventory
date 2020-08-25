/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 *
 * @author JPT TERSOO AGBE
 */
public interface RolesLocalHome extends EJBLocalHome {

    stockcontrolentity.RolesLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.RolesLocal create(java.lang.String key)  throws CreateException;

    Collection findByRoleName(String roleName) throws FinderException;

    Collection findByDefaultName(String defaultName) throws FinderException;

    Collection findAll(String del) throws FinderException;

}
