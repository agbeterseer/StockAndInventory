/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 9:01:11 PM
 */
public class NationalityHelper {
  private String code;
  private String country;

    public NationalityHelper(String code, String country) {
        this.code = code;
        this.country = country;
    }

    public NationalityHelper() {
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



}
