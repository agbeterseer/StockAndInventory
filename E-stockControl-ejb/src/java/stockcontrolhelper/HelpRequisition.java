/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpRequisition {

    Integer sno;
    String commodityId;
    String dateoFRequest;
    String manager;
    String requisitionCode;
    String role;
    String comment;
    private Integer quantity;
    private String status;

    public HelpRequisition(Integer sno, String commodityId,  String dateoFRequest, String manager, String requisitionCode, String role, String comment,Integer quantity,String status) {
        this.sno = sno;
        this.commodityId = commodityId;
      
        this.dateoFRequest = dateoFRequest;
        this.manager = manager;
        this.requisitionCode = requisitionCode;
        this.role = role;
        this.comment = comment;
        this.quantity = quantity;
        this.status = status;
    }

    public HelpRequisition(String commodityId,  String dateoFRequest, String manager, String requisitionCode, String role, String comment,Integer quantity,String status) {
        this.commodityId = commodityId;
 
        this.dateoFRequest = dateoFRequest;
        this.manager = manager;
        this.requisitionCode = requisitionCode;
        this.role = role;
        this.comment = comment;
        this.quantity = quantity;
         this.status = status;
    }

    public HelpRequisition() {
    }

    public String getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

  
    public String getDateoFRequest() {
        return dateoFRequest;
    }

    public void setDateoFRequest(String dateoFRequest) {
        this.dateoFRequest = dateoFRequest;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getRequisitionCode() {
        return requisitionCode;
    }

    public void setRequisitionCode(String requisitionCode) {
        this.requisitionCode = requisitionCode;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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
