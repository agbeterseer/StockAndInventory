/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 10:33:12 PM
 */
public class staffHelper {

    String username;
    String firstName;
    String lastName;
    String gender;
    String position;
    String nationality;
    String stateOfOrigin;
    String lga;
    String homeAddress;
    String phoneNumber;
    String dateOfAppointment;
    byte[] passport;
    private String whcode;

    public staffHelper(String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport, String whcode) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.position = position;
        this.nationality = nationality;
        this.stateOfOrigin = stateOfOrigin;
        this.lga = lga;
        this.homeAddress = homeAddress;
        this.phoneNumber = phoneNumber;
        this.dateOfAppointment = dateOfAppointment;
        this.passport = passport;
        this.whcode = whcode;
    }

    public staffHelper() {
    }

    public String getDateOfAppointment() {
        return dateOfAppointment;
    }

    public void setDateOfAppointment(String dateOfAppointment) {
        this.dateOfAppointment = dateOfAppointment;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLga() {
        return lga;
    }

    public void setLga(String lga) {
        this.lga = lga;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public byte[] getPassport() {
        return passport;
    }

    public void setPassport(byte[] passport) {
        this.passport = passport;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getStateOfOrigin() {
        return stateOfOrigin;
    }

    public void setStateOfOrigin(String stateOfOrigin) {
        this.stateOfOrigin = stateOfOrigin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the whcode
     */
    public String getWhcode() {
        return whcode;
    }

    /**
     * @param whcode the whcode to set
     */
    public void setWhcode(String whcode) {
        this.whcode = whcode;
    }
 

}
