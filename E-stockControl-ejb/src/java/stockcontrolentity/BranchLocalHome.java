/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolentity;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 *
 * @author JPT TERSOO AGBE
 */
public interface BranchLocalHome extends EJBLocalHome {

    stockcontrolentity.BranchLocal findByPrimaryKey(java.lang.String key)  throws FinderException;
    
    stockcontrolentity.BranchLocal create(java.lang.String key)  throws CreateException;

    Collection findByBranchCode(String branchCode) throws FinderException;

    Collection findByBranchName(String branchName) throws FinderException;

    Collection findByBranchAddress(String branchAddress) throws FinderException;

    Collection findByDateCreated(String dateCreated) throws FinderException;

    Collection findByBranchStatus(String branchStatus) throws FinderException;

    Collection findByDel(String del) throws FinderException;

    Collection findByAll(String staus) throws FinderException;
}
