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
public interface StateoforiginLocalHome extends EJBLocalHome {

    stockcontrolentity.StateoforiginLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.StateoforiginLocal create(java.lang.String key)  throws CreateException;

    Collection findByCode(String code) throws FinderException;

    Collection findByState(String state) throws FinderException;

    Collection findByCountry(String country) throws FinderException;

}
