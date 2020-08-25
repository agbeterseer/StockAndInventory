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
public interface DistributorLocalHome extends EJBLocalHome {

    stockcontrolentity.DistributorLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    //stockcontrolentity.DistributorLocalHome
    stockcontrolentity.DistributorLocal create(java.lang.String key)  throws CreateException;

    Collection findByUsername(String username) throws FinderException;

    Collection findByPassword(String password) throws FinderException;

    Collection findBySurname(String surname) throws FinderException;

    Collection findByFirstName(String firstName) throws FinderException;

    Collection findByMiddleName(String middleName) throws FinderException;

    Collection findByLastName(String lastName) throws FinderException;

    Collection findByOccupation(String occupation) throws FinderException;

    Collection findByOfficeAddress(String officeAddress) throws FinderException;

    Collection findByPhoneNumber(String phoneNumber) throws FinderException;

    Collection findByNationality(String nationality) throws FinderException;

    Collection findByStateororigin(String stateororigin) throws FinderException;

    Collection findByLga(String lga) throws FinderException;

}
