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
public interface UserloginLocalHome extends EJBLocalHome {

    stockcontrolentity.UserloginLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.UserloginLocal create(java.lang.String key)  throws CreateException;

    Collection findByUsername(String username) throws FinderException;

    Collection findByPassword(String password) throws FinderException;

    Collection findByRole(String role) throws FinderException;

}
