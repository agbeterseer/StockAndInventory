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
public interface SectionsLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getName();

    void setName(String name);

    String getCapacity();

    void setCapacity(String capacity);

    String getDescription();

    void setDescription(String description);

    String getStatus();

    void setStatus(String status);

    String getDel();

    void setDel(String del);

    Integer getTrack();

    void setTrack(Integer track);

    String getWhcode();

    void setWhcode(String whcode);


}
