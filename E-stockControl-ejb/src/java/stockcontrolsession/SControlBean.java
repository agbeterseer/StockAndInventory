/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolsession;
import Utill.Auto;
import Utill.CONFIG;
import Utill.CONST;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.imageio.ImageIO;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.commons.io.IOUtils;
import stockcontrolentity.BranchLocal;
import stockcontrolentity.BranchLocalHome;
import stockcontrolentity.CategoryLocal;
import stockcontrolentity.CategoryLocalHome;
import stockcontrolentity.CostAnalysisLocal;
import stockcontrolentity.CostAnalysisLocalHome;
import stockcontrolentity.DbLocal;
import stockcontrolentity.DbLocalHome;
import stockcontrolentity.DistributorLocalHome;
import stockcontrolentity.InventoryCostLocal;
import stockcontrolentity.InventoryCostLocalHome;
import stockcontrolentity.InventoryCostSetupLocal;
import stockcontrolentity.InventoryCostSetupLocalHome;
import stockcontrolentity.ItemsLocal;
import stockcontrolentity.ItemsLocalHome;
import stockcontrolentity.LgaLocal;
import stockcontrolentity.LgaLocalHome;
import stockcontrolentity.LimitsLocal;
import stockcontrolentity.LimitsLocalHome;
import stockcontrolentity.MaterialsLocal;
import stockcontrolentity.MaterialsLocalHome;
import stockcontrolentity.NationalityLocal;
import stockcontrolentity.NationalityLocalHome;
import stockcontrolentity.ProductionLocal;
import stockcontrolentity.ProductionLocalHome;
import stockcontrolentity.ProductionhistoryLocal;
import stockcontrolentity.ProductionhistoryLocalHome;
import stockcontrolentity.RequitionLocal;
import stockcontrolentity.RequitionLocalHome;
import stockcontrolentity.RolesLocal;
import stockcontrolentity.RolesLocalHome;
import stockcontrolentity.SectionsLocal;
import stockcontrolentity.SectionsLocalHome;
import stockcontrolentity.StaffLocal;
import stockcontrolentity.StaffLocalHome;
import stockcontrolentity.StateoforiginLocal;
import stockcontrolentity.StateoforiginLocalHome;
import stockcontrolentity.StockInventoryEditionsLocal;
import stockcontrolentity.StockInventoryEditionsLocalHome;
import stockcontrolentity.StockLocal;
import stockcontrolentity.StockLocalHome;
import stockcontrolentity.StockhistoryLocal;
import stockcontrolentity.StockhistoryLocalHome;
import stockcontrolentity.StocktransferLocal;
import stockcontrolentity.StocktransferLocalHome;
import stockcontrolentity.SupplyLocal;
import stockcontrolentity.SupplyLocalHome;
import stockcontrolentity.UnitLocal;
import stockcontrolentity.UnitLocalHome;
import stockcontrolentity.UserloginLocal;
import stockcontrolentity.UserloginLocalHome;
import stockcontrolentity.WarehouseLocal;
import stockcontrolentity.WarehouseLocalHome;
import stockcontrolhelper.HelpBranch;
import stockcontrolhelper.HelpCategory;
import stockcontrolhelper.HelpCostAnalysis;
import stockcontrolhelper.HelpDb;
import stockcontrolhelper.HelpInventoryCost;
import stockcontrolhelper.HelpLimit;
import stockcontrolhelper.HelpMaterials;
import stockcontrolhelper.HelpProduction;
import stockcontrolhelper.HelpRequisition;
import stockcontrolhelper.HelpRole;
import stockcontrolhelper.HelpSection;
import stockcontrolhelper.HelpStock;
import stockcontrolhelper.HelpSupply;
import stockcontrolhelper.Helpcommodity;
import stockcontrolhelper.LGAHelper;
import stockcontrolhelper.NationalityHelper;
import stockcontrolhelper.StateHelper;
import stockcontrolhelper.StockEdtion;
import stockcontrolhelper.helpSetCost;
import stockcontrolhelper.helpStockTransfer;
import stockcontrolhelper.helpUits;
import stockcontrolhelper.helplogin;
import stockcontrolhelper.helpwarehouse;
import stockcontrolhelper.staffHelper;
import stockcontrolhelper.CryptoLibrary;
//import org.apache.commons.io.output.ByteArrayOutputStream;

/**
 *
 * @author Terseer
 */
public class SControlBean implements SessionBean {

