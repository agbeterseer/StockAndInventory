/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpInventoryCost {

    String itemCode;

    private Float materialCost;
    private Float labourCost;
    private Float overheadCost;
    private Float actualCost;
    private String dateCreated;
    private Float expenses;
    private Float purchesCost;
    private Float exchangeRate;
    private Float freight;

    public HelpInventoryCost(String itemCode, Float materialCost, Float labourCost, Float overheadCost,Float actualCost,String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight ) {
      
        this.itemCode = itemCode;
        this.materialCost = materialCost;
        this.labourCost = labourCost;
        this.overheadCost = overheadCost;
        this.actualCost = actualCost;
        this.dateCreated = dateCreated;
        this.exchangeRate = exchangeRate;
        this.expenses = expenses;
        this.purchesCost = purchesCost;
        this.freight = freight;
    }

      public HelpInventoryCost(String itemCode, Float materialCost, Float labourCost, Float overheadCost,Float actualCost,String dateCreated ) {
        //  this.sno = sno;
          this.itemCode = itemCode;
        this.materialCost = materialCost;
        this.labourCost = labourCost;
        this.overheadCost = overheadCost;
        this.actualCost = actualCost;
        this.dateCreated = dateCreated;
     
    }
        public HelpInventoryCost(String itemCode, String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight ) {
        //this.sno = sno;
            this.itemCode = itemCode;
        this.dateCreated = dateCreated;
        this.exchangeRate = exchangeRate;
        this.expenses = expenses;
        this.purchesCost = purchesCost;
        this.freight = freight;
    }
    public HelpInventoryCost() {
    }

    

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

  

    /**
     * @return the actualCost
     */
    public Float getActualCost() {
        return actualCost;
    }

    /**
     * @param actualCost the actualCost to set
     */
    public void setActualCost(Float actualCost) {
        this.actualCost = actualCost;
    }

    /**
     * @return the dateCreated
     */
    public String getDateCreated() {
        return dateCreated;
    }

    /**
     * @param dateCreated the dateCreated to set
     */
    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    /**
     * @return the expenses
     */
    public Float getExpenses() {
        return expenses;
    }

    /**
     * @param expenses the expenses to set
     */
    public void setExpenses(Float expenses) {
        this.expenses = expenses;
    }

    /**
     * @return the purchesCost
     */
    public Float getPurchesCost() {
        return purchesCost;
    }

    /**
     * @param purchesCost the purchesCost to set
     */
    public void setPurchesCost(Float purchesCost) {
        this.purchesCost = purchesCost;
    }

    /**
     * @return the exchangeRate
     */
    public Float getExchangeRate() {
        return exchangeRate;
    }

    /**
     * @param exchangeRate the exchangeRate to set
     */
    public void setExchangeRate(Float exchangeRate) {
        this.exchangeRate = exchangeRate;
    }

    /**
     * @return the freight
     */
    public Float getFreight() {
        return freight;
    }

    /**
     * @param freight the freight to set
     */
    public void setFreight(Float freight) {
        this.freight = freight;
    }

    /**
     * @return the materialCost
     */
    public Float getMaterialCost() {
        return materialCost;
    }

    /**
     * @param materialCost the materialCost to set
     */
    public void setMaterialCost(Float materialCost) {
        this.materialCost = materialCost;
    }

    /**
     * @return the labourCost
     */
    public Float getLabourCost() {
        return labourCost;
    }

    /**
     * @param labourCost the labourCost to set
     */
    public void setLabourCost(Float labourCost) {
        this.labourCost = labourCost;
    }

    /**
     * @return the overheadCost
     */
    public Float getOverheadCost() {
        return overheadCost;
    }

    /**
     * @param overheadCost the overheadCost to set
     */
    public void setOverheadCost(Float overheadCost) {
        this.overheadCost = overheadCost;
    }

 
}
