/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class helpwarehouse {

    String whcode;
    String houseName;
    String dateCreated;
    String status;
    String address;
    String capacity;
    private String bcode;

    public helpwarehouse(String whcode, String houseName, String dateCreated, String status, String address, String capacity, String bcode) {
        this.whcode = whcode;
        this.houseName = houseName;
        this.dateCreated = dateCreated;
        this.status = status;
        this.address = address;
        this.capacity = capacity;
        this.bcode = bcode;
    }
       public helpwarehouse(String houseName, String dateCreated, String status, String address, String capacity, String bcode) {
       // this.whcode = whcode;
        this.houseName = houseName;
        this.dateCreated = dateCreated;
        this.status = status;
        this.address = address;
        this.capacity = capacity;
        this.bcode = bcode;
    }

     public helpwarehouse(String houseName, String dateCreated, String address, String capacity, String bcode) {
       this.houseName = houseName;
        this.dateCreated = dateCreated;
       // this.status = status;
        this.address = address;
        this.capacity = capacity;
        this.bcode = bcode;
    }
   

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWhcode() {
        return whcode;
    }

    public void setWhcode(String whcode) {
        this.whcode = whcode;
    }

    /**
     * @return the bcode
     */
    public String getBcode() {
        return bcode;
    }

    /**
     * @param bcode the bcode to set
     */
    public void setBcode(String bcode) {
        this.bcode = bcode;
    }
}
