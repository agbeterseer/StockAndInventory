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
public interface GoodslimitsLocalHome extends EJBLocalHome {

    stockcontrolentity.GoodslimitsLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.GoodslimitsLocal create(java.lang.String key)  throws CreateException;

    Collection findByCommodityCode(String commodityCode) throws FinderException;

    Collection findByLowerLimit(String lowerLimit) throws FinderException;

    Collection findByUpperLimit(String upperLimit) throws FinderException;

}
