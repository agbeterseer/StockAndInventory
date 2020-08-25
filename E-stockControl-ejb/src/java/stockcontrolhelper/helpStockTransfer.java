/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class helpStockTransfer {
    private Integer sno;
    private String itemcode;
    private String itemname;
    private Integer quantity;
    private String datetransferred;
    private String status;
    private String fromwarehouse;
    private String destination;
    private String barcode;
    private String makeorbuy;
    private String category;
    private Float unitprice;

    public helpStockTransfer(Integer sno, String itemcode, String itemname, Integer quantity, String status, String fromwarehouse, String destination, String barcode,String datetransferred, String makeorbuy, String category) {
        this.sno = sno;
        this.itemcode = itemcode;
        this.itemname = itemname;
        this.quantity = quantity;
        this.status = status;
        this.fromwarehouse = fromwarehouse;
        this.destination = destination;
        this.barcode = barcode;
        this.datetransferred = datetransferred;
        this.makeorbuy = makeorbuy;
        this.category = category;
    }

    public helpStockTransfer(String itemcode, String itemname, String datetransferred, Integer quantity,String status, String fromwarehouse, String destination, String barcode, String makeorbuy, String category,Float unitprice) {
        this.itemcode = itemcode;
        this.itemname = itemname;
        this.datetransferred = datetransferred;
         this.quantity = quantity;
        this.status = status;
        this.fromwarehouse = fromwarehouse;
        this.destination = destination;
        this.barcode = barcode;
        this.makeorbuy = makeorbuy;
        this.category = category;
        this.unitprice = unitprice;
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
     * @return the itemcode
     */
    public String getItemcode() {
        return itemcode;
    }

    /**
     * @param itemcode the itemcode to set
     */
    public void setItemcode(String itemcode) {
        this.itemcode = itemcode;
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
     * @return the quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the datetransferred
     */
    public String getDatetransferred() {
        return datetransferred;
    }

    /**
     * @param datetransferred the datetransferred to set
     */
    public void setDatetransferred(String datetransferred) {
        this.datetransferred = datetransferred;
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
     * @return the fromwarehouse
     */
    public String getFromwarehouse() {
        return fromwarehouse;
    }

    /**
     * @param fromwarehouse the fromwarehouse to set
     */
    public void setFromwarehouse(String fromwarehouse) {
        this.fromwarehouse = fromwarehouse;
    }

    /**
     * @return the destination
     */
    public String getDestination() {
        return destination;
    }

    /**
     * @param destination the destination to set
     */
    public void setDestination(String destination) {
        this.destination = destination;
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
     * @return the makeorbuy
     */
    public String getMakeorbuy() {
        return makeorbuy;
    }

    /**
     * @param makeorbuy the makeorbuy to set
     */
    public void setMakeorbuy(String makeorbuy) {
        this.makeorbuy = makeorbuy;
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
   

}
