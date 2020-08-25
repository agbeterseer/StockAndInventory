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
public interface StaffLocalHome extends EJBLocalHome {

    stockcontrolentity.StaffLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.StaffLocal create(java.lang.String key)  throws CreateException;

    Collection findByUsername(String username) throws FinderException;

    Collection findByFirstName(String firstName) throws FinderException;

    Collection findByLastName(String lastName) throws FinderException;

    Collection findByGender(String gender) throws FinderException;

    Collection findByPosition(String position) throws FinderException;

    Collection findByNationality(String nationality) throws FinderException;

    Collection findByStateOfOrigin(String stateOfOrigin) throws FinderException;

    Collection findByLga(String lga) throws FinderException;

    Collection findByHomeAddress(String homeAddress) throws FinderException;

    Collection findByPhoneNumber(String phoneNumber) throws FinderException;

    Collection findByDateOfAppointment(String dateOfAppointment) throws FinderException;

    Collection findAll()throws FinderException;

    Collection findByName1(String stafname) throws FinderException;
    

}
