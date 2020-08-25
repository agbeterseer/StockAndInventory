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
public interface InventoryCostSetupLocalHome extends EJBLocalHome {

    stockcontrolentity.InventoryCostSetupLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.InventoryCostSetupLocal create(java.lang.String key)  throws CreateException;

    Collection findByCostType(String costType) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByWhcode(String whcode) throws FinderException;
    
    Collection findByTypeAndStatus(String costType, String status) throws FinderException;

    Collection findAll() throws FinderException;
}
