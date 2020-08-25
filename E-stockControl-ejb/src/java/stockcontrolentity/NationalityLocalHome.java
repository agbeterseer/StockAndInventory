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
public interface NationalityLocalHome extends EJBLocalHome {

    stockcontrolentity.NationalityLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.NationalityLocal create(java.lang.String key)  throws CreateException;

    Collection findByCode(String code) throws FinderException;

    Collection findByCountry(String country) throws FinderException;

    Collection findAll() throws FinderException;

}
