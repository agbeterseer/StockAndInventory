/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 7:33:22 PM

 */
public class HelpMaterials {

    Integer id;
    String materialName;
    String materialType;
    String quantityUsed;
    String dateUsed;
    Float amount;
    String manager;
    private String itemCode;

    public HelpMaterials(Integer id, String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager, String itemCode) {
        this.id = id;
        this.materialName = materialName;
        this.materialType = materialType;
        this.quantityUsed = quantityUsed;
        this.dateUsed = dateUsed;
        this.amount = amount;
        this.manager = manager;
        this.itemCode = itemCode;
    }

    public HelpMaterials(String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager, String itemCode) {
       this.materialName = materialName;
        this.materialType = materialType;
        this.quantityUsed = quantityUsed;
        this.dateUsed = dateUsed;
        this.amount = amount;
        this.manager = manager;
         this.itemCode = itemCode;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getDateUsed() {
        return dateUsed;
    }

    public void setDateUsed(String dateUsed) {
        this.dateUsed = dateUsed;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getQuantityUsed() {
        return quantityUsed;
    }

    public void setQuantityUsed(String quantityUsed) {
        this.quantityUsed = quantityUsed;
    }

    /**
     * @return the itemCode
     */
    public String getItemCode() {
        return itemCode;
    }

    /**
     * @param itemCode the itemCode to set
     */
    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

  
}
