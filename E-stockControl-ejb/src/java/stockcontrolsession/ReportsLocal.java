/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolsession;

import java.util.ArrayList;
import javax.ejb.EJBLocalObject;

/**
 *
 * @author Terseer
 */
public interface ReportsLocal extends EJBLocalObject {

    ArrayList viewAllProduction();
    
}
