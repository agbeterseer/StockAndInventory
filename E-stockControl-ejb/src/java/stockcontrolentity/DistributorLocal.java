/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import javax.ejb.EJBLocalObject;

/**
 *
 * @author JPT TERSOO AGBE
 */
public interface DistributorLocal extends EJBLocalObject {

    String getUsername();

    void setUsername(String username);

    String getPassword();

    void setPassword(String password);

    String getSurname();

    void setSurname(String surname);

    String getFirstName();

    void setFirstName(String firstName);

    String getMiddleName();

    void setMiddleName(String middleName);

    String getLastName();

    void setLastName(String lastName);

    String getOccupation();

    void setOccupation(String occupation);

    String getOfficeAddress();

    void setOfficeAddress(String officeAddress);

    String getPhoneNumber();

    void setPhoneNumber(String phoneNumber);

    String getNationality();

    void setNationality(String nationality);

    String getStateororigin();

    void setStateororigin(String stateororigin);

    String getLga();

    void setLga(String lga);


}
