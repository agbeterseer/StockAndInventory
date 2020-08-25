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
public interface LimitsLocalHome extends EJBLocalHome {

    stockcontrolentity.LimitsLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.LimitsLocal create(java.lang.String key)  throws CreateException;

    Collection findByCode(String code) throws FinderException;

    Collection findByLower1(String lower) throws FinderException;

    Collection findByUpper1(String upper) throws FinderException;

    Collection findAll(String whcode) throws FinderException;

    LimitsLocal findByCommodityIdAndWarehouse(String code, String whcode) throws FinderException;

}
