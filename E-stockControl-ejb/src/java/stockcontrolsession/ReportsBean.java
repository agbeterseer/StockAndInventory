/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockcontrolsession;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import stockcontrolentity.ProductionLocal;
import stockcontrolhelper.HelpProduction;

/**
 *
 * @author Terseer
 */
public class ReportsBean implements SessionBean {
    SControlBean scb = new SControlBean();
    private SessionContext context;
    
    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">;

    // TODO Add code to acquire and use other enterprise resources (DataSource, JMS, enterprise bean, Web services)
    // TODO Add business methods or web service operations

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext aContext) {
        context = aContext;
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() {
        
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() {
        
    }
    
    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() {
        
    }
    
    // </editor-fold>;

    /**
     * See section 7.10.3 of the EJB 2.0 specification
     * See section 7.11.3 of the EJB 2.1 specification
     */
    public void ejbCreate() {
        
        // TODO implement ejbCreate if necessary, acquire resources
        // This method has access to the JNDI context so resource aquisition
        // spanning all methods can be performed here such as home interfaces
        // and data sources.
    }

    public ArrayList viewAllProduction() {
      ProductionLocal pro = null;
      Collection col = null;
      HelpProduction pr = null;
      ArrayList list = new ArrayList();
        try{
            // col = scb.production.findAll();
             Iterator i = col.iterator();
             while(i.hasNext()){
             pro = (ProductionLocal)i.next();

           //  pr = new HelpProduction(pro.getProductionId(),pro.getCommodityType(), pro.getQuantityProduced(), pro.getMatrialsUsed(), pro.getDateOfProduced(), pro.getManager(), pro.getCommodityName());
             //Integer productionId, String commodityType, String quantityProduced, String matrialsUsed, String dateOfProduced, String manager
             list.add(pr);
             }
        }catch(Exception ex){
        throw new EJBException();
        }
        return list;
    }
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method" or "Web Service > Add Operation")


    
}
