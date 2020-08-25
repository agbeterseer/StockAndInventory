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
public interface StocktransferLocalHome extends EJBLocalHome {

    stockcontrolentity.StocktransferLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.StocktransferLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByItemcode(String itemcode) throws FinderException;

    Collection findByItemname(String itemname) throws FinderException;

    Collection findByQuantity(Integer quantity) throws FinderException;

    Collection findByDatetransferred(String datetransferred) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByFromwarehouse(String fromwarehouse) throws FinderException;

    Collection findByDestination(String destination) throws FinderException;

    Collection findByBarcode(String barcode) throws FinderException;

    Collection findByMakeorbuy(String makeorbuy) throws FinderException;

    Collection findByCategory(String category) throws FinderException;

    Collection findByUnitprice(Float unitprice) throws FinderException;

    Collection findByDestinationAndStatus(String destination, String status) throws FinderException;

    Collection findByDateAndWhcode(String datetransferred, String status) throws FinderException;

    Integer Max();

}
