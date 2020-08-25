/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class StockEdtion {
    String id;
    String editionName;
    String editionStatus;

    public StockEdtion(String id, String editionName, String editionStatus) {
        this.id = id;
        this.editionName = editionName;
        this.editionStatus = editionStatus;
    }

    public StockEdtion() {
    }

    public String getEditionName() {
        return editionName;
    }

    public void setEditionName(String editionName) {
        this.editionName = editionName;
    }

    public String getEditionStatus() {
        return editionStatus;
    }

    public void setEditionStatus(String editionStatus) {
        this.editionStatus = editionStatus;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    

}
