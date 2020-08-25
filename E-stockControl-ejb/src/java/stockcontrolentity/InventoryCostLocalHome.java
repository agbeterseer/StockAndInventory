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
public interface InventoryCostLocalHome extends EJBLocalHome {

    stockcontrolentity.InventoryCostLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.InventoryCostLocal create(java.lang.String key)  throws CreateException;

    Collection findByItemCode(String itemCode) throws FinderException;

    Collection findByMaterialCost(Float materialCost) throws FinderException;

    Collection findByLabourCost(Float labourCost) throws FinderException;

    Collection findByOverheadCost(Float overheadCost) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByActualCost(Float actualCost) throws FinderException;

    Collection findByDateCreated(String dateCreated) throws FinderException;

    Collection findByExpenses(Float expenses) throws FinderException;

    Collection findByPurchesCost(Float purchesCost) throws FinderException;

    Collection findByExchangeRate(Float exchangeRate) throws FinderException;

    Collection findByFreight(Float freight) throws FinderException;

    Collection findAll(String del) throws FinderException;

  

}
