/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpSupply {

    Integer sno;
    String commodityId;
    String issuedBy;
    String distributorId;
    String dateSupplied;
    Integer quantitySupplied;
    private Float cogs;
    private String whcode;
    private String itemname;
    private String qtyleft;
    private String comodityname;
    private String location;
    private String phonenumber;

    public HelpSupply(Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied, Integer quantitySupplied, Float cogs, String whcode, String qtyleft, String comodityname, String location, String phonenumber) {
        this.sno = sno;
        this.commodityId = commodityId;
        this.issuedBy = issuedBy;
        this.distributorId = distributorId;
        this.dateSupplied = dateSupplied;
        this.quantitySupplied = quantitySupplied;
        this.cogs = cogs;
        this.whcode = whcode;
         //.this.itemname = itemname;
         this.qtyleft = qtyleft;
         this.comodityname = comodityname;
         this.location = location;
         this.phonenumber = phonenumber;
    }
    

    public HelpSupply(String commodityId, String issuedBy, String distributorId, String dateSupplied, Integer quantitySupplied, Float cogs, String whcode, String qtyleft, String comodityname, String location, String phonenumber) {
        this.commodityId = commodityId;
        this.issuedBy = issuedBy;
        this.distributorId = distributorId;
        this.dateSupplied = dateSupplied;
        this.quantitySupplied = quantitySupplied;
        this.cogs = cogs;
        this.whcode = whcode;
         this.comodityname = comodityname;
         this.location = location;
         this.phonenumber = phonenumber;
       
    }

     public HelpSupply(String commodityId, Float cogs, String whcode) {
        this.commodityId = commodityId;
        this.cogs = cogs;
        this.whcode = whcode;
    }

    public String getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    public String getDateSupplied() {
        return dateSupplied;
    }

    public void setDateSupplied(String dateSupplied) {
        this.dateSupplied = dateSupplied;
    }

    public String getDistributorId() {
        return distributorId;
    }

    public void setDistributorId(String distributorId) {
        this.distributorId = distributorId;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public Integer getQuantitySupplied() {
        return quantitySupplied;
    }

    public void setQuantitySupplied(Integer quantitySupplied) {
        this.quantitySupplied = quantitySupplied;
    }

    /**
     * @return the cogs
     */
    public Float getCogs() {
        return cogs;
    }

    /**
     * @param cogs the cogs to set
     */
    public void setCogs(Float cogs) {
        this.cogs = cogs;
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
     * @return the itemname
     */
    public String getItemname() {
        return itemname;
    }

    /**
     * @param itemname the itemname to set
     */
    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    /**
     * @return the qtyleft
     */
    public String getQtyleft() {
        return qtyleft;
    }

    /**
     * @param qtyleft the qtyleft to set
     */
    public void setQtyleft(String qtyleft) {
        this.qtyleft = qtyleft;
    }

    /**
     * @return the comodityname
     */
    public String getComodityname() {
        return comodityname;
    }

    /**
     * @param comodityname the comodityname to set
     */
    public void setComodityname(String comodityname) {
        this.comodityname = comodityname;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the phonenumber
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * @param phonenumber the phonenumber to set
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }


    
}
