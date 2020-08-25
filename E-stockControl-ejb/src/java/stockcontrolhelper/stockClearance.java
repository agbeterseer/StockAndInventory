/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class stockClearance {
private Integer sno;
    private String commodityId;
    private Integer quantityIn;
   private String receivedDate;
    private //Integer quantityLeft;
    String receivedBy;
    private String unit;
    private Float unitprice;
    String commodityName;
    private String unitcode;
    private Integer quantitySupplied;
    private String compactments;
    private String status;
    private String whousecode;
    private String MakeOrBuy;
    private String barcode;
    private String DiscountCategory;
    private Integer sub;
    private String batchcode;
    private String category;


   
 public stockClearance(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, String unit, Float unitprice, String unitcode, String compactments,String whousecode, String MakeOrBuy, String barcode,String category,String batchcode,  String status) {
        this.commodityId = commodityId;
        this.quantityIn = quantityIn;
        this.receivedDate = receivedDate;
        this.receivedBy = receivedBy;
        this.unit = unit;
        this.unitprice = unitprice;
        this.unitcode = unitcode;
        this.compactments = compactments;
        this.status = status;
        this.whousecode = whousecode;
        this.MakeOrBuy = MakeOrBuy;
        this.barcode = barcode;
       // this.DiscountCategory = DiscountCategory;
        this.category = category;
        this.batchcode = batchcode;
    }
  public stockClearance(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, String unit, Float unitprice, String unitcode, String compactments, String whousecode, String MakeOrBuy,String category,String batchcode, String status) {
        this.commodityId = commodityId;
        this.quantityIn = quantityIn;
        this.receivedDate = receivedDate;
        this.receivedBy = receivedBy;
        this.unit = unit;
        this.unitprice = unitprice;
        this.unitcode = unitcode;
        this.compactments = compactments;
       this.status = status;
        this.whousecode = whousecode;
        this.MakeOrBuy = MakeOrBuy;
       // this.barcode = barcode;
       // this.DiscountCategory = DiscountCategory;
        this.category = category;
        this.batchcode = batchcode;
    }
 
    /**
     * @return the commodityId
     */
    public String getCommodityId() {
        return commodityId;
    }

    /**
     * @param commodityId the commodityId to set
     */
    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    /**
     * @return the quantityIn
     */
    public Integer getQuantityIn() {
        return quantityIn;
    }

    /**
     * @param quantityIn the quantityIn to set
     */
    public void setQuantityIn(Integer quantityIn) {
        this.quantityIn = quantityIn;
    }

    /**
     * @return the receivedDate
     */
    public String getReceivedDate() {
        return receivedDate;
    }

    /**
     * @param receivedDate the receivedDate to set
     */
    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
    }

    /**
     * @return the receivedBy
     */
    public String getReceivedBy() {
        return receivedBy;
    }

    /**
     * @param receivedBy the receivedBy to set
     */
    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the unitprice
     */
    public Float getUnitprice() {
        return unitprice;
    }

    /**
     * @param unitprice the unitprice to set
     */
    public void setUnitprice(Float unitprice) {
        this.unitprice = unitprice;
    }

    /**
     * @return the unitcode
     */
    public String getUnitcode() {
        return unitcode;
    }

    /**
     * @param unitcode the unitcode to set
     */
    public void setUnitcode(String unitcode) {
        this.unitcode = unitcode;
    }

    /**
     * @return the quantitySupplied
     */
    public Integer getQuantitySupplied() {
        return quantitySupplied;
    }

    /**
     * @param quantitySupplied the quantitySupplied to set
     */
    public void setQuantitySupplied(Integer quantitySupplied) {
        this.quantitySupplied = quantitySupplied;
    }

    /**
     * @return the compactments
     */
    public String getCompactments() {
        return compactments;
    }

    /**
     * @param compactments the compactments to set
     */
    public void setCompactments(String compactments) {
        this.compactments = compactments;
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

    /**
     * @return the whousecode
     */
    public String getWhousecode() {
        return whousecode;
    }

    /**
     * @param whousecode the whousecode to set
     */
    public void setWhousecode(String whousecode) {
        this.whousecode = whousecode;
    }

    /**
     * @return the MakeOrBuy
     */
    public String getMakeOrBuy() {
        return MakeOrBuy;
    }

    /**
     * @param MakeOrBuy the MakeOrBuy to set
     */
    public void setMakeOrBuy(String MakeOrBuy) {
        this.MakeOrBuy = MakeOrBuy;
    }

    /**
     * @return the barcode
     */
    public String getBarcode() {
        return barcode;
    }

    /**
     * @return the DiscountCategory
     */
    public String getDiscountCategory() {
        return DiscountCategory;
    }

    /**
     * @param DiscountCategory the DiscountCategory to set
     */
    public void setDiscountCategory(String DiscountCategory) {
        this.DiscountCategory = DiscountCategory;
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the batchcode
     */
    public String getBatchcode() {
        return batchcode;
    }

    /**
     * @param batchcode the batchcode to set
     */
    public void setBatchcode(String batchcode) {
        this.batchcode = batchcode;
    }


    
}
