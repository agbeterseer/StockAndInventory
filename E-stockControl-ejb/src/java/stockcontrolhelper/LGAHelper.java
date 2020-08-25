/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 9:15:12 PM
 */
public class LGAHelper {
    String code;
    String lga;
    String state;

    public LGAHelper(String code, String lga, String state) {
        this.code = code;
        this.lga = lga;
        this.state = state;
    }

    public LGAHelper() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLga() {
        return lga;
    }

    public void setLga(String lga) {
        this.lga = lga;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    

}
