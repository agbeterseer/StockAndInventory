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
public interface ItemsLocalHome extends EJBLocalHome {

    stockcontrolentity.ItemsLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.ItemsLocal create(java.lang.String key)  throws CreateException;

    Collection findByItemcode(String itemcode) throws FinderException;

    Collection findByItemname(String itemname) throws FinderException;

    Collection findByCategory(String category) throws FinderException;

    Collection findByMakeorbuy(String makeorbuy) throws FinderException;

    Collection findByDescription(String description) throws FinderException;

    Collection findByAuthorisation(String authorisation) throws FinderException;

    Collection findByDateadded(String dateadded) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByItemName(String itemname) throws FinderException;

    Collection findByAll(String code) throws FinderException;

    Collection findByMakeorbuyAndDel(String makeorbuy, String del) throws FinderException;

}
