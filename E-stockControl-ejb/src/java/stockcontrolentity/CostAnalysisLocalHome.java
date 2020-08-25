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
public interface CostAnalysisLocalHome extends EJBLocalHome {

    stockcontrolentity.CostAnalysisLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.CostAnalysisLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByMaterials(String materials) throws FinderException;

    Collection findByAmount(Float amount) throws FinderException;

    Collection findByItemCode(String itemCode) throws FinderException;

    Collection findByDateAdded(String dateAdded) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findAll(String del) throws FinderException;

    Integer Max();

}
