/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpCategory {
    private String categorycode;
    private String stockItemType;
    private String categorydescription;
    private String status;
    String del;

    public HelpCategory(String categorycode, String stockItemType, String categorydescription, String status) {
        this.categorycode = categorycode;
        this.stockItemType = stockItemType;
        this.categorydescription = categorydescription;
        this.status = status;
     
    }

    public HelpCategory() {
    }

    /**
     * @return the categorycode
     */
    public String getCategorycode() {
        return categorycode;
    }

    /**
     * @param categorycode the categorycode to set
     */
    public void setCategorycode(String categorycode) {
        this.categorycode = categorycode;
    }

    /**
     * @return the categoryname
     */
    public String getStockItemType() {
        return stockItemType;
    }

    /**
     * @param categoryname the categoryname to set
     */
    public void setStockItemType(String stockItemType) {
        this.stockItemType = stockItemType;
    }

    /**
     * @return the categorydescription
     */
    public String getCategorydescription() {
        return categorydescription;
    }

    /**
     * @param categorydescription the categorydescription to set
     */
    public void setCategorydescription(String categorydescription) {
        this.categorydescription = categorydescription;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    
}