    private UserloginLocalHome userlogin = null;
    private DistributorLocalHome distributor = null;
    private LgaLocalHome lga = null;
    private NationalityLocalHome nationality = null;
    private ProductionLocalHome production = null;
    private RolesLocalHome role = null;
    private StaffLocalHome staff = null;
    private StateoforiginLocalHome stateoforigin = null;
    private StockLocalHome stock = null;
    private SupplyLocalHome supply = null;
    private UnitLocalHome unithome = null;
    private MaterialsLocalHome material = null;
    private DbLocalHome dbhome = null;
    private RequitionLocalHome requisition = null;
    private LimitsLocalHome limits = null;
    private SectionsLocalHome sec = null;
    private ProductionhistoryLocalHome prohist = null;
    private StockhistoryLocalHome stockhist = null;
    private CostAnalysisLocalHome casthome = null;
    private InventoryCostLocalHome inventhome = null;
    private InventoryCostSetupLocalHome invensetup = null;
    private WarehouseLocalHome warehouse = null;
    private StockInventoryEditionsLocalHome sielhome = null;
    private StocktransferLocalHome stocktransfer = null;
    private BranchLocalHome branch = null;
    private CategoryLocalHome category = null;
    private ItemsLocalHome items = null;
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
        userlogin = lookupUserloginBean();
         distributor = lookupDistributorBean();
        lga = lookupLgaBean();
        nationality = lookupNationalityBean();
        production = lookupProductionBean();
        role = lookupRolesBean();
        staff = lookupStaffBean();
        stateoforigin = lookupStateoforiginBean();
        stock = lookupStockBean();
        supply = lookupSupplyBean();
        unithome = lookupUnitBean();
        material = lookupMaterialsBean();
        dbhome = lookupDbBean();
        requisition = lookupRequitionBean();
        limits = lookupLimitsBean();
        sec = lookupSectionsBean();
        prohist = lookupProductionhistoryBean();
        stockhist = lookupStockhistoryBean();
        inventhome = lookupInventoryCostBean();
        casthome = lookupCostAnalysisBean();
        invensetup = lookupInventoryCostSetupBean();
        warehouse = lookupWarehouseBean();
        sielhome = lookupStockInventoryEditionsBean();
        stocktransfer = lookupStocktransferBean();
        branch = lookupBranchBean();
        category = lookupCategoryBean();
        items = lookupItemsBean();

    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() {
        userlogin = null;
        distributor = null;
        nationality = null;
        production = null;
        role = null;
        staff = null;
        stateoforigin = null;
        stock = null;
        supply = null;
        unithome = null;
        material = null;
        dbhome = null;
        requisition = null;
        limits = null;
        sec = null;
        prohist = null;
        stockhist = null;
        invensetup = null;
        warehouse = null;
        sielhome = null;
        stocktransfer = null;
        branch = null;
        category = null;
        items = null;
    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() {
        userlogin = null;
        distributor = null;
        lga = null;
        nationality = null;
        production = null;
        role = null;
        staff = null;
        stateoforigin = null;
        stock = null;
        supply = null;
        unithome = null;
        material = null;
        dbhome = null;
        requisition = null;
        limits = null;
        sec = null;
        prohist = null;
        stockhist = null;
        invensetup = null;
        warehouse = null;
        sielhome = null;
        stocktransfer = null;
        branch = null;
        category = null;
        items = null;

    }

    // </editor-fold>;
    /**
     * See section 7.10.3 of the EJB 2.0 specification
     * See section 7.11.3 of the EJB 2.1 specification
     */
    public void ejbCreate() {
        userlogin = lookupUserloginBean();
        distributor = lookupDistributorBean();
        lga = lookupLgaBean();
        nationality = lookupNationalityBean();
        production = lookupProductionBean();
        role = lookupRolesBean();
        staff = lookupStaffBean();
        stateoforigin = lookupStateoforiginBean();
        stock = lookupStockBean();
        supply = lookupSupplyBean();
        unithome = lookupUnitBean();
        material = lookupMaterialsBean();
        dbhome = lookupDbBean();
        requisition = lookupRequitionBean();
        limits = lookupLimitsBean();
        sec = lookupSectionsBean();
        prohist = lookupProductionhistoryBean();
        stockhist = lookupStockhistoryBean();
        inventhome = lookupInventoryCostBean();
        casthome = lookupCostAnalysisBean();
        invensetup = lookupInventoryCostSetupBean();
        warehouse = lookupWarehouseBean();
        sielhome = lookupStockInventoryEditionsBean();
        stocktransfer = lookupStocktransferBean();
        branch = lookupBranchBean();
        category = lookupCategoryBean();
        items = lookupItemsBean();
        // TODO implement ejbCreate if necessary, acquire resources
        // This method has access to the JNDI context so resource aquisition
        // spanning all methods can be performed here such as home interfaces
        // and data sources.
    }

      private CategoryLocalHome lookupCategoryBean() {
        try {
            Context c = new InitialContext();
            CategoryLocalHome rv = (CategoryLocalHome) c.lookup("java:comp/env/CategoryBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
      
    private BranchLocalHome lookupBranchBean() {
        try {
            Context c = new InitialContext();
            BranchLocalHome rv = (BranchLocalHome) c.lookup("java:comp/env/BranchBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StocktransferLocalHome lookupStocktransferBean() {
        try {
            Context c = new InitialContext();
            StocktransferLocalHome rv = (StocktransferLocalHome) c.lookup("java:comp/env/StocktransferBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private UserloginLocalHome lookupUserloginBean() {
        try {
            Context c = new InitialContext();
            UserloginLocalHome rv = (UserloginLocalHome) c.lookup("java:comp/env/UserloginBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

   

    private DistributorLocalHome lookupDistributorBean() {
        try {
            Context c = new InitialContext();
            DistributorLocalHome rv = (DistributorLocalHome) c.lookup("java:comp/env/DistributorBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private LgaLocalHome lookupLgaBean() {
        try {
            Context c = new InitialContext();
            LgaLocalHome rv = (LgaLocalHome) c.lookup("java:comp/env/LgaBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private NationalityLocalHome lookupNationalityBean() {
        try {
            Context c = new InitialContext();
            NationalityLocalHome rv = (NationalityLocalHome) c.lookup("java:comp/env/NationalityBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProductionLocalHome lookupProductionBean() {
        try {
            Context c = new InitialContext();
            ProductionLocalHome rv = (ProductionLocalHome) c.lookup("java:comp/env/ProductionBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private RolesLocalHome lookupRolesBean() {
        try {
            Context c = new InitialContext();
            RolesLocalHome rv = (RolesLocalHome) c.lookup("java:comp/env/RolesBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StaffLocalHome lookupStaffBean() {
        try {
            Context c = new InitialContext();
            StaffLocalHome rv = (StaffLocalHome) c.lookup("java:comp/env/StaffBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StateoforiginLocalHome lookupStateoforiginBean() {
        try {
            Context c = new InitialContext();
            StateoforiginLocalHome rv = (StateoforiginLocalHome) c.lookup("java:comp/env/StateoforiginBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StockLocalHome lookupStockBean() {
        try {
            Context c = new InitialContext();
            StockLocalHome rv = (StockLocalHome) c.lookup("java:comp/env/StockBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private SupplyLocalHome lookupSupplyBean() {
        try {
            Context c = new InitialContext();
            SupplyLocalHome rv = (SupplyLocalHome) c.lookup("java:comp/env/SupplyBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private UnitLocalHome lookupUnitBean() {
        try {
            Context c = new InitialContext();
            UnitLocalHome rv = (UnitLocalHome) c.lookup("java:comp/env/UnitBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MaterialsLocalHome lookupMaterialsBean() {
        try {
            Context c = new InitialContext();
            MaterialsLocalHome rv = (MaterialsLocalHome) c.lookup("java:comp/env/MaterialsBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DbLocalHome lookupDbBean() {
        try {
            Context c = new InitialContext();
            DbLocalHome rv = (DbLocalHome) c.lookup("java:comp/env/DbBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private RequitionLocalHome lookupRequitionBean() {
        try {
            Context c = new InitialContext();
            RequitionLocalHome rv = (RequitionLocalHome) c.lookup("java:comp/env/RequitionBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

 
    private LimitsLocalHome lookupLimitsBean() {
        try {
            Context c = new InitialContext();
            LimitsLocalHome rv = (LimitsLocalHome) c.lookup("java:comp/env/LimitsBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private SectionsLocalHome lookupSectionsBean() {
        try {
            Context c = new InitialContext();
            SectionsLocalHome rv = (SectionsLocalHome) c.lookup("java:comp/env/SectionsBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StockhistoryLocalHome lookupStockhistoryBean() {
        try {
            Context c = new InitialContext();
            StockhistoryLocalHome rv = (StockhistoryLocalHome) c.lookup("java:comp/env/StockhistoryBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProductionhistoryLocalHome lookupProductionhistoryBean() {
        try {
            Context c = new InitialContext();
            ProductionhistoryLocalHome rv = (ProductionhistoryLocalHome) c.lookup("java:comp/env/ProductionhistoryBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CostAnalysisLocalHome lookupCostAnalysisBean() {
        try {
            Context c = new InitialContext();
            CostAnalysisLocalHome rv = (CostAnalysisLocalHome) c.lookup("java:comp/env/CostAnalysisBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private InventoryCostLocalHome lookupInventoryCostBean() {
        try {
            Context c = new InitialContext();
            InventoryCostLocalHome rv = (InventoryCostLocalHome) c.lookup("java:comp/env/InventoryCostBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private InventoryCostSetupLocalHome lookupInventoryCostSetupBean() {
        try {
            Context c = new InitialContext();
            InventoryCostSetupLocalHome rv = (InventoryCostSetupLocalHome) c.lookup("java:comp/env/InventoryCostSetupBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private WarehouseLocalHome lookupWarehouseBean() {
        try {
            Context c = new InitialContext();
            WarehouseLocalHome rv = (WarehouseLocalHome) c.lookup("java:comp/env/WarehouseBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private StockInventoryEditionsLocalHome lookupStockInventoryEditionsBean() {
        try {
            Context c = new InitialContext();
            StockInventoryEditionsLocalHome rv = (StockInventoryEditionsLocalHome) c.lookup("java:comp/env/StockInventoryEditionsBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    private ItemsLocalHome lookupItemsBean() {
        try {
            Context c = new InitialContext();
            ItemsLocalHome rv = (ItemsLocalHome) c.lookup("java:comp/env/ItemsBean");
            return rv;
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    /// ########   USER MANAGEMENT : ###############
    // ########    By TERSEER AGBE  FOR CONSERVATIVE ESTIMATES ############
    // user login
    public String userlogin(helplogin user) {
        UserloginLocal userl = null;
        String pass = "NA";
        try {

            userl = userlogin.findByPrimaryKey(user.getUsername());
            pass = new CryptoLibrary().decrypt(userl.getPassword());

        } catch (Exception ex) {
            throw new EJBException();
        }
        return pass;
    }
    // view single user

    public helplogin viewSingleUser(String regNo) {
        //TODO implement viewSingleUser
        UserloginLocal userl = null;
        CryptoLibrary cl = new CryptoLibrary();
        try {
            userl = userlogin.findByPrimaryKey(regNo);
        } catch (Exception e) {
            e.getLocalizedMessage();
        }
        return new helplogin(userl.getUsername(), cl.decrypt(userl.getPassword()), userl.getRole());
    }

    // add Roles
    public String addRoles(HelpRole hr) {
        RolesLocal rl = null;
        try {
            rl = role.create(hr.getRoleName().toUpperCase());
            rl.setDefaultName(hr.getDefaultName());
            rl.setDel("0");
        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_RECORD;
    }

    // view Single Role
    public HelpRole viewSingleRole(String hr) {
        RolesLocal rl = null;
        HelpRole hrt = null;
        try {
            rl = role.findByPrimaryKey(hr);
            hrt = new HelpRole(rl.getRoleName(), rl.getDefaultName());
        } catch (Exception ex) {
            System.out.println();
        }
        return hrt;
    }

    public String modifyRoles(HelpRole rol) {
        RolesLocal rl = null;
        try {

            rl = role.findByPrimaryKey(rol.getRoleName());
            rl.setDefaultName(rol.getDefaultName());

        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_RECORD;
    }

    // view all Roles
    public ArrayList viewAllRoles() {
        RolesLocal rl = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        //HelpRole hhr = null;
        try {
            col = role.findAll(CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                rl = (RolesLocal) i.next();
                list.add(new HelpRole(rl.getRoleName(), rl.getDefaultName()));
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    // method for checking the authenticity of a password
    public String authenticatePassword(String password, String regNo) {
        //TODO implement authenticatePassword
        //boolean x=false;
        UserloginLocal userl = null;
        String msg = "invalid password or username";
        CryptoLibrary cl = new CryptoLibrary();
        boolean name = regNo.equalsIgnoreCase(regNo);

        try {
            userl = userlogin.findByPrimaryKey(regNo);
         //   System.out.println("this is the username in sessionBean==:" + regNo);
            if (password.equalsIgnoreCase(cl.decrypt(userl.getPassword()))) {
                msg = cl.decrypt(userl.getPassword());
                //x=true;
            } else {
                //x=false;
                msg = "invalid password or username";
            }
        } catch (Exception e) {
            return msg;
            //msg="invalid password";
        }
        return msg;
    }

    public ArrayList viewAllNations() {
        NationalityLocal nl = null;
        ArrayList list = new ArrayList();
        Collection nations = null;
        try {

            nations = nationality.findAll();

            Iterator i = nations.iterator();
            while (i.hasNext()) {
                nl = (NationalityLocal) i.next();
                list.add(new NationalityHelper(nl.getCode(), nl.getCountry()));
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    public NationalityHelper viewNations(String code) {
        NationalityLocal nl = null;
        //ArrayList list = new ArrayList();
        //Collection nations = null;
        NationalityHelper nh = null;
        try {
            nl = nationality.findByPrimaryKey(code);
            nh = new NationalityHelper(nl.getCode(), nl.getCountry());

        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return nh;
    }
    // method for viewing states in a country

    public ArrayList viewByCountry(String country) {
        StateoforiginLocal sl = null;
        ArrayList list = new ArrayList();
        Collection states = null;
        try {
            states = stateoforigin.findByCountry(country);

            Iterator i = states.iterator();
            while (i.hasNext()) {
                sl = (StateoforiginLocal) i.next();
                list.add(new StateHelper(sl.getCode(), sl.getState(), sl.getCountry()));
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    public ArrayList viewByState(String state) {
        LgaLocal ll = null;
        ArrayList list = new ArrayList();
        Collection col = null;
        try {

            col = lga.findByState(state);

            Iterator i = col.iterator();
            while (i.hasNext()) {
                ll = (LgaLocal) i.next();
                list.add(new LGAHelper(ll.getCode(), ll.getLga(), ll.getState()));
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    // ########   ADMIN MODULE config  writen on the 21th of june 2011 : ###############
    // ########    By TERSEER AGBE  FOR CONSERVATIVE ESTIMATES ############
    // create user
    public String createUser(helplogin par) { 
        // create and initializ local instance
        UserloginLocal userlocal = null;
        try {
            userlocal = userlogin.create(par.getUsername());
            userlocal.setPassword(new CryptoLibrary().encrypt(par.getPassword()));
            userlocal.setRole(par.getRole());
        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_RECORD;
    }

    // add Staff
    public String addStaff(staffHelper sh) {
        StaffLocal stafflocal = null;
        try {
            stafflocal = staff.create(sh.getUsername());
            stafflocal.setFirstName(sh.getFirstName());
            stafflocal.setGender(sh.getGender());
            stafflocal.setHomeAddress(sh.getHomeAddress());
            stafflocal.setLastName(sh.getLastName());
            stafflocal.setLga(sh.getLga());
            stafflocal.setNationality(sh.getNationality());
            stafflocal.setPassport(sh.getPassport());
            stafflocal.setPhoneNumber(sh.getPhoneNumber());
            stafflocal.setPosition(sh.getPosition());
            stafflocal.setStateOfOrigin(sh.getStateOfOrigin());
            stafflocal.setDel(CONFIG.getUN_SET_DELETE());
            stafflocal.setWhcode(sh.getWhcode());
        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_RECORD;
    }

    // view All Staff
    public ArrayList viewAllStaff() {
        StaffLocal stafflo = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        staffHelper sh = null;
        try {
            col = staff.findAll();
            Iterator i = col.iterator();
            while (i.hasNext()) {
                stafflo = (StaffLocal) i.next();
                list.add(new staffHelper(stafflo.getUsername(), stafflo.getFirstName(), stafflo.getLastName(), stafflo.getGender(), stafflo.getPosition(), stafflo.getNationality(), stafflo.getStateOfOrigin(), stafflo.getLga(), stafflo.getHomeAddress(), stafflo.getPhoneNumber(), stafflo.getDateOfAppointment(), stafflo.getPassport(), stafflo.getWhcode()));
                //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport getPhoneNumber() getPosition()
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    // veiw single staff's records
    public staffHelper viewSingleStaff(String username) {
        StaffLocal sl = null;
        staffHelper hs = null;
        try {
            sl = staff.findByPrimaryKey(username);

            hs = new staffHelper(sl.getUsername(), sl.getFirstName(), sl.getLastName(), sl.getGender(), sl.getPosition(), sl.getNationality(), sl.getStateOfOrigin(), sl.getLga(), sl.getHomeAddress(), sl.getPhoneNumber(), sl.getDateOfAppointment(), sl.getPassport(), sl.getWhcode());
            //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String
            //lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport
        } catch (Exception ex) {

            throw new EJBException();
        }
        return hs;
    }
    // modify Staff records

    public String modifyStaffRecords(staffHelper sh) {
        StaffLocal sl = null;
        staffHelper hs = null;
        try {
            sl = staff.findByPrimaryKey(sh.getUsername());
            //sl.setFirstName(sh.getFirstName());
            //  sl.setGender(sh.getGender());
            sl.setHomeAddress(sh.getHomeAddress());
            //  sl.setLastName(sh.getLastName());
            //  sl.setLga(sh.getLga());
            //  sl.setNationality(sh.getNationality());
            ///sl.setPassport(sh.getPassport());
            sl.setPhoneNumber(sh.getPhoneNumber());
            /// sl.setPosition(sh.getPosition());
            //  sl.setStateOfOrigin(sh.getStateOfOrigin());

        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_MODIFY_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    // view Staff By Category
    public ArrayList viewStaffByCategory(String name) {
        StaffLocal sl = null;
        staffHelper hs = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = staff.findByName1("%" + name + "%");
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StaffLocal) i.next();
                list.add(new staffHelper(sl.getUsername(), sl.getFirstName(), sl.getLastName(), sl.getGender(), sl.getPosition(), sl.getNationality(), sl.getStateOfOrigin(), sl.getLga(), sl.getHomeAddress(), sl.getPhoneNumber(), sl.getDateOfAppointment(), sl.getPassport(), sl.getWhcode()));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return list;
    }

    public String addUnits(helpUits hu) {
        UnitLocal unit = null;
        Integer n = unithome.Max();
        try {
            unit = unithome.create(new Auto().getNext(n));
            unit.setUnitcode(hu.getUnitcode());
           // unit.setCommodidtyType(hu.getCommodidtyType());
            unit.setUnitName(hu.getUnitName());
            unit.setUnitType(hu.getUnitType());
            unit.setWhcode(hu.getWhcode());
            unit.setDel(CONFIG.getUN_SET_DELETE());
            //   unit.setUnitcode(hu.getUnitcode());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }

        return CONST.ADD_RECORD;
    }

    // view sigle Unit
    public helpUits viewSingleUnit(Integer id, String whcode) {
        UnitLocal unit = null;
        helpUits hu = null;
        try {
            unit = unithome.findBySnoAndWarehouse(id,whcode);

            hu = new helpUits(unit.getSno(),unit.getUnitName(), unit.getUnitType(), unit.getCommodidtyType(), unit.getUnitcode(), unit.getWhcode());
           //String unitName, String unitType, String commodidtyType, String unitcode, String whcode, Integer sno
            //Integer id, String unitName, String unitType, String commodidtyType

        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return hu;
    }

    //modidy units
    public String modifyUnits(helpUits huu) {
        UnitLocal unit = null;
        try {
            unit = unithome.findByPrimaryKey(huu.getSno());
            unit.setUnitcode(huu.getUnitcode());
            unit.setCommodidtyType(huu.getCommodidtyType());
            unit.setUnitName(huu.getUnitName());
            unit.setUnitType(huu.getUnitType());
            unit.setWhcode(huu.getWhcode()); 
            //  unit.setUnitcode(huu.getUnitcode());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);

        }
        return CONST.ADD_RECORD;
    }

    // view Unit By Category
    public ArrayList viewUnitsByCategory(String uni, String whcode) {
        UnitLocal unit = null;
        helpUits hu = null;
        ArrayList list = new ArrayList();
        Collection col = null;

        try {
            col = unithome.findByUnit("%" + uni + "%", whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                unit = (UnitLocal) i.next();
                list.add(new helpUits(unit.getSno(), unit.getUnitName(), unit.getUnitType(), unit.getCommodidtyType(), unit.getUnitcode(), unit.getWhcode()));
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    // view All units
    public ArrayList viewAllUnits(String whcode) {
        UnitLocal unit = null;
        helpUits hu = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = unithome.findAll(whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                unit = (UnitLocal) i.next();
                list.add(new helpUits(unit.getSno(), unit.getUnitName(), unit.getUnitType(), unit.getCommodidtyType(), unit.getUnitcode(), unit.getWhcode()));
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    //####################################################################### END #################################################
    /// ########   PRODUCTION MODULE writen on the 22 of june 2011 : ###############
    // ########    By TERSEER AGBE  FOR CONSERVATIVE ESTIMATES ############
    // add production
    public String addProduction(HelpProduction hlp) {
        ProductionLocal prlocal = null;
        //Integer n = production.Max();
        try {
            prlocal = production.create(hlp.getCommodityid());
            prlocal.setCommodityType(hlp.getCommodityType());
            prlocal.setDateOfProduced(hlp.getDateOfProduced());
            prlocal.setManager(hlp.getManager());
            prlocal.setMatrialsUsed(hlp.getMatrialsUsed());
            prlocal.setQuantityProduced(hlp.getQuantityProduced());
            prlocal.setDel(CONFIG.getUN_SET_DELETE());

        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    // modify production
    public String modifyProduction(HelpProduction pro) {
        ProductionLocal prlocal = null;
        try {
            prlocal = production.findByPrimaryKey(pro.getCommodityid());
            prlocal.setCommodityType(pro.getCommodityType());
           // prlocal.setCommodityid(pro.getCommodityid());
            prlocal.setDateOfProduced(pro.getDateOfProduced());
            prlocal.setManager(pro.getManager());
            prlocal.setMatrialsUsed(pro.getMatrialsUsed());
            prlocal.setQuantityProduced(pro.getQuantityProduced());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }
    // add production

    public String ProductionHistory(HelpProduction hlp) {
        //  ProductionLocal prlocal = null;
        ProductionhistoryLocal phl = null;
        Integer n = prohist.max();
        try {
            phl = prohist.create(new Auto().getNext(n));
            phl.setCommodityType(hlp.getCommodityType());
            phl.setCommodityid(hlp.getCommodityid());
            phl.setDateOfProduced(hlp.getDateOfProduced());
            phl.setManager(hlp.getManager());
            phl.setMatrialsUsed(hlp.getMatrialsUsed());
            phl.setQuantityProduced(hlp.getQuantityProduced());
            //phl.setDel(CONFIG.UN_SET_DELETE);
            phl.setStatus(hlp.getStatus());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    //view Single Production
    public HelpProduction viewSingleProduction(String id) {
        ProductionLocal prlocal = null;
        HelpProduction hhpp = null;
        try {
            prlocal = production.findByPrimaryKey(id);
            hhpp = new HelpProduction(prlocal.getCommodityType(), prlocal.getQuantityProduced(), prlocal.getMatrialsUsed(), prlocal.getDateOfProduced(), prlocal.getManager(), prlocal.getCommodityid());
                                                            //String commodityType, String quantityProduced, String matrialsUsed, String dateOfProduced, String manager, String commodityid
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hhpp;
    }

    // view All production
    public ArrayList viewAllProduction() {
        ProductionLocal prlocal = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        HelpProduction hpp = null;
        try {
            col = production.findAll(CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                prlocal = (ProductionLocal) i.next();
                list.add(hpp = new HelpProduction(prlocal.getCommodityType(), prlocal.getQuantityProduced(), prlocal.getMatrialsUsed(), prlocal.getDateOfProduced(), prlocal.getManager(), prlocal.getCommodityid()));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return list;
    }

    // view Production By Type
    public ArrayList viewCommodityByType(String commodityType) {
        ProductionLocal prlocal = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        HelpProduction hpp = null;
        try {
            col = production.findBycommoditytype("%" + commodityType + "%");
            Iterator i = col.iterator();
            while (i.hasNext()) {
                prlocal = (ProductionLocal) i.next();
                list.add(hpp = new HelpProduction(prlocal.getCommodityType(), prlocal.getQuantityProduced(), prlocal.getMatrialsUsed(), prlocal.getDateOfProduced(), prlocal.getManager(), prlocal.getCommodityid()));
            }
        } catch (Exception ex) {
            System.out.println();
        }
        return list;
    }

    // Add materials
    public String addMaterial(HelpMaterials hlm) {
        MaterialsLocal ml = null;
        Integer n = material.Max();
        try {

            ml = material.create(new Auto().getNext(n));
            ml.setAmount(hlm.getAmount());
            ml.setDateUsed(hlm.getDateUsed());
            ml.setManager(hlm.getManager());
            ml.setMaterialName(hlm.getMaterialName());
            ml.setMaterialType(hlm.getMaterialType());
            ml.setQuantityUsed(hlm.getQuantityUsed());
            ml.setDel(CONFIG.getUN_SET_DELETE());
            ml.setItemCode(hlm.getItemCode());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    // modify Materials
    public String modifyMaterials(HelpMaterials mm) {
        MaterialsLocal ml = null;
        //Integer n = material.Max();
        try {
         //   System.out.println("amount=====" + mm.getAmount());
            ml = material.findByPrimaryKey(mm.getId());
            ml.setAmount(mm.getAmount());
            ml.setDateUsed(mm.getDateUsed());
            ml.setManager(mm.getManager());
            ml.setMaterialName(mm.getMaterialName());
            ml.setMaterialType(mm.getMaterialType());
            ml.setQuantityUsed(mm.getQuantityUsed());
            ml.setDel(CONFIG.getUN_SET_DELETE());
            ml.setItemCode(mm.getItemCode());
        } catch (Exception ex) {
             throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    // view Single Material
    public HelpMaterials viewSingleMaterial(Integer m) {
        MaterialsLocal ml = null;
        HelpMaterials hm = null;
        try {
            ml = material.findByPrimaryKey(m);

            hm = new HelpMaterials(ml.getId(), ml.getMaterialName(), ml.getMaterialType(), ml.getQuantityUsed(), ml.getDateUsed(), ml.getAmount(), ml.getManager(), ml.getItemCode());
            //Integer id, String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hm;
    }

    // view Single Material
    public HelpMaterials viewSingleMaterialByMateriaName(String materialName) {
        MaterialsLocal ml = null;
        HelpMaterials hm = null;
        try {
            //   ml = material.
        } catch (Exception ex) {
        }
        return null;
    }

    // view Material By Name
    public ArrayList viewMateriaByName(String materiaName) {
        MaterialsLocal ml = null;
        HelpMaterials hm = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = material.findBy("%" + materiaName + "%", CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                ml = (MaterialsLocal) i.next();
                list.add(new HelpMaterials(ml.getId(), ml.getMaterialName(), ml.getMaterialType(), ml.getQuantityUsed(), ml.getDateUsed(), ml.getAmount(), ml.getManager(), ml.getItemCode()));
            }
        } catch (Exception ex) {
        }
        return list;
    }

    // view All Production Materials
    public ArrayList viewAllMaterials() {
        MaterialsLocal ml = null;
        ArrayList list = new ArrayList();
        Collection col = null;
        HelpMaterials hlp = null;
        try {
            col = material.findAll(CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                ml = (MaterialsLocal) i.next();
                list.add(new HelpMaterials(ml.getId(), ml.getMaterialName(), ml.getMaterialType(), ml.getQuantityUsed(), ml.getDateUsed(), ml.getAmount(), ml.getManager(), ml.getItemCode()));
            }
            //Integer id, String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager
        } catch (Exception ex) {
            System.out.println();
        }
        return list;
    }

     // view All Production Materials
    public ArrayList viewAllMaterialsByItemCode(String itemcode) {
        MaterialsLocal ml = null;
        ArrayList list = new ArrayList();
        Collection col = null;
        HelpMaterials hlp = null;
        try {
            col = material.findByItemCode(itemcode, CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                ml = (MaterialsLocal) i.next();
                list.add(new HelpMaterials(ml.getId(), ml.getMaterialName(), ml.getMaterialType(), ml.getQuantityUsed(), ml.getDateUsed(), ml.getAmount(), ml.getManager(), ml.getItemCode()));
            }
            //Integer id, String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager
        } catch (Exception ex) {
            System.out.println();
        }
        return list;
    }

   
    //########################################################################## end of Production Module###############################################
    // ########   Stock  writen on the 23 of june 2011 : ###############
    // ########    By TERSEER AGBE  FOR CONSERVATIVE ESTIMATES ############
    public String addStock(HelpStock pr) {
        StockLocal sl = null;
        StockhistoryLocal shl = null;
        Collection col = null;
   
        //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        String catt ="";
        String code = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
            String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 8);
        // line ensures that the serial number so generated is not greater than 12
          
    
       // System.out.println("this is my world===" +  "AND " + pr.getCommodityId());
     ItemsLocal it = null;

        try {

            //sl = stock.findByPrimaryKey(pr.getSno());
            //sl = stock.findBysnAncommodityId(pr.getSno(), pr.getCommodityId());
            col = stock.findByCommodityIdAndWarehouse(pr.getCommodityId(), pr.getWhousecode());
           // Integer n = stock.Max();
            if (col.isEmpty()) {
              it = items.findByPrimaryKey(pr.getCommodityId());

               // System.out.println("collection11-------" + col.size());
             //  Integer n = stock.Max();
                sl = stock.create(pr.getCommodityId());
                
                //sl.setCommodityId(pr.getCommodityId());
                sl.setQuantityIn(pr.getQuantityIn());
                 sl.setQuantityLeft( new Integer(0));
                sl.setReceivedDate(pr.getReceivedDate());
                sl.setReceivedBy(pr.getReceivedBy());
                sl.setUnitprice(pr.getUnitprice());
                sl.setUnitcode(pr.getUnitcode());
               sl.setCommodityName(pr.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(pr.getCompactments());
                sl.setWhcode(pr.getWhousecode());
                sl.setBarcode(pr.getBarcode());
                 sl.setMakeOrBuy(pr.getMakeOrBuy());
                 sl.setCategory(pr.getCategory());
                 it.setDel("0");

            } else {
                Integer nn = stockhist.Max();
                sl = stock.findBycommodityIdAndWarehouse(pr.getCommodityId(), pr.getWhousecode());
               
                sl.setQuantityIn(pr.getQuantityIn());

                //shl = stockhist.create(new Auto().getNext(nn));
             
               // shl.setCommodityId(pr.getCommodityName());
               // shl.setQuantityIn(pr.getQuantityIn());
               // shl.setQuantityLeft(new Integer(0));
               // shl.setReceivedDate(pr.getReceivedDate());
               // shl.setReceivedBy(pr.getReceivedBy());
               // shl.setUnitprice(pr.getUnitprice());
               // shl.setUnitcode(pr.getUnitcode());
               // shl.setCommodityName(pr.getCommodityName());
               // shl.setDel(CONFIG.ACIVATIVE_STOCK);
              //  shl.setCompartments(pr.getCompactments());
               // shl.setStatus(CONFIG.MOD_STOCK_HISTORY);
               // shl.setWhcode(pr.getWhousecode());
                // sl.setCategory(pr.getCategory());
            }
        } catch (Exception ex) {

            throw new EJBException(CONST.ERROR_ADD_RECORD);
               //throw new EJBException(MCONSTANTS.ERROR_CREATE_SPORTS);
        }
        return CONST.ADD_RECORD;
    }

    // ADD STOCK HISTROY
    public String addStockHistory(HelpStock pr) {
        //StockLocal sl = null;
        StockhistoryLocal shl = null;
        Integer n = stockhist.Max();
        Collection col = null;
        //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 5);
       try {
            shl = stockhist.create(new Auto().getNext(n));
          //  System.out.println("this is my world===" + "AND " + pr.getCommodityId() + "AND" + pr.getStatus());
            shl.setCommodityId(pr.getCommodityId());
            shl.setQuantityIn(pr.getQuantityIn());
            shl.setQuantityLeft(new Integer(0));
            shl.setReceivedDate(pr.getReceivedDate());
            shl.setReceivedBy(pr.getReceivedBy());
            shl.setUnitprice(pr.getUnitprice());
            shl.setUnitcode(pr.getUnitcode());
           // shl.setCommodityName(pr.getCommodityName());
            shl.setDel(CONFIG.getUN_SET_DELETE());
            shl.setCompartments(pr.getCompactments());
            shl.setStatus(pr.getStatus());
            shl.setWhcode(pr.getWhousecode());
            shl.setMakeorbuy(pr.getMakeOrBuy());
            shl.setCategory(pr.getCategory());
            } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    public ArrayList viewAllStocks(String whcode) {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = stock.findAll(CONFIG.getACIVATIVE_STOCK(), whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode                                                 //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode

           // System.out.println(sl.getCode());
            }
        } catch (Exception ex) {
        throw new EJBException(ex.getMessage());
        }
        return list;
    }
    public ArrayList viewAllStocks() {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = stock.findByDel(CONFIG.getACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode                                                 //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode

           // System.out.println(sl.getCode());
            }
        } catch (Exception ex) {
        throw new EJBException(ex.getMessage());
        }
        return list;
    }
    
    
 public ArrayList viewAllStockHistoryByStatus(String status) {
        StockhistoryLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
            col = stockhist.findByStatus(status);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockhistoryLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(), sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeorbuy(), null, null, sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode                                                 //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
        throw new EJBException(ex.getMessage());
        }
        return list;
    }
 
    // view Store by Category  String category, String whcode, String MakeOrBuy
    public ArrayList viewStoreByCategory(String commodityName, String whcode) {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();

        try {
          //  System.out.println("String commodityName ="+commodityName + "====" + whcode);
            col = stock.findBycommodityIdAndWhcodeAndDel("%" + commodityName + "%",whcode,CONFIG.getACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
          throw new EJBException(ex.getMessage());
        }
        return list;
    }

     public ArrayList viewStoreByCWMD(String category, String whcode, String MakeOrBuy) {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();
        try {
          //  System.out.println("String commodityName ="+commodityName + "====" + whcode);
            col = stock.findByCategoryAndWhcodeAndMakeorBuyAndDel(category, whcode, MakeOrBuy, CONFIG.getACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
     throw new EJBException(ex.getMessage());
        }
        return list;
    }
    
  public ArrayList viewStoreByCategoryAndWareHouse(String category, String whcode) {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();

        try {
         // System.out.println("come ooo====" + category +" nasoooo==="+ category);
            col = stock.findBycategoryandwhcode(category, whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, StrviewAllCommoditiesing commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
     throw new EJBException(ex.getMessage());
        }
        return list;
    }
 // view Store by Category
    public ArrayList viewStoreByCompartments(String whcode,String compartment) {
        StockLocal sl = null;
        Collection col = null;
        ArrayList list = new ArrayList();

        try {
            col = stock.findByWhcodeAndCompartments(whcode, compartment);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                sl = (StockLocal) i.next();
                list.add(new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(), sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory()));
                //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
     throw new EJBException(ex.getMessage());
        }
        return list;
    }

    public HelpStock viewSingleCommodity(String Id, String whcode) {
        StockLocal sl = null;
        HelpStock hs = null;
        try {
           //System.out.println("ppppppp="+ Id  + "====" + whcode);
            sl = stock.findBycommodityIdAndWarehouse(Id, whcode);
            hs = new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory());
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return hs;
    }
      public HelpStock viewSingleCommodity22(String Id) {
        StockLocal sl = null;
        HelpStock hs = null;
        try {
            //System.out.println("ppppppp="+ Id  + "====" + whcode);
            sl = stock.findByPrimaryKey(Id);
            hs = new HelpStock(sl.getCommodityId(), sl.getQuantityIn(), sl.getReceivedDate(),sl.getReceivedBy(), sl.getUnitprice(), sl.getCommodityName(), sl.getUnitcode(), sl.getCompartments(), sl.getWhcode(), sl.getMakeOrBuy(), sl.getBarcode(), sl.getDiscountCategory(), sl.getCategory());
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return hs;
    }
      public Helpcommodity viewSingleCommodity3(String Id) {
        ItemsLocal sl = null;
        Helpcommodity hs = null;
        try {
            //System.out.println("ppppppp="+ Id  + "====" + whcode);
           sl = items.findByPrimaryKey(Id);
            hs = new Helpcommodity(sl.getItemcode(),sl.getItemname(), sl.getCategory(), sl.getMakeorbuy(),sl.getDescription(), sl.getAuthorisation(), sl.getDateadded(), sl.getDel());
        //String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del
        } catch (Exception ex) {
            throw new EJBException("error in viewSingleCommodity3"+ex.getMessage());
        }
        return hs;
    }
 public Helpcommodity viewSingleCommodityMew(String Id) {
        ItemsLocal sl = null;
        Helpcommodity hs = null;
        try {
            //System.out.println("ppppppp="+ Id  + "====" + whcode);
           sl = items.findByPrimaryKey(Id);
            hs = new Helpcommodity(sl.getItemcode(),sl.getItemname(), sl.getCategory(), sl.getMakeorbuy(),sl.getDescription(), sl.getAuthorisation(), sl.getDateadded(), sl.getDel());
        //String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return hs;
    }
    // modify Stock
    public String modifyStock(HelpStock hs) {
        StockLocal sl = null;
        //HelpStock hs = null;
        try {
            sl = stock.findByPrimaryKey(hs.getCommodityId());
            // sl.setCommodityId(hs.getCommodityId());
            sl.setQuantityIn(hs.getQuantityIn());
            sl.setQuantityLeft(new Integer(0));
            sl.setReceivedDate(hs.getReceivedDate());
            sl.setReceivedBy(hs.getReceivedBy());
            sl.setUnitprice(hs.getUnitprice());
            sl.setUnitcode(hs.getUnitcode());
            sl.setCommodityName(hs.getCommodityName());
            sl.setDel(CONFIG.getACIVATIVE_STOCK());
            sl.setCompartments(hs.getCompactments());
        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_MODIFY_RECORD);
        }
        return CONST.MODIFY_RECORD;
    }

    // modify Stock
    
    public String updateStockQuantity(HelpStock hs) {
        StockLocal sl = null;
         StockhistoryLocal shl = null;
        //HelpStock hs = null;
        try {
            System.out.println("code=="+hs.getCommodityId() +"ooooooooo"+ hs.getWhousecode());
            sl = stock.findBycommodityIdAndWarehouse(hs.getCommodityId(), hs.getWhousecode());
            // sl.setCommodityId(hs.getCommodityId());
            sl.setQuantityIn(hs.getQuantityIn());

              //shl = stockhist.create(new Auto().getNext(n));
          
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return CONST.MODIFY_RECORD;
    }
    // ########   supply module writen on the 24 of june 2011 : ###############
    // ########    By TERSEER AGBE  FOR CONSERVATIVE ESTIMATES ############
   /* public String makeSupply(HelpSupply sp) {
        SupplyLocal spl = null;
        Integer n = supply.Max();
        StockLocal sl = null;

        try {
            System.out.println();
            spl = supply.create(new Auto().getNext(n));
            spl.setCommodityId(sp.getCommodityId());
            spl.setDateSupplied(sp.getDateSupplied());
            spl.setDistributorId(sp.getDistributorId());
            spl.setIssuedBy(sp.getIssuedBy());
            spl.setQuantitySupplied(sp.getQuantitySupplied());
            spl.setCogs(sp.getCogs()); 
            // sl = stock.findByPrimaryKey(n);
            //  sl.setQuantityLeft(n);

        } catch (Exception ex) {

            throw new EJBException(CONST.ADD_SUPPLY_ERROR +ex.getMessage());
        }
        return CONST.ADD_SUPPLY_SUCCESS;
    }
    */
     public String makeSupply1(String commodityid,String username,String distributor,String dos, Integer quantitysupplied,Float amount,String whcode, String qtyleft, String comodityname, String locations, String phonenumber) {
        SupplyLocal spl = null;
        Integer n = supply.Max();
        StockLocal sl = null;

        try {
             
            spl = supply.create(new Auto().getNext(n));
            spl.setCommodityId(commodityid);
            spl.setDateSupplied(dos);
            spl.setDistributorId(distributor);
            spl.setIssuedBy(username);
            spl.setQuantitySupplied(quantitysupplied);
            spl.setCogs(amount);
            spl.setWhcode(whcode);
            spl.setQtyleft(qtyleft);
            spl.setComodityname(comodityname);
            spl.setLocation(locations);
            spl.setPhonenumber(phonenumber);

            // sl = stock.findByPrimaryKey(n);
            //  sl.setQuantityLeft(n);

        } catch (Exception ex) {

           // throw new EJBException(ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    public String modifySupply(HelpSupply spp) {
        SupplyLocal spl = null;
        try {
            spl = supply.findByPrimaryKey(spp.getSno());
            spl.setCommodityId(spp.getCommodityId());
            spl.setDateSupplied(spp.getDateSupplied());
            spl.setDistributorId(spp.getDistributorId());
            spl.setIssuedBy(spp.getIssuedBy());
            spl.setQtyleft(spp.getQtyleft());
            spl.setComodityname(spp.getComodityname());
            spl.setLocation(spp.getLocation());
        } catch (Exception ex) {

            //throw new EJBException(CONST.ADD_SUPPLY_ERROR);
        }
        return CONST.ADD_RECORD;
    }

      public String modifySupply1(HelpSupply spp) {
        SupplyLocal spl = null;
        try {
            spl = supply.findByPrimaryKey(spp.getSno());
            spl.setCommodityId(spp.getCommodityId());
            spl.setDateSupplied(spp.getDateSupplied());
            spl.setDistributorId(spp.getDistributorId());
            spl.setIssuedBy(spp.getIssuedBy());
            spl.setQtyleft(spp.getQtyleft());
            spl.setComodityname(spp.getComodityname());
        } catch (Exception ex) {

           // throw new EJBException(CONST.ADD_SUPPLY_ERROR);
        }
        return CONST.ADD_RECORD;
    }

    public ArrayList viewAllSupplies() {
        ArrayList list = new ArrayList();
        Collection col = null;
        SupplyLocal spl = null;
            ItemsLocal it = null;
        try {
            col = supply.findAll();
            Iterator i = col.iterator();
            while (i.hasNext()) {
                spl = (SupplyLocal) i.next();
                //it = items.findByPrimaryKey(spl.getCommodityId());
                 //StockLocal sl = stock.findByPrimaryKey(spl.getCommodityId());

                list.add(new HelpSupply(spl.getSno(),spl.getCommodityId() ,spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber()));
                //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }
    public ArrayList viewAllSupplies(String whcode) {
        ArrayList list = new ArrayList();
        Collection col = null;
        SupplyLocal spl = null;
            ItemsLocal it = null;
        try {
            col = supply.findByWhcode(whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                spl = (SupplyLocal) i.next();
               // it = items.findByPrimaryKey(spl.getCommodityId());
                // StockLocal sl = stock.findByPrimaryKey(spl.getCommodityId());
               list.add(new HelpSupply(spl.getSno(),spl.getCommodityId() ,spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber()));
               //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }
    public ArrayList viewAllSupplieByDate(String datesupp) {

        ArrayList list = new ArrayList();
        Collection col = null;
        SupplyLocal spl = null;
            ItemsLocal it = null;
        try {
           // System.out.println("this is the date from jsp"+datesupp);
            col = supply.findByDateSupplied(datesupp);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                spl = (SupplyLocal) i.next();
               // it = items.findByPrimaryKey(spl.getCommodityId());
               // System.out.println("this is the date from database "+spl.getDateSupplied());
                // StockLocal sl = stock.findByPrimaryKey(spl.getCommodityId());
                  list.add(new HelpSupply(spl.getSno(),spl.getCommodityId() ,spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber()));
              //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied, Integer quantitySupplied, Float cogs, String whcode, String itemname, String qtyleft, String comodityname
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    // View Supply By category
    public ArrayList viewSupplyByCategory(String commodityId, String whcode) {
        ArrayList list = new ArrayList();
        Collection col = null;
           StockLocal sl = null;
        // Collection col2 = null;
        SupplyLocal spl = null;

        try {
            col = supply.findByCategory("%" + commodityId + "%" , whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                spl = (SupplyLocal) i.next();
               // sl = stock.findByPrimaryKey(spl.getCommodityId());

            list.add(new HelpSupply(spl.getSno(),spl.getCommodityId() ,spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber()));
                    //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied
                }
            // }
        } catch (Exception ex) {
            throw new EJBException("CANNOT FIND THE SEARCH...due to =="+ex.getMessage());
        }
        return list;
    }
     public ArrayList viewSupplyByCategory2(String commodityId, String whcode) {
        ArrayList list = new ArrayList();
        Collection col = null;
           StockLocal sl = null;
                  ItemsLocal it = null;
        // Collection col2 = null;
        SupplyLocal spl = null;

        try {
            col = supply.findByComodityname("%" + commodityId + "%");
            Iterator i = col.iterator();
            while (i.hasNext()) {
                spl = (SupplyLocal) i.next();
         

               // System.out.println("this is my name==" + it.getItemname());

     list.add(new HelpSupply(spl.getSno(),spl.getCommodityId() ,spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber()));
                          //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied
                }
            // }
        } catch (Exception ex) {
            throw new EJBException("CANNOT FIND THE SEARCH...due to =="+ex.getMessage());
        }
        return list;
    }

    // view single supply

    public HelpSupply viewSingleSupply(Integer suup) {
        SupplyLocal spl = null;
        HelpSupply hsup = null;
        try {
            spl = supply.findByPrimaryKey(suup);

            hsup = new HelpSupply(spl.getSno(), spl.getCommodityId(), spl.getIssuedBy(), spl.getDistributorId(), spl.getDateSupplied(), spl.getQuantitySupplied(), spl.getCogs(), spl.getWhcode(), spl.getQtyleft(), spl.getComodityname(), spl.getLocation(), spl.getPhonenumber());
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hsup;
    }

    // modify stock for supply
    public String modifyStockForSupply(HelpStock hs) {
        StockLocal sl = null;
        //HelpStock hs = null;
        try {
            System.out.println("oya change the quantity price" + hs.getCode());
            sl = stock.findByPrimaryKey(hs.getCommodityId());
            // sl.setCommodityId(hs.getCommodityId());
           //sl.setQuantityIn(new Integer(sl.getQuantityIn().intValue() + hs.getQuantityIn().intValue()));
          sl.setQuantityIn(hs.getSub());
            // sl.setReceivedDate(hs.getReceivedDate());
            // sl.setReceivedBy(hs.getReceivedBy());
            // sl.setUnitprice(hs.getUnitprice());
            // sl.setUnitcode(hs.getUnitcode());
            // sl.setCommodityName(hs.getCommodityName());
        } catch (Exception ex) {
          //  throw new EJBException(CONST.MODIFY_GOODS_ERROR +ex.getMessage());
        }
        return CONST.MODIFY_RECORD;
    }

       public float computeSupply(Integer quantitysupplied, int unitprice) {
          SupplyLocal spl = null;
          HelpSupply hsup = null;
          int multiply = 0;
          float ans = 0.0F;
               
        try{
            multiply = (quantitysupplied.intValue() * unitprice);
            
            ans = multiply;
            
            //System.out.println("answerrrrrrrr"+ans);


        }catch(Exception ex){

            throw new EJBException(ex.getMessage());
        }
        return ans;
    }

    //THIS METHOD RESISZES ANY IMAGE FILE SENT TO IT
    public byte[] imageResizer(InputStream pic, int width, int height) throws Exception {
        ByteArrayInputStream bis = null;

        InputStream imageStream = new BufferedInputStream(pic);
        Image image = (Image) ImageIO.read(imageStream);
        String IMAGE_JPG = "jpg";
        int thumbWidth = width;
        int thumbHeight = height;
        // Make sure the aspect ratio is maintained, so the image is not skewed
        double thumbRatio = (double) thumbWidth / (double) thumbHeight;
        int imageWidth = image.getWidth(null);
        int imageHeight = image.getHeight(null);
        double imageRatio = (double) imageWidth / (double) imageHeight;
        if (thumbRatio < imageRatio) {
            thumbHeight = (int) (thumbWidth / imageRatio);
        } else {
            thumbWidth = (int) (thumbHeight * imageRatio);
        }

        // Draw the scaled image
        BufferedImage thumbImage = new BufferedImage(thumbWidth,
                thumbHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2D = thumbImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        graphics2D.drawImage(image, 0, 0, thumbWidth, thumbHeight, null);

        // Write the scaled image to the outputstream
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(thumbImage);
        int quality = 100; // Use between 1 and 100, with 100 being highest quality
        quality = Math.max(0, Math.min(quality, 100));
        param.setQuality((float) quality / 100.0f, false);
        encoder.setJPEGEncodeParam(param);
        encoder.encode(thumbImage);
        ImageIO.write(thumbImage, IMAGE_JPG, out);

        // Read the outputstream into the inputstream for the return value
        bis = new ByteArrayInputStream(out.toByteArray());
        byte[] data = null;
        try {
             data = IOUtils.toByteArray(bis);
            //data = IOUtilstoByteArray(bis);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return data;
    }

    public String UploadStaffPic(String applicantNo, byte[] pic) {
        StaffLocal stafflocal = null;
        String msg = "";
        try {
            stafflocal = staff.findByPrimaryKey(applicantNo);
            stafflocal.setPassport(pic);
            msg = "Done Successfully";

        } catch (Exception ex) {
            msg = "cannot create";
            throw new EJBException();
        }
        return msg;
    }

    public HelpDb viewDataBase(Integer sno) {
        DbLocal dbl = null;
        HelpDb dbh = null;
        try {
            dbl = dbhome.findByPrimaryKey(sno);

            dbh = new HelpDb(dbl.getSno(), dbl.getHost(), dbl.getUsername(), dbl.getPassword(), dbl.getDbname());
            //Integer sno, String host, String username, String password, String dbname

        } catch (Exception ex) {
            throw new EJBException();
        }
        return dbh;
    }

    public String addDatabase(HelpDb dbhe) {
        DbLocal dbl = null;
        //HelpDb dbh = null;
        Integer n = dbhome.Max();
        try {
            dbl = dbhome.create(new Auto().getNext(n));
            dbl.setDbname(dbhe.getDbname());
            dbl.setHost(dbhe.getHost());
            dbl.setPassword(dbhe.getPassword());
            dbl.setUsername(dbhe.getUsername());


        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_RECORD;
    }

    // add request
    public String addRequest(HelpRequisition hpr) {
        RequitionLocal reqil = null;
        Integer n = requisition.Max();
        //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String code1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 8);
        try {
            reqil = requisition.create(new Auto().getNext(n));
            reqil.setCommodityId(hpr.getCommodityId());
            reqil.setDateoFRequest(hpr.getDateoFRequest());
            reqil.setManager(hpr.getManager());
            reqil.setRequisitionCode(code1.toUpperCase());
            reqil.setComment(hpr.getComment());
            reqil.setStatus("1");
            reqil.setQuantity(hpr.getQuantity());
            reqil.setDel("0");
        } catch (Exception ex) {

            throw new EJBException(ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    // modify Request
    public String modifyRequest(HelpRequisition hpr) {
        RequitionLocal reqil = null;
            try {
            reqil = requisition.findByPrimaryKey(hpr.getSno());
            //reqil.setCommodityId(hpr.getCommodityId());
            reqil.setDateoFRequest(hpr.getDateoFRequest());
            reqil.setQuantity(hpr.getQuantity());
            reqil.setRequisitionCode(hpr.getRequisitionCode());
            reqil.setComment(hpr.getComment());
        } catch (Exception ex) {
          // throw new EJBException("Error due to:" +ex.getMessage());
        }
        return CONST.MODIFY_RECORD;
    }

    // view Single Request
    public HelpRequisition viewSingleRequisition(Integer hre) {
        RequitionLocal reqil = null;
        Integer n = requisition.Max();
        HelpRequisition hpp = null;
        try {
            reqil = requisition.findByPrimaryKey(hre);
            hpp = new HelpRequisition(reqil.getSno(), reqil.getCommodityId(),reqil.getDateoFRequest(), reqil.getManager(), reqil.getRequisitionCode(), "", reqil.getComment(), reqil.getQuantity(), reqil.getStatus());

            //Integer sno, String commodityId, String commodityName, String dateoFRequest, String manager, String requisitionCode, String role, String comment
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hpp;
    }

    // view All Request
    public ArrayList viewAllRequest(String reqcode) {
        ArrayList list = new ArrayList();
        Collection col = null;
        RequitionLocal reqil = null;
        try {
            col = requisition.findByRequisitionCode("%" + reqcode + "%");
            Iterator i = col.iterator();
            while (i.hasNext()) {

                reqil = (RequitionLocal) i.next();

                list.add(new HelpRequisition(reqil.getSno(), reqil.getCommodityId(), reqil.getDateoFRequest(), reqil.getManager(), reqil.getRequisitionCode(), "", reqil.getComment(), reqil.getQuantity(), reqil.getStatus()));

            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }
    // view All Request BY DATE
     public ArrayList viewAllRequestByDate(String redate1) {
        ArrayList list = new ArrayList();
        Collection col = null;
        RequitionLocal reqil = null;

        try {
            //System.out.println("sessionBean oooooooooo"+redate1);
            col = requisition.findByDateoFRequest(redate1);
            //System.out.println("sessionBean oooooooooo333"+redate1 + "-------" + col.size());
            Iterator i = col.iterator();
            while (i.hasNext()) {

                reqil = (RequitionLocal) i.next();

                list.add(new HelpRequisition(reqil.getSno(), reqil.getCommodityId(), reqil.getDateoFRequest(), reqil.getManager(), reqil.getRequisitionCode(), "", reqil.getComment(), reqil.getQuantity(), reqil.getStatus()));

            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

     // view All Request BY DATE
     public ArrayList viewAllRequestByStatus(String redate) {
        ArrayList list = new ArrayList();
        Collection col = null;
        RequitionLocal reqil = null;

        try {
            col = requisition.findByStatus(redate);
            Iterator i = col.iterator();
            while (i.hasNext()) {

                reqil = (RequitionLocal) i.next();

                list.add(new HelpRequisition(reqil.getSno(), reqil.getCommodityId(), reqil.getDateoFRequest(), reqil.getManager(), reqil.getRequisitionCode(), "", reqil.getComment(), reqil.getQuantity(), reqil.getStatus()));

            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }
 public ArrayList viewAllRequestByCommodity(String reqcode) {
        ArrayList list = new ArrayList();
        Collection col = null;
        RequitionLocal reqil = null;
        ItemsLocal it = null;

        try {
            col = requisition.findByCommodityId(reqcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                reqil = (RequitionLocal) i.next();
                it = items.findByPrimaryKey(reqil.getCommodityId());
                //reqil.getCommodityId()
                list.add(new HelpRequisition(reqil.getSno(), it.getItemname(), reqil.getDateoFRequest(), reqil.getManager(), reqil.getRequisitionCode(), "", reqil.getComment(), reqil.getQuantity(), reqil.getStatus()));
            }
        } catch (Exception ex) {
                  throw new EJBException(ex.getMessage());
        }
        return list;
    }

 //remove request
   public String removeRequest(Integer id) {
  RequitionLocal reqil = null;
        try{
        reqil =  requisition.findByPrimaryKey(id);
        reqil.setDel(CONFIG.getSET_DELETE());
        // reqil.r

       }catch(Exception ex){
             // throw new EJBException(ex.getMessage());
       }
        return null;
    }
   
    // modify limits
    public String modifyLimits(HelpLimit hhl) {
        //GoodslimitsLocal gl = null;
        LimitsLocal gl = null;
        try {
            gl = limits.findByPrimaryKey(hhl.getCommodityCode());
            gl.setLower(hhl.getLowerLimit());
            gl.setUpper(hhl.getUpperLimit());
            gl.setWhcode(hhl.getWhcode());

        } catch (Exception ex) {
            throw new EJBException(CONST.ERROR_ADD_RECORD);
        }
        return CONST.ADD_RECORD;
    }

    // view All Limits
    public ArrayList viewAllLimits(String whcode) {
        Collection col = null;
        ArrayList list = new ArrayList();
        LimitsLocal gl = null;
        try {
            col = limits.findAll(whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                gl = (LimitsLocal) i.next();
                list.add(new HelpLimit(gl.getCode(), gl.getLower(), gl.getUpper(), gl.getWhcode()));
               }
        } catch (Exception ex) {

            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    // view single Limit
    public HelpLimit viewSingleLimit(String id, String whcode) {
        LimitsLocal gl = null;
        HelpLimit hll = null;
        try {
            gl = limits.findByCommodityIdAndWarehouse(id, whcode);

            hll = new HelpLimit(gl.getCode(), gl.getLower(), gl.getUpper(), gl.getWhcode());

        } catch (Exception ex) {
                  throw new EJBException(ex.getMessage());
        }
        return hll;
    }

    public HelpLimit viewCommodityLimit(String CommodityId, String whcode) {
        LimitsLocal gl = null;
        HelpLimit hll = null;
        try {
            gl = limits.findByCommodityIdAndWarehouse(CommodityId, whcode);
            hll = new HelpLimit( gl.getCode(), gl.getLower(), gl.getUpper(), gl.getWhcode());
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hll;
    }

    public String addLimit(HelpLimit hii) {
        // GoodslimitsLocal gl = null;
        LimitsLocal limit = null;
        //HelpLimit hll = null;
          try {
            // limit.setCode(limitcode);
            //limit = limits.findByPrimaryKey
            limit = limits.create(hii.getCommodityCode());
            limit.setLower(hii.getLowerLimit());
            limit.setUpper(hii.getUpperLimit());
            limit.setWhcode(hii.getWhcode());
            limit.setDel("NO");
        } catch (Exception ex) {
           // System.out.println(CONST.ADD_MATERIAL_ERROR);
        }
        return CONST.ADD_RECORD;
    }

    public boolean findMinimum(Integer greater, String less) {
        //   boolean nn;
        int a = 0;
        int b = 0;
        boolean c;
        try {
            c = greater.intValue() < b;
            if (c == true) {
            }

        } catch (Exception ex) {

            return false;
        }
        return true;
    }

    // delete section
    // REMOVE PRODUCTION
    public String removeProduction(Integer id) {
        ProductionLocal prlocal = null;
        try {
            prlocal = production.findByPrimaryKey(id.toString());
            prlocal.setDel(CONFIG.getSET_DELETE());

        } catch (Exception ex) {
                   throw new EJBException(ex.getMessage());
        }
        return null;
    }

    // REMOVE MATERIAL
    public String removeMaterial(Integer id) {
        MaterialsLocal ml = null;
        try {
            ml = material.findByPrimaryKey(id);
            ml.setDel(CONFIG.getSET_DELETE());
        } catch (Exception ex) {
                  throw new EJBException(ex.getMessage());
        }
        return null;
    }

    // REMOVE STAFF
    public String removeStaff(String id) {
        StaffLocal stafflocal = null;
        try {
            stafflocal = staff.findByPrimaryKey(id);
            stafflocal.setDel(CONFIG.getSET_DELETE());
        } catch (Exception ex) {
                   throw new EJBException(ex.getMessage());
        }
        return null;
    }

    public String removeRoles(String id) {
        RolesLocal rl = null;
        try {
            rl = role.findByPrimaryKey(id);
            rl.setDel(CONFIG.getSET_DELETE());

        } catch (Exception ex) {

                  throw new EJBException(ex.getMessage());
        }
        return null;
    }

    public String removeStock(String id) {
        StockLocal sl = null;

        try {
            System.out.println("id here ooo"+id);
            sl = stock.findByPrimaryKey(id);
            sl.setDel(CONFIG.getDE_ACIVATIVE_STOCK());

        } catch (Exception ex) {
               throw new EJBException(ex.getMessage());
        }
        return null;
    }
    public String activateStock(String id) {
        StockLocal sl = null;
        ItemsLocal it = null;
       try {
          
            // entering itemsBean
           it = items.findByPrimaryKey(id);
            it.setDel(CONFIG.getACIVATIVE_STOCK());

              sl = stock.findByPrimaryKey(id);
            sl.setDel(CONFIG.getACIVATIVE_STOCK());


        } catch (Exception ex) {
            throw new EJBException();
        }
        return null;
    }


    // COMMODITY SECTION
    public String addCommodity(Helpcommodity gs) {

       // CommodityLocal comm = null;
        ItemsLocal it = null;
        LimitsLocal limit = null;
        //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        String catt = "";
        String code = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 8).toLowerCase();
      //  catt = (gs.getCategory().substring(0, 3).toUpperCase() + "/" + "CAT");
          //  if(){
        //code = (rCase() + "/" + pin1 + "/" + "STK");

        try {
            //items
            it = items.create(pin1);
            //String commodityId, String commodityName, String commodityType, String addedDate, String managerId, Integer quantity
            it.setItemname(gs.getItemname().toLowerCase());
            it.setCategory(gs.getCategory());
            it.setMakeorbuy(gs.getMakeorbuy());
            it.setDescription(gs.getDescription());
            it.setAuthorisation(gs.getAuthorisation());
            it.setDateadded(gs.getDateadded());
            it.setDel(CONFIG.getACIVATIVE_STOCK());

            // entring LimitBean 

            limit = limits.create(it.getItemcode());
            limit.setLower(gs.getLowerlimit());
            limit.setUpper("0");
            limit.setWhcode(gs.getWhcode());
            limit.setDel(CONFIG.getUN_SET_DELETE());

            } catch (Exception ex) {
                throw new EJBException(ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

      // view Commodity by Category
    public ArrayList viewCommdityByCategory(String commodityName) {
        Collection col = null;
        ArrayList list = new ArrayList();
         ItemsLocal it = null;
        try {
          //  System.out.println("String commodityName ="+commodityName + "====" + whcode);
            col = items.findByItemName("%" + commodityName.toLowerCase() + "%");
            Iterator i = col.iterator();
            while (i.hasNext()) {
                  it = (ItemsLocal) i.next();
                list.add(new Helpcommodity(it.getItemcode(), it.getItemname(), it.getCategory(), it.getMakeorbuy(), it.getDescription(), it.getAuthorisation(), it.getDateadded(), it.getDel()));
                //String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del
               //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
     throw new EJBException(ex.getMessage());
        }
        return list;
    }
    
    // view All Commodity
    public ArrayList viewAllCommodities() {
        Collection col = null;
        ArrayList list = new ArrayList();
        ItemsLocal it = null;//viewAllCommodities Helpcommodity
        try {
            col = items.findByDel(CONFIG.getACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                it = (ItemsLocal) i.next();
                 list.add(new Helpcommodity(it.getItemcode(), it.getItemname(), it.getCategory(), it.getMakeorbuy(), it.getDescription(), it.getAuthorisation(), it.getDateadded(), it.getDel()));
             //Integer sno, String commodityId, String commodityType, String commodityName, String addedDate, String managerId
                //String commodityCode, String lowerLimit, String upperLimit
            }
        } catch (Exception ex) {

            throw new EJBException(ex.getMessage());
        }
        return list;
    }
     // view All Commodity
    public ArrayList viewAllCommoditiesForActivation() {
        Collection col = null;
        ArrayList list = new ArrayList();
        ItemsLocal it = null;//viewAllCommodities Helpcommodity
        try {
            col = items.findByDel(CONFIG.getDE_ACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                it = (ItemsLocal) i.next();
                 list.add(new Helpcommodity(it.getItemcode(), it.getItemname(), it.getCategory(), it.getMakeorbuy(), it.getDescription(), it.getAuthorisation(), it.getDateadded(), it.getDel()));
             //Integer sno, String commodityId, String commodityType, String commodityName, String addedDate, String managerId
             //String commodityCode, String lowerLimit, String upperLimit
            }
        } catch (Exception ex) {

            throw new EJBException(ex.getMessage());
        }
        return list;
    }

    public ArrayList viewAllCommodities1(String makeorby) {
        Collection col = null;
        ArrayList list = new ArrayList();
        ItemsLocal it = null;//viewAllCommodities Helpcommodity
        try {
            col = items.findByMakeorbuyAndDel(makeorby,CONFIG.getACIVATIVE_STOCK());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                it = (ItemsLocal) i.next();
               list.add(new Helpcommodity(it.getItemcode(), it.getItemname(), it.getCategory(), it.getMakeorbuy(), it.getDescription(), it.getAuthorisation(), it.getDateadded(), it.getDel()));
               //Integer sno, String commodityId, String commodityType, String commodityName, String addedDate, String managerId
                //String commodityCode, String lowerLimit, String upperLimit
            }
        } catch (Exception ex) {

                 throw new EJBException(ex.getMessage());
        }
        return list;
    }

    // modify Items
 public String modifyItems(Helpcommodity gs) {
        ItemsLocal it = null;
        LimitsLocal limit = null;
       // System.out.println(" u come here soooooooooooooooo" + se.getName());
       
        try {
            it = items.findByPrimaryKey(gs.getItemcode());
            it.setItemname(gs.getItemname().toLowerCase());
            it.setCategory(gs.getCategory());
            it.setMakeorbuy(gs.getMakeorbuy());
            it.setDescription(gs.getDescription());
            it.setAuthorisation(gs.getAuthorisation()); 
            it.setDateadded(gs.getDateadded());
            it.setDel(CONFIG.getACIVATIVE_STOCK());

             // entring LimitBean

            limit = limits.findByCommodityIdAndWarehouse(it.getItemcode(), gs.getWhcode());
            limit.setLower(gs.getLowerlimit());
            limit.setUpper("0");
            limit.setWhcode(gs.getWhcode());
            //limit.setDel(null);
        } catch (Exception ex) {
            throw new EJBException("SECTION ALREADY EXIST !!" + ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    // REMOVE COMMODITY
    public String removeCommodity(String id) {
        ItemsLocal it = null;
        StockLocal sl = null;
        try {
            it = items.findByPrimaryKey(id);
            it.setDel(CONFIG.getDE_ACIVATIVE_STOCK());
            sl = stock.findByPrimaryKey(id);
            sl.setDel(CONFIG.getDE_ACIVATIVE_STOCK());
         
        } catch (Exception ex) {
            throw new EJBException();
        }
        return null;
    }
    // view single Section

    public Helpcommodity viewSingleCommodity2(String id) {
        ItemsLocal it = null;
        Helpcommodity hs = null;
        try {
           // System.out.println("na spppppppppppppp"+id);
            it = items.findByPrimaryKey(id.toUpperCase());

            hs = (new Helpcommodity(it.getItemcode(), it.getItemname(), it.getCategory(), it.getMakeorbuy(), it.getDescription(), it.getAuthorisation(), it.getDateadded(), it.getDel()));

        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return hs;
    }

    // Add sections
    public String addSections(HelpSection se) {
        SectionsLocal secl = null;
        Integer n = sec.Max();
       // System.out.println(" u come here soooooooooooooooo" + se.getName());
        try {
            secl = sec.create(new Auto().getNext(n));
             secl.setName(se.getName());
            secl.setCapacity(se.getCapacity());
            secl.setDescription(se.getDescription());
            secl.setStatus("OK");
            secl.setDel(CONFIG.getUN_SET_DELETE());
            secl.setTrack(new Integer(1));
            secl.setWhcode(se.getWhcode());
        } catch (Exception ex) {
            throw new EJBException("SECTION ALREADY EXIST !!" + ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    // remove Sections
    public String removeSeciton(Integer name) {
        SectionsLocal secl = null;
        try {
            secl = sec.findByPrimaryKey(name);
            secl.setDel(CONFIG.getSET_DELETE());

        } catch (Exception ex) {
            throw new EJBException();
        }
        return null;
    }

    // view All Sections
    public ArrayList viewAllSections(String whcode) {
        Collection col = null;
        ArrayList list = new ArrayList();
        SectionsLocal secl = null;
        System.out.println("un set delete" + CONFIG.getUN_SET_DELETE());
        try {
            col = sec.findByDel(CONFIG.getUN_SET_DELETE());
            //findByDelAndWhcode(CONFIG.getUN_SET_DELETE(), whcode);
            Iterator i = col.iterator();
            while (i.hasNext()) {
                secl = (SectionsLocal) i.next();
                list.add(new HelpSection(secl.getSno(), secl.getName(), secl.getCapacity(), secl.getDescription(), secl.getStatus(), secl.getTrack(), secl.getWhcode()));
            }
        } catch (Exception ex) {

            throw new EJBException();
        }
        return list;
    }

    // modify sections
    public String modifySections(HelpSection se) {
        SectionsLocal secl = null;
        try {
            secl = sec.findByPrimaryKey(se.getSno());
            secl.setCapacity(se.getCapacity());
            secl.setName(se.getName());
            secl.setDescription(se.getDescription());
            secl.setStatus(se.getStatus());
            secl.setDel(CONFIG.getUN_SET_DELETE());
        } catch (Exception ex) {
            throw new EJBException("SECTION ALREADY EXIST !!"+ ex.getMessage());
        }
        return CONST.ADD_RECORD;

    }

    // view single Section
    public HelpSection viewSingleSection(Integer name) {
        SectionsLocal secl = null;
        HelpSection hs = null;
        try {
            secl = sec.findByPrimaryKey(name);

            hs = new HelpSection(secl.getSno(), secl.getName(), secl.getCapacity(), secl.getDescription(), secl.getStatus(), secl.getTrack(), secl.getWhcode());

        } catch (Exception ex) {
            throw new EJBException();
        }
        return hs;
    }

    public HelpSection computeSection(String name, String wchode) {
        SectionsLocal secl = null;
        HelpSection hs = null;
        int i = 0;
        int aa = 0;
        try {
            // FIND THE PATICULER SECTION
            secl = sec.findByNameAndWhcode(name, wchode);
            // INCREASE BY 1
            aa = secl.getTrack().intValue() + 1; 
            // SET THE NEW VALUE
            secl.setTrack(new Integer(aa));

            if (secl.getTrack().toString().equalsIgnoreCase(secl.getCapacity())) {
                secl.setStatus("FULL");
            }
            hs = new HelpSection(secl.getSno(), secl.getName(), secl.getCapacity(), secl.getDescription(), secl.getStatus(), secl.getTrack(), secl.getWhcode());
            } catch (Exception ex) {
            throw new EJBException("error due to:"+ex.getMessage());
        }
        return hs;
    }

    public String deductQuantityInPro(String id, Integer Qsub) {
        ProductionLocal prlocal = null;
        try {
            prlocal = production.findByPrimaryKey(id);
            prlocal.setQuantityProduced(Qsub.toString());

        } catch (Exception ex) {
            throw new EJBException("ERROR IN deductQuantityInPro:" + ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    // add cost analysis
    public String addCostAnalysis(HelpCostAnalysis hcos) {
        CostAnalysisLocal castl = null;
        Integer n = casthome.Max();
        try {
            castl = casthome.create(new Auto().getNext(n));
            castl.setAmount(hcos.getAmount());
            castl.setDel(CONFIG.getUN_SET_DELETE());
            castl.setDateAdded(hcos.getDateAdded());
            castl.setItemCode(hcos.getItemCode());
            castl.setMaterials(hcos.getMaterials());
        } catch (Exception ex) {
             throw new EJBException("ERROR IN deductQuantityInPro:" + ex.getMessage());
        }
        return CONST.ADD_RECORD;
    }

    // modify Cost Analysis
    public String modifyCostAnalysis(HelpCostAnalysis hccs) {
        CostAnalysisLocal castl = null;
        try {
            castl = casthome.findByPrimaryKey(hccs.getSno());
            castl.setAmount(hccs.getAmount());
            castl.setDateAdded(hccs.getDateAdded());
            castl.setItemCode(hccs.getItemCode());
            castl.setMaterials(hccs.getMaterials());
        } catch (Exception ex) {
            throw new EJBException("ERROR IN deductQuantityInPro:" + ex.getMessage());
        }
        return CONST.ADD_MATERIAL_SUCCESS;
    }

    // remove CostAnalysis
    public String removeCostAnalysis(Integer sno) {
        CostAnalysisLocal castl = null;
        try {
            castl = casthome.findByPrimaryKey(sno);
            castl.remove();
        } catch (Exception ex) {
            throw new EJBException("ERROR IN deductQuantityInPro:" + ex.getMessage());
        }
        return null;
    }

    // viewSingle CostAnalysis
    public HelpCostAnalysis viewSingleCostAnnalysis(Integer sno) {

        CostAnalysisLocal castl = null;
        HelpCostAnalysis hc = null;

        try {
            castl = casthome.findByPrimaryKey(sno);
            hc = new HelpCostAnalysis(castl.getSno(), castl.getMaterials(), castl.getAmount(), castl.getItemCode(), castl.getDateAdded());
            //Integer sno, String materials, Float amount, String itemCode, String dateAdded
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hc;
    }

    // view All Cost Analysis
    public ArrayList viewAllCostAnalysis() {
        CostAnalysisLocal castl = null;
        HelpCostAnalysis hc = null;
        ArrayList list = new ArrayList();
        Collection col = null;
        try {
            col = casthome.findAll(CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
                castl = (CostAnalysisLocal) i.next();

                list.add(new HelpCostAnalysis(castl.getSno(), castl.getMaterials(), castl.getAmount(), castl.getItemCode(), castl.getDateAdded()));
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    public String setUpCost(helpSetCost parameter) {
        InventoryCostSetupLocal setupl = null;
        try {
            setupl = invensetup.create(parameter.getCostType());
            setupl.setStatus(parameter.getStatus());

        } catch (Exception ex) {
            throw new EJBException();

        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

    public String changeCostingMethod(helpSetCost costhelp) {
        InventoryCostSetupLocal setupl = null;
        Collection coll = null;
        ArrayList list = new ArrayList();
        try {
            //setupl = invensetup.create(parameter.getCostType());
            //setupl.setStatus(parameter.getStatus());
            //invensetup.findByPrimaryKey(costhelp.getCostType()).remove();
            coll = invensetup.findByCostType(costhelp.getCostType());
            if (coll.isEmpty() && costhelp.getCostType().equalsIgnoreCase("STANDARD COSTING")) {
                try {
                    setupl = invensetup.findByPrimaryKey("WEIGHTED AVERAGE COSTING");
                    setupl.setStatus(CONFIG.getUN_SET_COSTING());
                    // set current cost
                    setupl = invensetup.create(costhelp.getCostType());
                    setupl.setStatus(CONFIG.getSET_COSTING());
                } catch (Exception exx) {
                    //  System.out.println("catch am for here++++---STANDARD");
                    setupl = invensetup.create(costhelp.getCostType());
                    setupl.setStatus(CONFIG.getSET_COSTING());
                }

            }
            if (coll.isEmpty() && costhelp.getCostType().equalsIgnoreCase("WEIGHTED AVERAGE COSTING")) {
                try {
                    // undo previous cost status
                    setupl = invensetup.findByPrimaryKey("STANDARD COSTING");
                    setupl.setStatus(CONFIG.getUN_SET_COSTING());

                    // set new Cost
                    setupl = invensetup.create(costhelp.getCostType());
                    setupl.setStatus(CONFIG.getSET_COSTING());
                } catch (Exception ex) {
                    // set new Cost
                    //  System.out.println("catch am for here++++---WEIGHTED");
                    setupl = invensetup.create(costhelp.getCostType());
                    setupl.setStatus(CONFIG.getSET_COSTING());
                }
            }
            if (!coll.isEmpty() && costhelp.getCostType().equalsIgnoreCase("WEIGHTED AVERAGE COSTING")) {
                setupl = invensetup.findByPrimaryKey("STANDARD COSTING");
                setupl.setStatus(CONFIG.getUN_SET_COSTING());
                // set new Cost
                // System.out.println("catch am for here++++---oooooo");
                setupl = invensetup.findByPrimaryKey(costhelp.getCostType());
                setupl.setStatus(CONFIG.getSET_COSTING());

            }
            if (!coll.isEmpty() && costhelp.getCostType().equalsIgnoreCase("STANDARD COSTING")) {
                setupl = invensetup.findByPrimaryKey("WEIGHTED AVERAGE COSTING");
                setupl.setStatus(CONFIG.getUN_SET_COSTING());
                // set new Cost
                //  System.out.println("catch am for here++++---11111");
                setupl = invensetup.findByPrimaryKey(costhelp.getCostType());
                setupl.setStatus(CONFIG.getSET_COSTING());
            }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

    public ArrayList viewAllCostMethod() {
        InventoryCostSetupLocal setupl = null;
        Collection coll = null;
        helpSetCost hc = null;
        ArrayList list = new ArrayList();
        try {
            coll = invensetup.findAll();
            Iterator i = coll.iterator();
            while (i.hasNext()) {
                //helpSetCost
                setupl = (InventoryCostSetupLocal) i.next();
                list.add(new helpSetCost(setupl.getCostType(), setupl.getStatus()));
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    public helpSetCost viewSingleCostMethode(String id) {
        InventoryCostSetupLocal setupl = null;
        helpSetCost h = null;
        try {
            setupl = invensetup.findByPrimaryKey(id);

            h = (new helpSetCost(setupl.getCostType(), setupl.getStatus()));

        } catch (Exception ex) {
            throw new EJBException();
        }
        return h;
    }

    public String addWareHouse(helpwarehouse wh) {
        WarehouseLocal wl = null;
        //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 8);
        try {
            // System.out.println("warehouse session 1"+wh.getHouseName());
            wl = warehouse.create(wh.getHouseName().substring(0, 3) + "/" + pin1);
            //String whcode, String houseName, String dateCreated, String status, String address, String capacity, String bcode
            //String houseName, String dateCreated, String status, String address, String capacity, String bcode
             // System.out.println("warehouse session 2"+wh.getHouseName());
            wl.setHouseName(wh.getHouseName());
            wl.setDateCreated(wh.getDateCreated());
            wl.setStatus("OK");
            wl.setAddress(wh.getAddress());
            wl.setCapacity(wh.getCapacity());
            wl.setBcode(wh.getBcode());
         
            wl.setDel("1");
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }
    // modify warehouse

    public String modifyWarehouse(helpwarehouse wh) {
        WarehouseLocal wl = null;
        System.out.println("this is the sessinbean=====" + wh.getWhcode());
        try {
            wl = warehouse.findByPrimaryKey(wh.getWhcode());
            wl.setAddress(wh.getAddress());
            wl.setCapacity(wh.getCapacity());
            wl.setDateCreated(wh.getDateCreated());
            wl.setHouseName(wh.getHouseName());
            wl.setStatus("OK");
        } catch (Exception ex) {
            throw new EJBException();
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

    // View All warehouses warehouse
    public ArrayList viewAllWareHouses() {
        WarehouseLocal wl = null;
        Collection coll = null;
        ArrayList list = new ArrayList();
        helpwarehouse wh = null;
        try {
            coll = warehouse.findByAll("1");
            Iterator i = coll.iterator();
            while (i.hasNext()) {
                wl = (WarehouseLocal) i.next();
                list.add(new helpwarehouse(wl.getWhcode(), wl.getHouseName(), wl.getDateCreated(), wl.getStatus(), wl.getAddress(), wl.getCapacity(), wl.getBcode()));
                //String whcode, String houseName, String dateCreated, String status, String address, String capacity, String bcode
            }
        } catch (Exception ex) {
            throw new EJBException();
        }
        return list;
    }

    // view single warehouse
    public helpwarehouse viewSingleWarehouse(String id) {
        WarehouseLocal wl = null;
        helpwarehouse hwh = null;
        try {
            wl = warehouse.findByPrimaryKey(id);
            hwh = new helpwarehouse(wl.getWhcode(), wl.getHouseName(), wl.getDateCreated(), wl.getStatus(), wl.getAddress(), wl.getCapacity(), wl.getBcode());
        } catch (Exception ex) {
            throw new EJBException();
        }
        return hwh;
    }

    //remove warehouse
    public String removeWarehosue(String id) {
        WarehouseLocal wl = null;
        helpwarehouse hwh = null;
        try {
            wl = warehouse.findByPrimaryKey(id);
            wl.setDel("0");
            wl.setStatus("Inactive");
        } catch (Exception ex) {
            throw new EJBException();
        }
        return null;
    }

    //add stock inventroy edition
    public String addStockInventoryEdition(StockEdtion sed) {
        StockInventoryEditionsLocal editn = null;
        Collection col = null;
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 4);
        try {
            String m = (sed.getEditionName().substring(0, 4) + "/" + "ED");
            col = sielhome.findById(m);
            
            if(col.isEmpty()){
                
            editn = sielhome.create(m);
            editn.setEditionName(sed.getEditionName());
            editn.setEditionStatus("CURRENT");

            }
             

        } catch (Exception ex) {
            throw new EJBException("Already Exist");
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

    public String modifyEdition(StockEdtion ed) {
        StockInventoryEditionsLocal editn = null;
        try {
            editn = sielhome.findByPrimaryKey(ed.getId());
            editn.setEditionName(ed.getEditionName());
            editn.setEditionStatus(ed.getEditionStatus());
        } catch (Exception ex) {
            throw new EJBException("Already Exist");
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }
     public String modifyEdition1(StockEdtion ed) {
        StockInventoryEditionsLocal editn = null;
        try {
            editn = sielhome.findByPrimaryKey(ed.getId());
           // editn.setEditionName(ed.getEditionName());
            editn.setEditionStatus("0S");
        } catch (Exception ex) {
            throw new EJBException("Already Exist");
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

// view single edition
   public StockEdtion viewSingleEdition(String code) {
       StockInventoryEditionsLocal editn = null;
       StockEdtion se = null;
       
       try{
           
           editn = sielhome.findByPrimaryKey(code);

           se = new StockEdtion(editn.getId(), editn.getEditionName(), editn.getEditionStatus());
        }catch(Exception ex){
       System.out.println("error due to:" +ex.getMessage());
       }
        return se;
    }
   // View All editions
    public ArrayList viewAllEditions() {
       StockInventoryEditionsLocal editn = null;
       Collection coll = null;
       ArrayList list = new ArrayList();
       StockEdtion se = null;
        try {
            coll = sielhome.findByAll();
            Iterator i = coll.iterator();
            while (i.hasNext()) {
                editn = (StockInventoryEditionsLocal) i.next();
                list.add(new StockEdtion(editn.getId(), editn.getEditionName(), editn.getEditionStatus()));
        }
        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }
        return list;
    }


    //remove warehouse
    public String removeEdition(String code) {
        StockInventoryEditionsLocal editn = null;
        Collection col = null;
        try {
        editn = sielhome.findByPrimaryKey(code);
        col = sielhome.findById(code);
        if(!col.isEmpty()){
            sielhome.remove(code);
        }
    
           
        } catch (Exception ex) {
            throw new EJBException();
        }
        return null;
    }

 
    public String makeStockTransfer(helpStockTransfer hep) {
        StocktransferLocal tlocal = null;
        Integer n = stocktransfer.Max();
        try{
        tlocal = stocktransfer.create(new Auto().getNext(n));
        tlocal.setDatetransferred(hep.getDatetransferred());
        tlocal.setDestination(hep.getDestination());
        tlocal.setFromwarehouse(hep.getFromwarehouse());
        tlocal.setItemcode(hep.getItemcode());
        tlocal.setItemname(hep.getItemname());
        tlocal.setQuantity(hep.getQuantity());
        tlocal.setStatus("Pending");
        tlocal.setMakeorbuy(hep.getMakeorbuy());
        tlocal.setCategory(hep.getCategory());
       // tlocal.se
        }catch(Exception ex){
        throw new EJBException("Already Exist" +ex.getMessage());
        }
        return CONST.ADD_PRODUCTION_SUCCESS;
    }

    // view all Stock Transfers
    public ArrayList viewAllStockTransfers(String warehouse) {
        Collection col = null;
        ArrayList list = new ArrayList();
         StocktransferLocal tlocal = null;
        try{
         col = stocktransfer.findByDestinationAndStatus(warehouse, "Pending");
         Iterator i = col.iterator();
         while(i.hasNext()){
         tlocal = (StocktransferLocal) i.next();
         list.add(new helpStockTransfer(tlocal.getSno(), tlocal.getItemcode(), tlocal.getItemname(), tlocal.getQuantity(), tlocal.getStatus(), tlocal.getFromwarehouse(), tlocal.getDestination(), tlocal.getBarcode(), tlocal.getDatetransferred(), tlocal.getMakeorbuy(), tlocal.getCategory()));
         //Integer sno, String itemcode, String itemname, int quantity, String status, String fromwarehouse, String destination, String barcode
         }
        }catch(Exception ex){
        throw new EJBException();
        }
        return list;
    }
      // view all Stock Transfers
    public ArrayList viewAllStockTransfersByDateAndWarehouse(String datetransferred, String warehouse) {
        Collection col = null;
        ArrayList list = new ArrayList();
        StocktransferLocal tlocal = null;
        try{
         col = stocktransfer.findByDateAndWhcode(datetransferred, warehouse);
         Iterator i = col.iterator();
         while(i.hasNext()){
         tlocal = (StocktransferLocal) i.next();
         list.add(new helpStockTransfer(tlocal.getSno(), tlocal.getItemcode(), tlocal.getItemname(), tlocal.getQuantity(), tlocal.getStatus(), tlocal.getFromwarehouse(), tlocal.getDestination(), tlocal.getBarcode(), tlocal.getDatetransferred(), tlocal.getMakeorbuy(), tlocal.getCategory()));
         //Integer sno, String itemcode, String itemname, int quantity, String status, String fromwarehouse, String destination, String barcode
         }
        }catch(Exception ex){
        throw new EJBException();
        }
        return list;
    }

    //

    public helpStockTransfer viewSingleStockTransfer(Integer id) {
         StocktransferLocal tlocal = null;
         helpStockTransfer hh = null;
        try{
            
            tlocal = stocktransfer.findByPrimaryKey(id);

          hh = new helpStockTransfer(tlocal.getSno(), tlocal.getItemcode(), tlocal.getItemname(), tlocal.getQuantity(), tlocal.getStatus(), tlocal.getFromwarehouse(), tlocal.getDestination(), tlocal.getBarcode(), tlocal.getDatetransferred(), tlocal.getMakeorbuy(),tlocal.getCategory());

        }catch(Exception ex){
        throw new EJBException(ex.getMessage());
        }
        return hh;
    }

    public String receiveStock(HelpStock pr) {
        StocktransferLocal tlocal = null;
        StockLocal sl = null;
        StockhistoryLocal shl = null;
        Collection col = null;
        String coder = "";
        String cattr = "";
        
        //line below generates random numbers to severve as default serial numbers for the invoice
       Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 5);
       // System.out.println("this is my world===" + "AND " + pr.getCommodityId());
        try {
             cattr = (pr.getCategory().substring(0, 3).toUpperCase() + "/" + "CAT");
          //  if(){
             coder = (pr.getCategory().substring(0, 3).toUpperCase() + "/" + pr.getCommodityId().substring(0, 3).toUpperCase() + "/" + pin1 + "/" + "STK");

            //sl = stock.findByPrimaryKey(pr.getSno());
            //sl = stock.findBysnAncommodityId(pr.getSno(), pr.getCommodityId());
           // col = stock.findBySnoAndcommodityId(pr.getSno(), pr.getCommodityId());
             
            col = stock.findByCommodityIdAndWarehouse(pr.getCommodityId(), pr.getWhousecode());
            if (col.isEmpty()) {
              //  System.out.println("collection11-------" + col.size());
             // Integer n = stock.Max();
                sl = stock.create(pr.getCommodityId());
               // sl.setCommodityId(coder);
                sl.setQuantityIn(pr.getQuantityIn());
              //sl.setQuantityLeft(pr.getQuantityIn());
                sl.setReceivedDate(pr.getReceivedDate());
                sl.setReceivedBy(pr.getReceivedBy());
                sl.setUnitprice(pr.getUnitprice());
                sl.setUnitcode(pr.getUnitcode());
               // sl.setCommodityName(pr.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(pr.getCompactments());
                sl.setWhcode(pr.getWhousecode());
                sl.setBarcode(pr.getBarcode());
                sl.setCategory(pr.getCategory());

                tlocal = stocktransfer.findByPrimaryKey(pr.getSno());

                tlocal.setStatus("Received");

                // sl.setMakeOrBuy(CONFIG.);
            } else {
                Integer nn = stockhist.Max();
                sl = stock.findByPrimaryKey(pr.getCommodityId());
                // sl.setCommodityId(pr.getCommodityName());
                sl.setQuantityIn(pr.getQuantityIn());
                sl.setUnitprice(new Float(sl.getUnitprice().floatValue() + pr.getUnitprice().floatValue()));

                shl = stockhist.create(new Auto().getNext(nn));
                //System.out.println("this is my world===" + "AND " + pr.getCommodityId() + "AND" + pr.getStatus());
                shl.setCommodityId(pr.getCommodityName());
                shl.setQuantityIn(pr.getQuantityIn());
                shl.setQuantityLeft(new Integer(0));
                shl.setReceivedDate(pr.getReceivedDate());
                shl.setReceivedBy(pr.getReceivedBy());
                shl.setUnitprice(pr.getUnitprice());
                shl.setUnitcode(pr.getUnitcode());
                shl.setCommodityName(pr.getCommodityName());
                shl.setDel(CONFIG.getACIVATIVE_STOCK());
                shl.setCompartments(pr.getCompactments());
                shl.setStatus("Modify");
                shl.setWhcode(pr.getWhousecode());
            }
        } catch (Exception ex) {
            //throw new EJBException(CONST.ADD_STOCK_ERROR);
        }
        return CONST.ADD_STOCK;
    }

   public String deductQuantityInPro2(Integer id, Integer Qsub) {
         StocktransferLocal tlocal = null;
         helpStockTransfer hh = null;
        try {
            tlocal = stocktransfer.findByPrimaryKey(id);
            tlocal.setQuantity(Qsub);

        } catch (Exception ex) {
            throw new EJBException("ERROR IN deductQuantityInPro:" + ex.getMessage());
        }
        return null;
    }

    public Integer computeStockTransfer(Integer quantityin, Integer quantityout, String wchode, String commodityid) {
         StocktransferLocal tlocal = null;
         helpStockTransfer hh = null;
         StockLocal sl = null;
         StockhistoryLocal shl = null;
         int sub = 0;
        // System.out.println("quantity in" +quantityin);
         //System.out.println("quantity out" +quantityout);
        try{
     
           sl = stock.findBycommodityIdAndWarehouse(commodityid, wchode);
           sub = quantityin.intValue() - quantityout.intValue();
           sl.setQuantityIn(new Integer(sub));
        }catch(Exception ex){
        throw new EJBException();
        }
        return new Integer(sub);
    }

    // add Branch
    public String addBranch(HelpBranch hb) {
        BranchLocal blocal = null;
          //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 4);
        try{
            blocal = branch.create(hb.getBranchName().substring(0, 3) + "/" + pin1);
            blocal.setBranchAddress(hb.getBranchAddress());
            blocal.setBranchName(hb.getBranchName());
            blocal.setDateCreated(hb.getDateCreated());
            blocal.setBranchStatus("OK");
            blocal.setDel("1");
        }catch(Exception ex){
        throw new EJBException();
        }
        return CONST.ADD_STOCK;
    }

    public ArrayList viewAllBranch() {
        Collection col = null;
        ArrayList list = new ArrayList();
        BranchLocal blocal = null;
        try{
            col = branch.findByAll("1");
            Iterator i = col.iterator();
            while(i.hasNext()){
            blocal = (BranchLocal) i.next();
            list.add(new HelpBranch(blocal.getBranchCode(), blocal.getBranchName(), blocal.getBranchAddress(), blocal.getDateCreated(), blocal.getBranchStatus()));
              //String branchCode, String branchName, String branchAddress, String dateCreated, String branchStatus
            }
        }catch(Exception ex){
        throw new EJBException();
        }
        return list;
    }

    public String addCategory(HelpCategory hc) {
        CategoryLocal catl =null;
        Collection col = null;
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
        String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 2);
        String ss ="";
        String cat = "";
        try{
          //  ss = hc.getStockItemType().substring(0, 3);
           // cat = catl.getCategorycode();
            //try{
       // col = category.findByCategorycode(hc.getStockItemType());
          //  } catch (FinderException fe) {
           // throw new EJBException("Already Exist!"+ fe.getMessage());
           // }
           //System.out.println("this is my point of enfa+++ "+col.size());
            
          //if(col.isEmpty()){
          //if(ss !=null ){
            catl = category.create(pin1);
            catl.setCategorydescription(hc.getCategorydescription());
            catl.setStockItemType(hc.getStockItemType());
            catl.setStatus(hc.getStatus());
            catl.setDel(CONFIG.getUN_SET_DELETE());
           //}
          //}
            }catch(CreateException ce){
          throw new EJBException("Already Exist!");
        }
        return CONST.ADD_STOCK;
    }

    public String removeCategory(String id) {
        CategoryLocal catl =null;
        try{
            catl= category.findByPrimaryKey(id);
            catl.setDel(CONFIG.getSET_DELETE());
            }catch(Exception ex){
        throw new EJBException();
        }
        return CONST.ADD_STOCK;
    }

    public ArrayList viewAllCategory() {
        Collection col = null;
        ArrayList list = new ArrayList();
        CategoryLocal catl =null;
        try{
              col= category.findByAll(CONFIG.getUN_SET_DELETE());
              Iterator i = col.iterator();
              while(i.hasNext()){
                   catl =(CategoryLocal) i.next();
                   list.add(new HelpCategory(catl.getCategorycode(), catl.getStockItemType(), catl.getCategorydescription(), catl.getStatus()));
                   //String categorycode, String categoryname, String categorydescription, String status
          }
        }catch(Exception ex){
        throw new EJBException();
        }
        return list;
    }

    public String modifyCategory(HelpCategory ca) {
            //Collection col = null;
        //ArrayList list = new ArrayList();
        CategoryLocal catl =null;
        try{
        catl = category.findByPrimaryKey(ca.getCategorycode());
        catl.setCategorydescription(ca.getCategorydescription());
        catl.setStockItemType(ca.getStockItemType());
        }catch(Exception ex){
        throw new EJBException();
        }
        return CONST.ADD_STOCK;
    }

    public HelpCategory viewSingleCategory(String id) {
         CategoryLocal catl =null;
         HelpCategory hc = null;

        try{
            catl = category.findByPrimaryKey(id);

              hc = new HelpCategory(catl.getCategorycode(), catl.getStockItemType(), catl.getCategorydescription(), catl.getStatus());

        }catch(Exception ex){
         throw new EJBException();
        }
        return hc;
    }
    
public ArrayList viewItemsByCategory2(String cate) {
        Collection col = null;
        ArrayList list = new ArrayList();
          CategoryLocal catl =null;
         HelpCategory hc = null;
        try {
          //  System.out.println("String commodityName ="+commodityName + "====" + whcode);
            col = category.findBystockItemTypeAndDel("%" +cate + "%", CONFIG.getUN_SET_DELETE());
            Iterator i = col.iterator();
            while (i.hasNext()) {
               catl =(CategoryLocal) i.next();
                   list.add(new HelpCategory(catl.getCategorycode(), catl.getStockItemType(), catl.getCategorydescription(), catl.getStatus()));
         //String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del
         //Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, String unit, Float unitprice, String commodityName String receivedBy, Float unitprice, String commodityName, String unitcode
            }
        } catch (Exception ex) {
     throw new EJBException(ex.getMessage());
        }
        return list;
    }


// inventory Costing

  public String addInventoryCost(HelpInventoryCost hic) {
        InventoryCostLocal  inventsost = null;
        int sum = 0;
        StockLocal sl = null;
        Collection col = null;
        
      try{
          col = inventhome.findByItemCode(hic.getItemCode());
          
          if(col.isEmpty()){
          //Integer n = inventhome.Max();
          inventsost = inventhome.create(hic.getItemCode());
         // inventsost.setItemCode(hic.getItemCode());
          //inventsost.setActualCost(hic.getActualCost());
          inventsost.setDateCreated(hic.getDateCreated());
          inventsost.setDel(CONFIG.getUN_SET_DELETE());
          //inventsost.setExchangeRate(hic.getExchangeRate());
         // inventsost.setExpenses(hic.getExpenses());
         // inventsost.setFreight(hic.getFreight());
         inventsost.setLabourCost(hic.getLabourCost());
          inventsost.setMaterialCost(hic.getMaterialCost());
         inventsost.setOverheadCost(hic.getOverheadCost());
         sum += new Integer(hic.getLabourCost().intValue()).intValue() + new Integer(hic.getMaterialCost().intValue()).intValue() + new Integer(hic.getOverheadCost().intValue()).intValue();

         inventsost.setActualCost(new Float(sum));

         sl = stock.findByPrimaryKey(hic.getItemCode());
         
         sl.setUnitprice(new Float(sum));

         // + hic.getMaterialCost().intValue() + hic.getOverheadCost().intValue()
         //inventsost.setPurchesCost(hic.getPurchesCost());
//inventhome
          }
          else{
             inventsost = inventhome.findByPrimaryKey(hic.getItemCode());

               inventsost.setDateCreated(hic.getDateCreated());
          inventsost.setDel(CONFIG.getUN_SET_DELETE());
          //inventsost.setExchangeRate(hic.getExchangeRate());
         // inventsost.setExpenses(hic.getExpenses());
         // inventsost.setFreight(hic.getFreight());
         inventsost.setLabourCost(hic.getLabourCost());
          inventsost.setMaterialCost(hic.getMaterialCost());
         inventsost.setOverheadCost(hic.getOverheadCost());
         sum += new Integer(hic.getLabourCost().intValue()).intValue() + new Integer(hic.getMaterialCost().intValue()).intValue() + new Integer(hic.getOverheadCost().intValue()).intValue();

         inventsost.setActualCost(new Float(sum));

         sl = stock.findByPrimaryKey(hic.getItemCode());

         sl.setUnitprice(new Float(sum));



          }
      }catch(Exception ex){
     throw new EJBException(ex.getMessage());

      }
        return CONST.ADD_STOCK;
    }
  public String modifyInventoryCost(HelpInventoryCost hic) {
        InventoryCostLocal inventsost = null;
        int sum = 0;
        StockLocal sl = null;
      try{
          inventsost = inventhome.findByPrimaryKey(hic.getItemCode());
          //inventsost.setActualCost(hic.getActualCost());
          inventsost.setDateCreated(hic.getDateCreated());
          inventsost.setDel(CONFIG.getUN_SET_DELETE());
          //inventsost.setExchangeRate(hic.getExchangeRate());
         // inventsost.setExpenses(hic.getExpenses());
         // inventsost.setFreight(hic.getFreight());
         inventsost.setLabourCost(hic.getLabourCost());
          inventsost.setMaterialCost(hic.getMaterialCost());
         inventsost.setOverheadCost(hic.getOverheadCost());
         sum += new Integer(hic.getLabourCost().intValue()).intValue() + new Integer(hic.getMaterialCost().intValue()).intValue() + new Integer(hic.getOverheadCost().intValue()).intValue();

         inventsost.setActualCost(new Float(sum));

         sl = stock.findByPrimaryKey(hic.getItemCode());

         sl.setUnitprice(new Float(sum));

         // + hic.getMaterialCost().intValue() + hic.getOverheadCost().intValue()
         //inventsost.setPurchesCost(hic.getPurchesCost());
//inventhome
      }catch(Exception ex){
     throw new EJBException(ex.getMessage());

      }
        return CONST.ADD_STOCK;
    }
   public String addInventoryCost2(HelpInventoryCost hic) {
        InventoryCostLocal  inventsost = null;
        Collection col = null;
        int sum = 0;
          StockLocal sl = null;
      try{
      // System.out.println("na me be dis oooo"+hic.getItemCode());
           col = inventhome.findByItemCode(hic.getItemCode());

          if(col.isEmpty()){
          inventsost = inventhome.create(hic.getItemCode());
          // inventsost.setActualCost(hic.getActualCost());
          inventsost.setDateCreated(hic.getDateCreated());
          inventsost.setDel(CONFIG.getUN_SET_DELETE());
          inventsost.setExchangeRate(hic.getExchangeRate());
          inventsost.setExpenses(hic.getExpenses());
          inventsost.setFreight(hic.getFreight());
         // inventsost.setLabourCost(hic.getLabourCost());
          //inventsost.setMaterialCost(hic.getMaterialCost());
         // inventsost.setOverheadCost(hic.getOverheadCost());
          inventsost.setPurchesCost(hic.getPurchesCost());
         sum += new Integer(hic.getPurchesCost().intValue()).intValue() + new Integer(hic.getExpenses().intValue()).intValue() + new Integer(hic.getFreight().intValue()).intValue() + new Integer(hic.getExchangeRate().intValue()).intValue();

         inventsost.setActualCost(new Float(sum));

         sl = stock.findByPrimaryKey(hic.getItemCode());

         sl.setUnitprice(new Float(sum));

//inventhome
          }
         
      }catch(Exception ex){
     throw new EJBException("na sooooooooo"+ex.getMessage());

      }
        return CONST.ADD_STOCK;
    }

   
  public String modifyInventoryCost2(HelpInventoryCost hic) {
        InventoryCostLocal  inventsost = null;

      try{
          inventsost = inventhome.findByPrimaryKey(hic.getItemCode());
          inventsost.setActualCost(hic.getActualCost());
          inventsost.setDateCreated(hic.getDateCreated());
          inventsost.setDel(CONFIG.getUN_SET_DELETE());
          inventsost.setExchangeRate(hic.getExchangeRate());
          inventsost.setExpenses(hic.getExpenses());
          inventsost.setFreight(hic.getFreight());
         // inventsost.setLabourCost(hic.getLabourCost());
         // inventsost.setMaterialCost(hic.getMaterialCost());
          //inventsost.setOverheadCost(hic.getOverheadCost());
          inventsost.setPurchesCost(hic.getPurchesCost());
        //inventhome
      }catch(Exception ex){
          
     throw new EJBException(ex.getMessage());

      }
        return CONST.ADD_STOCK;
    }

    public HelpInventoryCost viewSingleInventoryCost(String id) {
            InventoryCostLocal  inventsost = null;
            HelpInventoryCost hic = null;
        try{
            
            inventsost = inventhome.findByPrimaryKey(id);

            hic = new HelpInventoryCost(inventsost.getItemCode(), inventsost.getMaterialCost(), inventsost.getLabourCost(), inventsost.getOverheadCost(), inventsost.getActualCost(), inventsost.getDateCreated(), inventsost.getExpenses(), inventsost.getPurchesCost(), inventsost.getExchangeRate(), inventsost.getFreight());
//String itemCode, Float materialCost, Float labourCost, Float overheadCost,Float actualCost,String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight
        }catch(Exception ex){
        throw new EJBException(ex.getMessage());
        }
        return hic;
    }

 // warehouse = lookupWarehouseBean();WarehouseLocalHome warehouse  StockInventoryEditionsLocalHome sielhome CategoryLocalHome category = null;
    //vStocktransferLocalHome stocktransfer = null;
    // Add business logic below. (Right-click in editor and choose
// "Insert Code > Add Business Method" or "Web Service > Add Operation")

    
    // method for viewing states in a country

    public StateHelper viewState(String state1) {
        StateoforiginLocal sl = null;
        ArrayList list = new ArrayList();
        StateHelper stat= null;
        try {
            //TabsLocal tabslocal = tlh.findByPrimaryKey(menuID);
            sl = stateoforigin.findByPrimaryKey(state1);
            stat = new StateHelper(sl.getCode(), sl.getState(), sl.getCountry());

        } catch (Exception ex) {
            throw new EJBException(ex.getMessage());
        }

        return stat;
    }
    // method for viewing local governments in a state

public LGAHelper viewLga(String lgae) {
        LgaLocal ll = null;
        LGAHelper lg = null;
        try {
            //TabsLocal tabslocal = tlh.findByPrimaryKey(menuID);
         ll = lga.findByPrimaryKey(lgae);
         lg = new LGAHelper(ll.getCode(), ll.getLga(), ll.getState());
        } catch (Exception ex) {
          throw new EJBException(ex.getMessage());
        }
        return lg;
    }

  public boolean upLoadStocks(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, String unit, Float unitprice, String unitcode, String compartments, String whousecode, String MakeOrBuy,String category, String batchcode, String authorization) {
        StockLocal sl = null;
        StockhistoryLocal shl = null;
        ItemsLocal it = null;
        String code = "";
        String catt = "";
        Collection col = null;
        boolean ok = false;

        //Integer menuId = null;
       //System.out.println("lets see the  commodityId here nowxcccccccccccc ==="+commodityId);
         //line below generates random numbers to severve as default serial numbers for the invoice
        Random rand = new Random();
        String msg = "";
        //float hi = 0.0F;
        int ser1 = rand.nextInt() % 100000000;
        int ser2 = rand.nextInt() % 100000000;
        if (ser1 < 0) {
            ser1 = ser1 / (-1);
        }
        if (ser2 < 0) {
            ser2 = ser2 / (-1);
        }
        // line ensures that the serial number so generated is not greater than 12
           String pin1 = (Integer.toString(ser1) + Integer.toString(ser2)).substring(0, 5);
        try{

            //java.util.Date ds = new Date();
            //java.text.SimpleDateFormat sdf = java.util.Formatter("dd/mm/yy mm:ss:mm");
            catt = (category.substring(0, 3).toUpperCase() + "/" + "CAT");
          //  if(){
            code = (category.substring(0, 3).toUpperCase() + "/" + commodityId.substring(0, 1).toUpperCase() + "/" + pin1 + "/" + "STK");
               // System.out.println("lets see the  code here nowyyyyyyyyyyy ==="+code);
            try{

               // Integer fn = stock.Max();
            it = items.findByPrimaryKey(code);
            col = items.findByItemname(it.getItemname());
            if(col.isEmpty()){

                // add item code in the table
               // it = items.create(code);
               it = items.create(code);
               it.setCategory(catt);
               it.setDateadded(receivedDate);
               it.setDel(CONFIG.getACIVATIVE_STOCK());
               it.setMakeorbuy(MakeOrBuy);
               it.setItemname(commodityId);

               
               // moving into stock table
                try { sl = stock.findBycommodityIdAndWarehouse(sl.getCommodityId(), whousecode);}catch(Exception e){System.out.println();}
            if (sl == null){
                 System.out.println("sl is null so ok");
            try {
                
                sl = stock.create(code);
                //sl.setCommodityId(code);
                sl.setQuantityIn(quantityIn);
                sl.setQuantityLeft(new Integer(0));
                sl.setReceivedDate(receivedDate);
                sl.setReceivedBy(receivedBy);
                sl.setUnitprice(unitprice);
                sl.setUnitcode(unitcode);
              // sl.setCommodityName(comm.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(compartments);
                sl.setWhcode(whousecode);
                //sl.setBarcode(barcode);
                sl.setMakeOrBuy(MakeOrBuy);
                sl.setCategory(catt);
               // sl.setBatchcode(batchcode);

                // stock history
            try{
                  Integer nk= stockhist.Max();
            //tabsl = tlh.findToCheck(menuName, role, schCode);
            shl = stockhist.create(new Auto().getNext(nk));
             shl.setCommodityId(code);
            shl.setQuantityIn(quantityIn);
            shl.setQuantityLeft(new Integer(0));
            shl.setReceivedDate(receivedDate);
            shl.setReceivedBy(receivedBy);
            shl.setUnitprice(unitprice);
            shl.setUnitcode(unitcode);
           // shl.setCommodityName(pr.getCommodityName());
            shl.setDel(CONFIG.getUN_SET_DELETE());
            shl.setCompartments(compartments);
            shl.setStatus("1");
            shl.setWhcode(whousecode);
            shl.setMakeorbuy(MakeOrBuy);
            shl.setCategory(catt);
            } catch (Exception efe) { System.out.println("na watin de happen for stock history"+efe.getMessage());}
            } catch (Exception ee) { ee.getLocalizedMessage();}
        }
            else{
              try{

                sl = stock.findBycommodityIdAndWarehouse(code, whousecode);}catch(Exception ex){System.out.println();}
          if(sl !=null){
                sl.setCommodityId(code);
                sl.setQuantityIn(quantityIn);
                sl.setQuantityLeft(new Integer(0));
                sl.setReceivedDate(receivedDate);
                sl.setReceivedBy(receivedBy);
                sl.setUnitprice(new Float(0.0));
                sl.setUnitcode(unitcode);
              //  sl.setCommodityName(comm.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(compartments);
                sl.setWhcode(whousecode);
               // sl.setBarcode(barcode);
                sl.setMakeOrBuy(MakeOrBuy);
                sl.setCategory(catt);
               // sl.setBatchcode(batchcode);

                // stock history
                try{

            Integer n = stockhist.Max();

            //tabsl = tlh.findToCheck(menuName, role, schCode);
            shl = stockhist.create(new Auto().getNext(n));
            shl.setCommodityId(commodityId);
            shl.setQuantityIn(quantityIn);
            shl.setQuantityLeft(new Integer(0));
            shl.setReceivedDate(receivedDate);
            shl.setReceivedBy(receivedBy);
            shl.setUnitprice(unitprice);
            shl.setUnitcode(unitcode);
           // shl.setCommodityName(pr.getCommodityName());
            shl.setDel(CONFIG.getUN_SET_DELETE());
            shl.setCompartments(compartments);
            shl.setStatus("Modify");
            shl.setWhcode(whousecode);
            shl.setMakeorbuy(MakeOrBuy);
            shl.setCategory(catt);
            }catch(Exception ex){System.out.println();}
            ok = true;
          }
          }
          }
                     
            }catch(Exception fe){


                // add item code in the table
               // it = items.create(code);
               it = items.create(code);
               it.setCategory(catt);
               it.setDateadded(receivedDate);
               it.setDel(CONFIG.getACIVATIVE_STOCK());
               it.setMakeorbuy(MakeOrBuy);
               it.setItemname(commodityId);


               // moving into stock table
                try { sl = stock.findBycommodityIdAndWarehouse(code, whousecode);}catch(Exception e){System.out.println();}
            if (sl == null){
                 //System.out.println("sl is null so ok");
            try {
             //   Integer n = stock.Max();
                sl = stock.create(code);
               // sl.setCommodityId(code);
                sl.setQuantityIn(quantityIn);
                sl.setQuantityLeft(new Integer(0));
                sl.setReceivedDate(receivedDate);
                sl.setReceivedBy(receivedBy);
                sl.setUnitprice(unitprice);
                sl.setUnitcode(unitcode);
              // sl.setCommodityName(comm.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(compartments);
                sl.setWhcode(whousecode);
                //sl.setBarcode(barcode);
                sl.setMakeOrBuy(MakeOrBuy);
                sl.setCategory(catt);
                //sl.setBatchcode(batchcode);

                // stock history
            try{
                  Integer nkk = stockhist.Max();
            //tabsl = tlh.findToCheck(menuName, role, schCode);
            shl = stockhist.create(new Auto().getNext(nkk));
             shl.setCommodityId(it.getItemcode());
            shl.setQuantityIn(quantityIn);
            shl.setQuantityLeft(new Integer(0));
            shl.setReceivedDate(receivedDate);
            shl.setReceivedBy(receivedBy);
            shl.setUnitprice(unitprice);
            shl.setUnitcode(unitcode);
           // shl.setCommodityName(pr.getCommodityName());
            shl.setDel(CONFIG.getUN_SET_DELETE());
            shl.setCompartments(compartments);
            shl.setStatus("1");
            shl.setWhcode(whousecode);
            shl.setMakeorbuy(MakeOrBuy);
            shl.setCategory(catt);
            } catch (Exception efe) { System.out.println("na watin de happen for stock history"+efe.getMessage());}
            } catch (Exception ee) { ee.getLocalizedMessage();}
        }
            else{
              try{

                sl = stock.findBycommodityIdAndWarehouse(code, whousecode);}catch(Exception ex){System.out.println();}
          if(sl !=null){
                sl.setQuantityIn(quantityIn);
                sl.setQuantityLeft(new Integer(0));
                sl.setReceivedDate(receivedDate);
                sl.setReceivedBy(receivedBy);
                sl.setUnitprice(unitprice);
                sl.setUnitcode(unitcode);
              //  sl.setCommodityName(comm.getCommodityName());
                sl.setDel(CONFIG.getACIVATIVE_STOCK());
                sl.setCompartments(compartments);
                sl.setWhcode(whousecode);
               // sl.setBarcode(barcode);
                sl.setMakeOrBuy(MakeOrBuy);
                sl.setCategory(catt);
               // sl.setBatchcode(batchcode);

                // stock history
                try{

            Integer n = stockhist.Max();

            //tabsl = tlh.findToCheck(menuName, role, schCode);
            shl = stockhist.create(new Auto().getNext(n));
            shl.setCommodityId(commodityId);
            shl.setQuantityIn(quantityIn);
            shl.setQuantityLeft(new Integer(0));
            shl.setReceivedDate(receivedDate);
            shl.setReceivedBy(receivedBy);
            shl.setUnitprice(new Float(0.0));
            shl.setUnitcode(unitcode);
           // shl.setCommodityName(pr.getCommodityName());
            shl.setDel(CONFIG.getUN_SET_DELETE());
            shl.setCompartments(compartments);
            shl.setStatus("Modify");
            shl.setWhcode(whousecode);
            shl.setMakeorbuy(MakeOrBuy);
            shl.setCategory(catt);
            }catch(Exception ex){System.out.println();}
            ok = true;
          }
            }
             }
    
            }catch(Exception ex){throw new EJBException(ex.getMessage());}
            //    System.out.println("from ==="+whousecode);
                
         return ok;
   }
    public void viewSingleItems(String code) {
    }


}
