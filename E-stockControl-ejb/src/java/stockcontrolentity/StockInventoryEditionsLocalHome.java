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
public interface StockInventoryEditionsLocalHome extends EJBLocalHome {

    stockcontrolentity.StockInventoryEditionsLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.StockInventoryEditionsLocal create(java.lang.String key)  throws CreateException;

    Collection findById(String id) throws FinderException;

    Collection findByEditionName(String editionName) throws FinderException;

    Collection findByEditionStatus(String editionStatus) throws FinderException;

    Collection findByAll() throws FinderException;

}
