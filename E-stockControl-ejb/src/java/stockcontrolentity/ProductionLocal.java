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
public interface ProductionLocal extends EJBLocalObject {

    String getProductionId();

    void setProductionId(String productionId);

    String getCommodityType();

    void setCommodityType(String commodityType);

    String getQuantityProduced();

    void setQuantityProduced(String quantityProduced);

    String getMatrialsUsed();

    void setMatrialsUsed(String matrialsUsed);

    String getDateOfProduced();

    void setDateOfProduced(String dateOfProduced);

    String getManager();

    void setManager(String manager);

    String getCommodityid();

    void setCommodityid(String commodityName);

     String getDel();

    void setDel(String del);


}
