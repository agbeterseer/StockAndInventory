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
public interface LgaLocalHome extends EJBLocalHome {

    stockcontrolentity.LgaLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.LgaLocal create(java.lang.String key)  throws CreateException;

    Collection findByCode(String code) throws FinderException;

    Collection findByLga(String lga) throws FinderException;

    Collection findByState(String state) throws FinderException;

}
