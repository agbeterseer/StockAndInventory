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
public interface SectionsLocalHome extends EJBLocalHome {

    stockcontrolentity.SectionsLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.SectionsLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByName(String name) throws FinderException;

    Collection findByCapacity(String capacity) throws FinderException;

    Collection findByDescription(String description) throws FinderException;

    Collection findByStatus(String status) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByTrack(Integer track) throws FinderException;

    Collection findByWhcode(String whcode) throws FinderException;

    Collection findByDelAndWhcode(String del, String whcode) throws FinderException;

    stockcontrolentity.SectionsLocal findByNameAndWhcode(String name, String whcode) throws FinderException;

    Collection findAll(String del) throws FinderException;

    Integer Max();

}
