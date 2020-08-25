/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpDb {

    Integer sno;
    String host;
    String username;
    String password;
    String dbname;

    public HelpDb(Integer sno, String host, String username, String password, String dbname) {
        this.sno = sno;
        this.host = host;
        this.username = username;
        this.password = password;
        this.dbname = dbname;
    }

    public HelpDb(String host, String username, String password, String dbname) {
        this.host = host;
        this.username = username;
        this.password = password;
        this.dbname = dbname;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    

}
