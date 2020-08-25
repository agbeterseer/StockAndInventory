/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpLimit {

    String commodityCode;
    String lowerLimit;
    String upperLimit;
    private String whcode;

    public HelpLimit(String commodityCode, String lowerLimit, String upperLimit,String whcode) {
        this.commodityCode = commodityCode;
        this.lowerLimit = lowerLimit;
        this.upperLimit = upperLimit;
        this.whcode = whcode;
    }

    public HelpLimit(String lowerLimit, String upperLimit) {
        this.lowerLimit = lowerLimit;
        this.upperLimit = upperLimit;
    }

    public String getCommodityCode() {
        return commodityCode;
    }

    public void setCommodityCode(String commodityCode) {
        this.commodityCode = commodityCode;
    }

    public String getLowerLimit() {
        return lowerLimit;
    }

    public void setLowerLimit(String lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    public String getUpperLimit() {
        return upperLimit;
    }

    public void setUpperLimit(String upperLimit) {
        this.upperLimit = upperLimit;
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
