/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class helpSetCost {

    String costType;
    String status;

    public helpSetCost(String costType, String status) {
        this.costType = costType;
        this.status = status;
    }

    public String getCostType() {
        return costType;
    }

    public void setCostType(String costType) {
        this.costType = costType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }



}
