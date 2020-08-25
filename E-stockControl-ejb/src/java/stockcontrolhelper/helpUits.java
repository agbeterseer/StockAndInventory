/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 8:45:20 PM
 */
public class helpUits {

    String id;
    String unitName;
    String unitType;
    String commodidtyType;
    String unitcode;
    private String whcode;
    private Integer sno;

  

       public helpUits(Integer sno, String unitName, String unitType, String commodidtyType, String unitcode, String whcode) {
        
        this.unitName = unitName;
        this.unitType = unitType;
        this.commodidtyType = commodidtyType;
            this.unitcode = unitcode;
            this.whcode = whcode;
            this.sno = sno;
    }

    public String getCommodidtyType() {
        return commodidtyType;
    }

    public void setCommodidtyType(String commodidtyType) {
        this.commodidtyType = commodidtyType;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    public String getUnitcode() {
        return unitcode;
    }

    public void setUnitcode(String unitcode) {
        this.unitcode = unitcode;
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

    /**
     * @return the sno
     */
    public Integer getSno() {
        return sno;
    }

    /**
     * @param sno the sno to set
     */
    public void setSno(Integer sno) {
        this.sno = sno;
    }
    
}
