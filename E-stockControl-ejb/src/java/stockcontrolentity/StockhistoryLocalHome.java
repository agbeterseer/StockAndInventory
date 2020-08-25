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
public interface StockhistoryLocalHome extends EJBLocalHome {

    stockcontrolentity.StockhistoryLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.StockhistoryLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByCommodityId(String commodityId) throws FinderException;

    Collection findByQuantityIn(Integer quantityIn) throws FinderException;

    Collection findByReceivedDate(String receivedDate) throws FinderException;

    Collection findByQuantityLeft(Integer quantityLeft) throws FinderException;

    Collection findByReceivedBy(String receivedBy) throws FinderException;

    Collection findByUnitprice(Float unitprice) throws FinderException;

    Collection findByCommodityName(String commodityName) throws FinderException;

    Collection findByUnitcode(String unitcode) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByCompartments(String compartments) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByWhcode(String whcode) throws FinderException;

    Collection findByMakeorbuy(String makeorbuy) throws FinderException;

    Collection findByCategory(String category) throws FinderException;

    Collection findByBatchcode(String batchcode) throws FinderException;

    Collection findByCode(Integer code) throws FinderException;

    Integer Max();



}
