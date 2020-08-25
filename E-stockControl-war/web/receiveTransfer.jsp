<%-- 
    Document   : receiveTransfer
    Created on : Sep 20, 2011, 2:26:01 PM
    Author     : Terseer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp"%>
<%try{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>receiveTransfer</title>
   <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
           <%
                    String code = request.getParameter("code");
                    String sunit = request.getParameter("sunit");
                    String quantityin = request.getParameter("quantityin");
                    String receiveddate = request.getParameter("receiveddate");
                    String unitprice = request.getParameter("unitprice");
                    String commodityName = request.getParameter("commodityName");
                    String sec3 = request.getParameter("sec3");
                    String quantpro = request.getParameter("quantpro");
                    String warehouse = request.getParameter("warehouse");
                    String makeorbuy = request.getParameter("makeorbuy");
                    String barcode = request.getParameter("barcode");
                   float pri = 0.0F;
                 //java.lang.Float pri  =  new Float();
                    try{
                        
                      trans = scl.viewSingleStockTransfer(new Integer(code));

                     //  System.out.println(" na so abi?=="+ trans.getItemcode() +  "======"+ trans.getFromwarehouse());
                      
                      hs = scl.viewSingleCommodity(new Integer(trans.getItemcode()), trans.getFromwarehouse());

                      pri = hs.getUnitprice().floatValue();
        
                       hcc = scl.viewSingleCategory(hs.getCategory());
                         
                     // System.out.println("abi?=="+hs.getUnitprice());

                    }catch(Exception ex){
                    System.out.println("error due to:"+ex.getMessage());
                    response.sendRedirect("itemerror.jsp");
                     }
           %>
            <%
                    int sub = 0;

                    try{

                    if(request.getParameter("restockb") !=null){

                     hsec = scl.computeSection(sec3,whcode);

                  msg = scl.receiveStock(new HelpStock(hs.getCommodityId(),new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3,whcode,trans.getMakeorbuy(),barcode,"",hcc.getStockItemType(),new Integer(code)));
                        //(Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode        }
                      // build the history of stock
                     //msg = scl.addStockHistory(new HelpStock(new Integer(code),commodityName,new Integer(quantityin),receiveddate,null,username,new Float(unitprice),commodityName,sunit,sec3, new CONFIG().SET_STOCK_HISTORY,warehouse,"",barcode,""));
                    Integer newquantity = scl.computeStockTransfer(hs.getQuantityIn(), trans.getQuantity(), trans.getFromwarehouse(), new Integer(trans.getItemcode()));

                     msg = scl.addStockHistory(new HelpStock(hs.getCommodityId(),hs.getQuantityIn(),receiveddate,username,hs.getUnitprice(),"",hs.getUnitcode(),hs.getCompactments(), new CONFIG().STOCK_HISTORY_RECEIVED,whcode,CONFIG.STOCK_ITEM_MAKE,barcode,"",new Integer(code)));

                      style = "success";

                    }
                    }catch(Exception ex){
                        style = "error";
                        System.out.println(ex.getMessage());
                    }
       %>
        <fieldset style="width:800px;">
    <legend class="tableheader">Add Goods</legend>
    <form action="" method="post"  name="form1" onsubmit="return validate(this);">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td height="29" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
      <tr>
            <td width="13%" height="22" class="tab_lebel">&nbsp;</td>
            <td width="26%" class="tab_lebel">&nbsp;</td>
            <td width="40%">&nbsp;</td>
            <td width="21%">&nbsp;</td>
          </tr>
        <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Commodity Name</td>
    <td><label>
      <input type="text" name="commodityName" id="commodityName" style="width:200px;" value="<%=trans.getItemcode()%>" readonly="readonly">
    </label></td>
    <td>&nbsp;</td>
</tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Warehouse</td>
    <td><label>
      <input type="text" name="warehouse" id="warehouse" style="width:200px;" value="<%=(scl.viewSingleWarehouse(whcode)).getHouseName()%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="18" class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td><span class="tab_lebel">Compactment</span></td>
    <td><select name="sec3" id="sec3" style="width:200px;">
        <option  value="">--Select one Compactment--</option>
        <%
                            try{
                            ArrayList list = scl.viewAllSections(whcode);
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                              HelpSection  seci = (HelpSection)i.next();
                             if(! (new Integer(seci.getCapacity()).intValue() == seci.getTrack().intValue())){
                    
                            %>
        <option value="<%=seci.getName()%>"><%=seci.getName()%></option>
        <%
                            }
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %> 
    </select></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="18" class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Unit</td>
    <td><select name="sunit" id="sunit" style="width:200px;">
      <option  value="">--Select one Unit--</option>
                        <%
                            try{
                            ArrayList list =scl.viewAllUnits(whcode);
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                                helpUits hpu = (helpUits)i.next();
                            %>
      <option value="<%=hpu.getUnitcode()%>"><%=hpu.getUnitName()%></option>
                             <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                          %>
    </select></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Quantity Transferred</td>
    <td><input type="text" name="quantityin" id="quantityin" style="width:200px;" value="<%=trans.getQuantity()%>" readonly></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Received Date</td>
    <td><input type="text" name="receiveddate" id="receiveddate" style="width:200px;"><a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Unit price</td>
    <td><input type="text" name="unitprice" id="unitprice" style="width:200px;" value="<%=new Float(pri)%>" readonly></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Barcode</td>
    <td><label>
      <input type="text" name="barcode" id="barcode" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="restockb" id="restockb" value="Submit" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table> 
</form>
        <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
</fieldset>
       
</body>
</html>
<%
       }catch(Exception ex){
                 response.sendRedirect("errorpage.jsp"); 
                    }

%>