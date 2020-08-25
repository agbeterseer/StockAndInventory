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
public interface BranchLocal extends EJBLocalObject {

    String getBranchCode();

    void setBranchCode(String branchCode);

    String getBranchName();

    void setBranchName(String branchName);

    String getBranchAddress();

    void setBranchAddress(String branchAddress);

    String getDateCreated();

    void setDateCreated(String dateCreated);

    String getBranchStatus();

    void setBranchStatus(String branchStatus);

    String getDel();

    void setDel(String del);


}
