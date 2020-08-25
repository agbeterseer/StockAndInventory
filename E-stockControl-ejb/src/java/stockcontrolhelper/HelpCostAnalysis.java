/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpCostAnalysis {

    Integer sno;
    String materials;
    Float amount;
    String itemCode;
    String dateAdded;

    public HelpCostAnalysis(Integer sno, String materials, Float amount, String itemCode, String dateAdded) {
        this.sno = sno;
        this.materials = materials;
        this.amount = amount;
        this.itemCode = itemCode;
        this.dateAdded = dateAdded;
    }
       public HelpCostAnalysis(String materials, Float amount, String itemCode, String dateAdded) {
         this.materials = materials;
        this.amount = amount;
        this.itemCode = itemCode;
        this.dateAdded = dateAdded;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getMaterials() {
        return materials;
    }

    public void setMaterials(String materials) {
        this.materials = materials;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    
}
