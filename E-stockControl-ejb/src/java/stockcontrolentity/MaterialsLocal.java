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
public interface MaterialsLocal extends EJBLocalObject {

    Integer getId();

    void setId(Integer id);

    String getMaterialName();

    void setMaterialName(String materialName);

    String getMaterialType();

    void setMaterialType(String materialType);

    String getQuantityUsed();

    void setQuantityUsed(String quantityUsed);

    String getDateUsed();

    void setDateUsed(String dateUsed);

    Float getAmount();

    void setAmount(Float amount);

    String getManager();

    void setManager(String manager);

     String getDel();

    void setDel(String del);

    String getItemCode();

    void setItemCode(String itemCode);


}
