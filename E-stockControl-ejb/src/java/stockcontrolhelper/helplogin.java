/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 * Created on : Jun 20, 2011, 6:31:22 PM
 */
public class helplogin {

    private String username;
    private String password;
    private String role;

    public helplogin(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public helplogin(String username, String password) {
         this.username = username;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


}
