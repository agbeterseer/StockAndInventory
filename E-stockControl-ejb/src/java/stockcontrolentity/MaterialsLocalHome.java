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
public interface MaterialsLocalHome extends EJBLocalHome {

    stockcontrolentity.MaterialsLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.MaterialsLocal create(java.lang.Integer key)  throws CreateException;

    Collection findById(Integer id) throws FinderException;

    Collection findByMaterialName(String materialName) throws FinderException;

    Collection findByMaterialType(String materialType) throws FinderException;

    Collection findByQuantityUsed(String quantityUsed) throws FinderException;

    Collection findByDateUsed(String dateUsed) throws FinderException;

    Collection findByAmount(Float amount) throws FinderException;

    Collection findByManager(String manager) throws FinderException;
    Collection findBy(String materialName, String del) throws FinderException;
    Collection findAll(String del) throws FinderException;
   Collection findByItemCode(String itemCode, String del) throws FinderException;


    Integer Max();

}
