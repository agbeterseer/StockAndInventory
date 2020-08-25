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
public interface DbLocalHome extends EJBLocalHome {

    stockcontrolentity.DbLocal findByPrimaryKey(java.lang.Integer key)  throws FinderException;
    
    stockcontrolentity.DbLocal create(java.lang.Integer key)  throws CreateException;

    Collection findBySno(Integer sno) throws FinderException;

    Collection findByHost(String host) throws FinderException;

    Collection findByUsername(String username) throws FinderException;

    Collection findByPassword(String password) throws FinderException;

    Collection findByDbname(String dbname) throws FinderException;

    Integer Max();

}
