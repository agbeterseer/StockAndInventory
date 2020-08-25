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
public interface StockLocalHome extends EJBLocalHome {

    stockcontrolentity.StockLocal findByPrimaryKey(java.lang.String key) throws FinderException;

    stockcontrolentity.StockLocal create(java.lang.String key) throws CreateException;

    Collection findByCommodityId(String commodityId) throws FinderException;

    Collection findByQuantityIn(Integer quantityIn) throws FinderException;

    Collection findByReceivedDate(String receivedDate) throws FinderException;

    Collection findByQuantityLeft(Integer quantityLeft) throws FinderException;

    Collection findByReceivedBy(String receivedBy) throws FinderException;

    Collection findByUnitprice(Float unitprice) throws FinderException;

    Collection findByCommodityName(String commodityName) throws FinderException;

    Collection findByUnitcode(String unitcode) throws FinderException;

    Collection findByCommodityIdAndWarehouse(String commodityName, String whcode) throws FinderException;

    StockLocal findBycommodityIdAndWarehouse(String commodityName, String whcode) throws FinderException;

    Collection findBycategoryandwhcode(String category, String whcode) throws FinderException;
    //findByWhcodeAndCompartments
    Collection findByCategory(String category) throws FinderException;
    
    Collection findAll(String del, String whcode) throws FinderException;

    Collection findBycommodityIdAndWhcodeAndDel(String commodityId, String whcode, String del) throws FinderException;

    Collection findByCategoryAndWhcodeAndMakeorBuyAndDel(String category, String whcode, String makeorbuy, String del) throws FinderException;

    Collection findByWhcodeAndCompartments(String whcode, String compactments) throws FinderException;

    Collection findBycommodityName(String commodityName, String whcode, String del) throws FinderException;

    Collection findBycommodityId2(String commodityName) throws FinderException;

    Collection findByDel(String del) throws FinderException;
    
}
