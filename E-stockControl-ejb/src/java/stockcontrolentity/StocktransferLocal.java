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
public interface StocktransferLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getItemcode();

    void setItemcode(String itemcode);

    String getItemname();

    void setItemname(String itemname);

    Integer getQuantity();

    void setQuantity(Integer quantity);

    String getDatetransferred();

    void setDatetransferred(String datetransferred);

    String getStatus();

    void setStatus(String status);

    String getFromwarehouse();

    void setFromwarehouse(String fromwarehouse);

    String getDestination();

    void setDestination(String destination);

    String getBarcode();

    void setBarcode(String barcode);

    String getMakeorbuy();

    void setMakeorbuy(String makeorbuy);

    String getCategory();

    void setCategory(String category);

    Float getUnitprice();

    void setUnitprice(Float unitprice);


}
