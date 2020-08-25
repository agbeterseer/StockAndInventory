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
public interface SupplyLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getCommodityId();

    void setCommodityId(String commodityId);

    String getIssuedBy();

    void setIssuedBy(String issuedBy);

    String getDistributorId();

    void setDistributorId(String distributorId);

    String getDateSupplied();

    void setDateSupplied(String dateSupplied);

    Integer getQuantitySupplied();

    void setQuantitySupplied(Integer quantitySupplied);

     Float getCogs();

     void setCogs(Float Cogs);

   String getWhcode();

   void setWhcode(String Whcode);

    String getQtyleft();

    void setQtyleft(String qtyleft);

    String getComodityname();

    void setComodityname(String comodityname);

    String getLocation();

    void setLocation(String location);

    String getPhonenumber();

    void setPhonenumber(String phonenumber);



}
