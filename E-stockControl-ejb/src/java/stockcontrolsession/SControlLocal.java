/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stockcontrolsession;

import java.io.InputStream;
import java.util.ArrayList;
import javax.ejb.EJBLocalObject;
import stockcontrolhelper.*;

/**
 *
 * @author Terseer
 */
public interface SControlLocal extends EJBLocalObject {

    String createUser(helplogin parameter);

    ArrayList viewByState(String state);

    ArrayList viewByCountry(String country);

    NationalityHelper viewNations(String code);

    ArrayList viewAllNations();

    String addStaff(staffHelper sh);

    String userlogin(helplogin user);

    helplogin viewSingleUser(String regNo);

    String authenticatePassword(String password, String regNo);

    String addProduction(HelpProduction hlp);

    String modifyProduction(HelpProduction pro);

    String addMaterial(HelpMaterials hlm);

    staffHelper viewSingleStaff(String username);

    String modifyMaterials(HelpMaterials mm);

    ArrayList viewAllMaterials();

    HelpMaterials viewSingleMaterial(Integer m);

    HelpMaterials viewSingleMaterialByMateriaName(String materialName);

    ArrayList viewMateriaByName(String materiaName);

    ArrayList viewCommodityByType(String commodityType);

    ArrayList viewAllProduction();

    HelpProduction viewSingleProduction(String id);

    String addStock(HelpStock parameter);

    String addUnits(helpUits hu);

    helpUits viewSingleUnit(Integer id, String whcode);

    String modifyUnits(helpUits hu);

    ArrayList viewUnitsByCategory(String unit, String whcode);

    ArrayList viewAllStaff();

    String modifyStaffRecords(staffHelper sh);

    ArrayList viewStaffByCategory(String name);

    String addRoles(HelpRole hr);

    ArrayList viewAllUnits(String whcode);

    HelpRole viewSingleRole(String hr);

    String modifyRoles(HelpRole rol);

    ArrayList viewAllRoles();

    ArrayList viewAllStocks(String whcode);

    ArrayList viewStoreByCategory(String commodityName,String whcode);

    HelpStock viewSingleCommodity(String Id, String whcode);

    String modifyStock(HelpStock hs);

    //String makeSupply(HelpSupply sp);

    String modifySupply(HelpSupply spp);
    
    String modifySupply1(HelpSupply spp);

    ArrayList viewAllSupplies(String whcode);

    ArrayList viewSupplyByCategory(String commodityId, String whcode);

    HelpSupply viewSingleSupply(Integer suup);

    byte[] imageResizer(InputStream pic, int width, int height) throws Exception;

    String UploadStaffPic(String applicantNo, byte[] pic);

    String modifyStockForSupply(HelpStock hs);

    HelpDb viewDataBase(Integer sno);

    String addDatabase(HelpDb dbhe);

    String addRequest(HelpRequisition hpr);

    String modifyRequest(HelpRequisition hpr);

    HelpRequisition viewSingleRequisition(Integer hre);

    ArrayList viewAllRequest(String reqcode);

   
    String modifyLimits(HelpLimit hhl);

    ArrayList viewAllLimits(String whcode);

    HelpLimit viewSingleLimit(String id, String whcode);

    String addLimit(HelpLimit hii);

    HelpLimit viewCommodityLimit(String CommodityId, String whcode);

    boolean findMinimum(Integer greater, String less);

    String removeProduction(Integer id);

    String removeMaterial(Integer id);

    String removeStaff(String id);

    String removeRoles(String id);

    String removeStock(String id);

    String addCommodity(Helpcommodity gs);

    ArrayList viewAllCommodities();

    String removeCommodity(String id);

    String addSections(HelpSection se);

    String removeSeciton(Integer name);

    ArrayList viewAllSections(String whcode);

    String modifySections(HelpSection names);

    HelpSection viewSingleSection(Integer name);

    //ArrayList viewAllCommodities();

    HelpSection computeSection(String name, String wchode);

    Helpcommodity viewSingleCommodity2(String id);

    String deductQuantityInPro(String id, Integer Qsub);

    String addStockHistory(HelpStock pr);

