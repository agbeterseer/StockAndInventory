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
public interface ProductionhistoryLocal extends EJBLocalObject {

    Integer getProductionId();

    void setProductionId(Integer productionId);

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

    String getDel();

    void setDel(String del);

    String getCommodityid();

    void setCommodityid(String commodityid);

    String getCompartments();

    void setCompartments(String compartments);

    String getStatus();

    void setStatus(String status);


}
