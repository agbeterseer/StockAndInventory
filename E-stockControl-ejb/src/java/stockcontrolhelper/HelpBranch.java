/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpBranch {
    private String branchCode;
    private String branchName;
    private String branchAddress;
    private String dateCreated;
    private String branchStatus;

    public HelpBranch(String branchCode, String branchName, String branchAddress, String dateCreated, String branchStatus) {
        this.branchCode = branchCode;
        this.branchName = branchName;
        this.branchAddress = branchAddress;
        this.dateCreated = dateCreated;
        this.branchStatus = branchStatus;
    }

    public HelpBranch() {
    }

    /**
     * @return the branchCode
     */
    public String getBranchCode() {
        return branchCode;
    }

    /**
     * @param branchCode the branchCode to set
     */
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    /**
     * @return the branchName
     */
    public String getBranchName() {
        return branchName;
    }

    /**
     * @param branchName the branchName to set
     */
    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    /**
     * @return the branchAddress
     */
    public String getBranchAddress() {
        return branchAddress;
    }

    /**
     * @param branchAddress the branchAddress to set
     */
    public void setBranchAddress(String branchAddress) {
        this.branchAddress = branchAddress;
    }

    /**
     * @return the dateCreated
     */
    public String getDateCreated() {
        return dateCreated;
    }

    /**
     * @param dateCreated the dateCreated to set
     */
    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    /**
     * @return the branchStatus
     */
    public String getBranchStatus() {
        return branchStatus;
    }

    /**
     * @param branchStatus the branchStatus to set
     */
    public void setBranchStatus(String branchStatus) {
        this.branchStatus = branchStatus;
    }

  

}
