/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 8:54:12 PM
 */
public class StateHelper {

    String code;
    String state;
    String country;

    public StateHelper(String code, String state, String country) {
        this.code = code;
        this.state = state;
        this.country = country;
    }

    public StateHelper() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    
}
