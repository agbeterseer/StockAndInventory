/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 9:30:18 PM
 */
public class HelpStock {

    private Integer sno;
    String commodityId;
    Integer quantityIn;
    String receivedDate;
    //Integer quantityLeft;
    String receivedBy;
    String unit;
    Float unitprice;
    String commodityName;
    String unitcode;
    Integer quantitySupplied;
    String compactments;
    String status;
    String whousecode;
    private String MakeOrBuy;
    private String barcode;
    private String DiscountCategory;
    private Integer sub;
    String me;
    private String category;
    private Integer code;
    //Integer sno;

  
     public HelpStock(Integer code, String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category) {
        this.commodityId = commodityId;
        this.quantityIn = quantityIn;
        this.receivedDate = receivedDate;
        this.receivedBy = receivedBy;
        this.unitprice = unitprice;
        this.unitcode = unitcode;
        this.commodityName = commodityName;
        this.compactments = compactments;
        this.status = status;
        this.whousecode = whousecode;
        this.MakeOrBuy = MakeOrBuy;
        this.barcode = barcode;
        this.DiscountCategory = DiscountCategory;
        this.category = category;
        this.code = code;


    }

    public HelpStock(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category) {
         this.commodityId = commodityId;
        this.quantityIn = quantityIn;
        this.receivedDate = receivedDate;
        this.receivedBy = receivedBy;
        this.unitprice = unitprice;
        this.unitcode = unitcode;
        this.commodityName = commodityName;
        this.compactments = compactments;
        this.whousecode = whousecode;
        this.MakeOrBuy = MakeOrBuy;
        this.barcode = barcode;
        this.DiscountCategory = DiscountCategory;
        this.category = category;
        //this.code = code;
   
        // this.status = status;
    }
public HelpStock(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category, Integer sno) {
         this.commodityId = commodityId;
        this.quantityIn = quantityIn;
        this.receivedDate = receivedDate;
        this.receivedBy = receivedBy;
        this.unitprice = unitprice;
        this.unitcode = unitcode;
        this.commodityName = commodityName;
        this.compactments = compactments;
        this.whousecode = whousecode;
        this.MakeOrBuy = MakeOrBuy;
        this.barcode = barcode;
        this.DiscountCategory = DiscountCategory;
        this.category = category;
        this.sno = sno;
       /// this.code = code;

        // this.status = status;
    }
public HelpStock(String commodityId, Integer quantityIn, String whousecode) {
         this.commodityId = commodityId;
         this.quantityIn = quantityIn;
         this.whousecode = whousecode;
    
    }

public HelpStock(String commodityId, Integer sub) {
         this.commodityId = commodityId;
         this.sub = sub;
    }

  public HelpStock(Integer quantitySupplied) {
        this.quantitySupplied = quantitySupplied;
       
    }

    public String getWhousecode() {
        return whousecode;
    }

    public void setWhousecode(String whousecode) {
        this.whousecode = whousecode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getQuantityIn() {
        return quantityIn;
    }

    public void setQuantityIn(Integer quantityIn) {
        this.quantityIn = quantityIn;
    }

  
    public String getReceivedBy() {
        return receivedBy;
    }

    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

    public String getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
    }

 
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Float unitprice) {
        this.unitprice = unitprice;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public String getUnitcode() {
        return unitcode;
    }

    public void setUnitcode(String unitcode) {
        this.unitcode = unitcode;
    }

    public Integer getQuantitySupplied() {
        return quantitySupplied;
    }

    public void setQuantitySupplied(Integer quantitySupplied) {
        this.quantitySupplied = quantitySupplied;
    }

    public String getCompactments() {
        return compactments;
    }

    public void setCompactments(String compactments) {
        this.compactments = compactments;
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
     * @param barcode the barcode to set
     */
    public void setBarcode(String barcode) {
        this.barcode = barcode;
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

    /**
     * @return the sub
     */
    public Integer getSub() {
        return sub;
    }

    /**
     * @param sub the sub to set
     */
    public void setSub(Integer sub) {
        this.sub = sub;
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
     * @return the code
     */
    public Integer getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(Integer code) {
        this.code = code;
    }

   
}