    String ProductionHistory(HelpProduction hlp);

    String addCostAnalysis(HelpCostAnalysis hcos);

    String modifyCostAnalysis(HelpCostAnalysis hccs);

    String removeCostAnalysis(Integer sno);

    HelpCostAnalysis viewSingleCostAnnalysis(Integer sno);

    ArrayList viewAllCostAnalysis();

    String setUpCost(helpSetCost parameter);

    String changeCostingMethod(helpSetCost costhelp);

    ArrayList viewAllCostMethod();

    helpSetCost viewSingleCostMethode(String id);

    String addWareHouse(helpwarehouse wh);

    String addStockInventoryEdition(StockEdtion sed);

    ArrayList viewAllWareHouses();

    String modifyEdition(StockEdtion ed);

    String modifyWarehouse(helpwarehouse wh);

    helpwarehouse viewSingleWarehouse(String id);

    String removeWarehosue(String id);

    String makeStockTransfer(helpStockTransfer hep);

    ArrayList viewAllStockTransfers(String warehouse);

    helpStockTransfer viewSingleStockTransfer(Integer id);

    String receiveStock(HelpStock pr);

    String deductQuantityInPro2(Integer id, Integer Qsub);

    ArrayList viewAllStockTransfersByDateAndWarehouse(String datetransferred, String warehouse);

    String updateStockQuantity(HelpStock hs);

    float computeSupply(Integer quantitysupplied, int unitprice);

    String makeSupply1(String commodityid,String username,String distributor,String dos, Integer quantitysupplied,Float amount,String whcode, String qtyleft, String comodityname, String location, String phonenumber);

    Integer computeStockTransfer(Integer quantityin, Integer quantityout, String wchode, String commodityid);

    String addBranch(HelpBranch hb);

    ArrayList viewAllBranch();

    String addCategory(HelpCategory hc);

    String removeCategory(String id);

    ArrayList viewAllCategory();

    ArrayList viewStoreByCompartments(String whcode,String compartment);

    ArrayList viewAllCommodities1(String makeorby);

    ArrayList viewCommdityByCategory(String commodityName);

    String modifyCategory(HelpCategory ca);

    HelpCategory viewSingleCategory(String id);
   
    ArrayList viewAllRequestByCommodity(String reqcode);
    
    ArrayList viewAllStockHistoryByStatus(String status);

    ArrayList viewAllRequestByDate(String redate1);

    ArrayList viewAllRequestByStatus(String redate);
    
    ArrayList viewItemsByCategory2(String cate);

    ArrayList viewStoreByCategoryAndWareHouse(String category, String whcode);

    String removeRequest(Integer id);

    String modifyItems(Helpcommodity gs);

    ArrayList viewAllCommoditiesForActivation();

    String activateStock(String id);

    ArrayList viewSupplyByCategory2(String commodityId, String whcode);

    StockEdtion viewSingleEdition(String code);

    String removeEdition(String code);

    ArrayList viewAllEditions();

    ArrayList viewAllMaterialsByItemCode(String itemcode);

    String addInventoryCost(HelpInventoryCost hic);

    String addInventoryCost2(HelpInventoryCost hic);


   ArrayList viewStoreByCWMD(String category, String whcode, String MakeOrBuy);

   String modifyInventoryCost(HelpInventoryCost hic);

   String modifyInventoryCost2(HelpInventoryCost hic);

    HelpInventoryCost viewSingleInventoryCost(String id);

    StateHelper viewState(String state1);

    LGAHelper viewLga(String lgae);

    boolean upLoadStocks(String commodityId, Integer quantityIn, String receivedDate, String receivedBy, String unit, Float unitprice, String unitcode, String compactments, String whousecode, String MakeOrBuy,String category,String batchcode,String authorization);

    HelpStock viewSingleCommodity22(String Id);

    String modifyEdition1(StockEdtion ed);

    void viewSingleItems(String code);

    Helpcommodity viewSingleCommodity3(String Id);

     Helpcommodity viewSingleCommodityMew(String Id);

     ArrayList viewAllStocks();

     ArrayList viewAllSupplies();

     ArrayList viewAllSupplieByDate(String datesupp);
     

}
