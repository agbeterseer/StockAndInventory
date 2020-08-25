/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Utill;

/**
 *
 * @author Administrator
 */
public class Auto {
  public Integer getNext(Integer next) {
        //TODO implement getNext
        //this method increases an integer by 1
        if (next == null) {
            next = new Integer("0");
        }
        next = new Integer(next.intValue() + 1);
        return next;
    }
}
