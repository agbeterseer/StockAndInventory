/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolhelper;

/**
 *
 * @author Terseer
 */
public class HelpSection {

    String name;
    String capacity;
    String description;
    String status;
    Integer track;
    String whcode;
    private Integer sno;

    public HelpSection(Integer sno, String name, String capacity, String description, String status, Integer track) {
        this.name = name;
        this.capacity = capacity;
        this.description = description;
        this.status = status;
        this.track = track;
        this.sno =sno;
    }

    public HelpSection(Integer sno, String name, String capacity, String description, String status, Integer track, String whcode) {
        this.name = name;
        this.capacity = capacity;
        this.description = description;
        this.status = status;
        this.track = track;
        this.whcode = whcode;
        this.sno = sno;
    }

    public String getWhcode() {
        return whcode;
    }

    public void setWhcode(String whcode) {
        this.whcode = whcode;
    }

    public HelpSection() {
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getTrack() {
        return track;
    }

    public void setTrack(Integer track) {
        this.track = track;
    }

    /**
     * @return the sno
     */
    public Integer getSno() {
        return sno;
    }

    /**
     * @param sno the sno to set
     */
    public void setSno(Integer sno) {
        this.sno = sno;
    }

    


}
