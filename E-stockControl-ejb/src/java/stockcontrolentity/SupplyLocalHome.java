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
public interface SupplyLocalHome extends EJBLocalHome {

    stockcontrolentity.SupplyLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.SupplyLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByCommodityId(String commodityId) throws FinderException;

    Collection findByIssuedBy(String issuedBy) throws FinderException;

    Collection findByDistributorId(String distributorId) throws FinderException;

    Collection findByDateSupplied(String dateSupplied) throws FinderException;

    Collection findByQuantitySupplied(Integer quantitySupplied) throws FinderException;

    Collection findAll() throws FinderException;

    Collection findByCategory(String commodityId, String whcode) throws FinderException;

    Integer Max();

    Collection findByWhcode(String Whcode) throws FinderException;

    Collection findByComodityname(String comodityname) throws FinderException;

}
