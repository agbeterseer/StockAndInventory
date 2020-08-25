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
public interface StaffLocal extends EJBLocalObject {

    String getUsername();

    void setUsername(String username);

    String getFirstName();

    void setFirstName(String firstName);

    String getLastName();

    void setLastName(String lastName);

    String getGender();

    void setGender(String gender);

    String getPosition();

    void setPosition(String position);

    String getNationality();

    void setNationality(String nationality);

    String getStateOfOrigin();

    void setStateOfOrigin(String stateOfOrigin);

    String getLga();

    void setLga(String lga);

    String getHomeAddress();

    void setHomeAddress(String homeAddress);

    String getPhoneNumber();

    void setPhoneNumber(String phoneNumber);

    String getDateOfAppointment();

    void setDateOfAppointment(String dateOfAppointment);

    byte [] getPassport();

    void setPassport(byte [] passport);

     String getDel();

    void setDel(String del);

      String getWhcode();

     void setWhcode(String whcode);



}
