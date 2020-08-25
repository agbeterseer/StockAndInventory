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
public interface RequitionLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getCommodityId();

    void setCommodityId(String commodityId);


    String getDateoFRequest();

    void setDateoFRequest(String dateoFRequest);

    String getManager();

    void setManager(String manager);

    String getRequisitionCode();

    void setRequisitionCode(String requisitionCode);

     String getComment();

     void setComment(String comment);

     String getDel();

     void setDel(String del);

     Integer getQuantity();

     void setQuantity(Integer quantity);

     String getStatus();

     void setStatus(String status);


}
