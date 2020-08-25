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
public interface UnitLocal extends EJBLocalObject {
    
     Integer getSno();

     void setSno(Integer sno);

    String getUnitcode();

    void setUnitcode(String unitcode);

    String getUnitName();

    void setUnitName(String unitName);

    String getUnitType();

    void setUnitType(String unitType);

    String getCommodidtyType();

    void setCommodidtyType(String commodidtyType);

    String getWhcode();

    void setWhcode(String whcode);

    String getDel();

  void setDel(String del);


}
