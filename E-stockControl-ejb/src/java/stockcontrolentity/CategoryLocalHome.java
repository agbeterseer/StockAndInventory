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
public interface CategoryLocalHome extends EJBLocalHome {

    stockcontrolentity.CategoryLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.CategoryLocal create(java.lang.String key)  throws CreateException;

    Collection findByCategorycode(String categorycode) throws FinderException;

    Collection findByStockItemType(String stockItemType) throws FinderException;

    Collection findByCategorydescription(String categorydescription) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByAll(String status) throws FinderException;

    Collection findBystockItemTypeAndDel(String stockItemType, String status) throws FinderException;

}
