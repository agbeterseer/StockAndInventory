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
public interface GoodslimitsLocal extends EJBLocalObject {

    String getCommodityCode();

    void setCommodityCode(String commodityCode);

    String getLowerLimit();

    void setLowerLimit(String lowerLimit);

    String getUpperLimit();

    void setUpperLimit(String upperLimit);


}
