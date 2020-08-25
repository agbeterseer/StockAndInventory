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
public interface WarehouseLocalHome extends EJBLocalHome {

    stockcontrolentity.WarehouseLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.WarehouseLocal create(java.lang.String key)  throws CreateException;

    Collection findByWhcode(String whcode) throws FinderException;

    Collection findByHouseName(String houseName) throws FinderException;

    Collection findByDateCreated(String dateCreated) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByAddress(String address) throws FinderException;

    Collection findByCapacity(String capacity) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByBcode(String bcode) throws FinderException;

    Collection findByAll(String del) throws FinderException;

}
