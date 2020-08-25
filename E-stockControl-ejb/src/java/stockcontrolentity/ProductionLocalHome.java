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
public interface ProductionLocalHome extends EJBLocalHome {

    stockcontrolentity.ProductionLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.ProductionLocal create(java.lang.String key)  throws CreateException;
    Collection findByCommodityId(String commodityid) throws FinderException;

    Collection findByProductionId(String productionId) throws FinderException;

    Collection findByCommodityType(String commodityType) throws FinderException;

    Collection findByQuantityProduced(String quantityProduced) throws FinderException;

    Collection findByMatrialsUsed(String matrialsUsed) throws FinderException;

    Collection findByDateOfProduced(String dateOfProduced) throws FinderException;

    Collection findByManager(String manager) throws FinderException;


    Collection findAll(String del) throws FinderException;

    Collection findBycommoditytype(String commodityType) throws FinderException;

  

}
