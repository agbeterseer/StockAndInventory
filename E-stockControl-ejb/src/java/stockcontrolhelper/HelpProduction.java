/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 *  Created on : Jun 20, 2011, 7:33:22 PM
 */
public class HelpProduction {

       String commodityType;
    String quantityProduced;
    String matrialsUsed;
    String dateOfProduced;
    String manager;
    String commodityName;
    String commodityid;
    String status;
    ///Integer sno;

   public HelpProduction(String commodityType, String quantityProduced, String matrialsUsed, String dateOfProduced, String manager, String commodityid) {
        this.commodityType = commodityType;
        this.quantityProduced = quantityProduced;
        this.matrialsUsed = matrialsUsed;
        this.dateOfProduced = dateOfProduced;
        this.manager = manager;
        this.commodityid = commodityid;
    }
  

       public HelpProduction(String commodityType, String quantityProduced, String matrialsUsed, String dateOfProduced, String manager, String commodityid, String status) {
        this.commodityType = commodityType;
        this.quantityProduced = quantityProduced;
        this.matrialsUsed = matrialsUsed;
        this.dateOfProduced = dateOfProduced;
        this.manager = manager;
        this.commodityid = commodityid;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCommodityType() {
        return commodityType;
    }

    public void setCommodityType(String commodityType) {
        this.commodityType = commodityType;
    }

    public String getDateOfProduced() {
        return dateOfProduced;
    }

    public void setDateOfProduced(String dateOfProduced) {
        this.dateOfProduced = dateOfProduced;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getMatrialsUsed() {
        return matrialsUsed;
    }

    public void setMatrialsUsed(String matrialsUsed) {
        this.matrialsUsed = matrialsUsed;
    }

   public String getQuantityProduced() {
        return quantityProduced;
    }

    public void setQuantityProduced(String quantityProduced) {
        this.quantityProduced = quantityProduced;
    }



    public String getCommodityid() {
        return commodityid;
    }

    public void setCommodityid(String commodityid) {
        this.commodityid = commodityid;
    }
   

}
