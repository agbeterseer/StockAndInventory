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
public interface ProductionhistoryLocalHome extends EJBLocalHome {

    stockcontrolentity.ProductionhistoryLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.ProductionhistoryLocal create(java.lang.Integer key)  throws CreateException;

    Collection findByProductionId(Integer productionId) throws FinderException;

    Collection findByCommodityType(String commodityType) throws FinderException;

    Collection findByQuantityProduced(String quantityProduced) throws FinderException;

    Collection findByMatrialsUsed(String matrialsUsed) throws FinderException;

    Collection findByDateOfProduced(String dateOfProduced) throws FinderException;

    Collection findByManager(String manager) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByCommodityid(String commodityid) throws FinderException;

    Collection findByCompartments(String compartments) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    //MAX homeMethod();

    Integer max();

}
