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
public interface ReportsLocalHome extends EJBLocalHome {
    
    stockcontrolsession.ReportsLocal create()  throws CreateException;

}
