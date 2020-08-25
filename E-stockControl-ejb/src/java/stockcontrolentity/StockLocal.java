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
public interface StockLocal extends EJBLocalObject {


    String getCommodityId();

    void setCommodityId(String commodityId);

    Integer getQuantityIn();

    void setQuantityIn(Integer quantityIn);

    String getReceivedDate();

    void setReceivedDate(String receivedDate);

    Integer getQuantityLeft();

    void setQuantityLeft(Integer quantityLeft);

    String getReceivedBy();

    void setReceivedBy(String receivedBy);

    Float getUnitprice();

    void setUnitprice(Float unitprice);

    String getCommodityName();

    void setCommodityName(String commodityName);

    String getUnitcode();

    void setUnitcode(String unitcode);

      String getDel();

     void setDel(String del);

     String getCompartments();

     void setCompartments(String Compartments);

    String getWhcode();

     void setWhcode(String whcode);

     String getBarcode();

     void setBarcode(String barcode);

     String getMakeOrBuy();

     void setMakeOrBuy(String makeOrBuy);
     
    String getDiscountCategory();

   void setDiscountCategory(String DiscountCategory);

    String getCategory();

    void setCategory(String category);

    String getBatchcode();

    void setBatchcode(String batchcode);


}
