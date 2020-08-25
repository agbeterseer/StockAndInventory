/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class Helpcommodity {
    private String itemcode;
    private String itemname;
    private String category;
    private String makeorbuy;
    private String description;
    private String authorisation;
    private String dateadded;
    private String del;
    private String lowerlimit;
    private String whcode;

    public Helpcommodity(String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del) {
        this.itemcode = itemcode;
        this.itemname = itemname;
        this.category = category;
        this.makeorbuy = makeorbuy;
        this.description = description;
        this.authorisation = authorisation;
        this.dateadded = dateadded;
    
    }
    public Helpcommodity(String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del,String lowerlimit,String whcode) {
        this.itemcode = itemcode;
        this.itemname = itemname;
        this.category = category;
        this.makeorbuy = makeorbuy;
        this.description = description;
        this.authorisation = authorisation;
        this.dateadded = dateadded;
        this.lowerlimit = lowerlimit;
        this.whcode = whcode;
    }
    
// String lowerlimit
    public Helpcommodity() {
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
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the authorisation
     */
    public String getAuthorisation() {
        return authorisation;
    }

    /**
     * @param authorisation the authorisation to set
     */
    public void setAuthorisation(String authorisation) {
        this.authorisation = authorisation;
    }

    /**
     * @return the dateadded
     */
    public String getDateadded() {
        return dateadded;
    }

    /**
     * @param dateadded the dateadded to set
     */
    public void setDateadded(String dateadded) {
        this.dateadded = dateadded;
    }

    /**
     * @return the del
     */
    public String getDel() {
        return del;
    }

    /**
     * @param del the del to set
     */
    public void setDel(String del) {
        this.del = del;
    }

    /**
     * @return the lowerlimit
     */
    public String getLowerlimit() {
        return lowerlimit;
    }

    /**
     * @param lowerlimit the lowerlimit to set
     */
    public void setLowerlimit(String lowerlimit) {
        this.lowerlimit = lowerlimit;
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


    

}
