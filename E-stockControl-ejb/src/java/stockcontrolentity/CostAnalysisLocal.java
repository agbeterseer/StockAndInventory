/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import javax.ejb.EJBLocalObject;

/**
 *
 * @author JPT TERSOO AGBE
 */
public interface CostAnalysisLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getMaterials();

    void setMaterials(String materials);

    Float getAmount();

    void setAmount(Float amount);

    String getItemCode();

    void setItemCode(String itemCode);

    String getDateAdded();

    void setDateAdded(String dateAdded);

    String getDel();

    void setDel(String del);


}
