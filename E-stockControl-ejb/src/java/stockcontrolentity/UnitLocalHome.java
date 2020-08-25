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
public interface UnitLocalHome extends EJBLocalHome {

    stockcontrolentity.UnitLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.UnitLocal create(java.lang.Integer key)  throws CreateException;
    Collection findBySno(Integer sno) throws FinderException;

    Collection findByUnitcode(String unitcode) throws FinderException;

    Collection findByUnitName(String unitName) throws FinderException;

    Collection findByUnitType(String unitType) throws FinderException;

    Collection findByCommodidtyType(String commodidtyType) throws FinderException;

    UnitLocal findBySnoAndWarehouse(Integer sno, String whcode) throws FinderException;
    Collection findByUnit(String unitcode, String whcode) throws FinderException;

    Collection findAll(String whcode) throws FinderException;

    Integer Max();

}
