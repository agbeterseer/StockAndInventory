/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolsession;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 *
 * @author Terseer
 */
public interface SControlLocalHome extends EJBLocalHome {
    
    stockcontrolsession.SControlLocal create()  throws CreateException;

}
