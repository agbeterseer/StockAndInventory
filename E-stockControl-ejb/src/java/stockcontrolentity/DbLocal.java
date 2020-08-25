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
public interface DbLocal extends EJBLocalObject {

    Integer getSno();

    void setSno(Integer sno);

    String getHost();

    void setHost(String host);

    String getUsername();

    void setUsername(String username);

    String getPassword();

    void setPassword(String password);

    String getDbname();

    void setDbname(String dbname);

    String getDel();

    void setDel(String del);


}
