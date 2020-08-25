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
public interface RequitionLocalHome extends EJBLocalHome {

    stockcontrolentity.RequitionLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.RequitionLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByCommodityId(String commodityId) throws FinderException;

   // Collection findByCommodityName(String commodityName) throws FinderException;

    Collection findByDateoFRequest(String dateoFRequest) throws FinderException;

    Collection findByManager(String manager) throws FinderException;

    Collection findByRequisitionCode(String requisitionCode)throws FinderException;

    Collection findByStatus(String status)throws FinderException;
    Collection findAll()throws FinderException;

    Integer Max();

}
