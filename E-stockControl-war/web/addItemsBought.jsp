<%-- 
    Document   : addItemsBought
    Created on : Sep 26, 2011, 11:08:12 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addItemsBought</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
		 <script language="Javascript">
    //Returns true if given input is valid float  else return false
	    function checkforPrice(value) {
	        if (isNaN(parseFloat(value)))
	         return false;
        else return true;
   }
   
   </script>
    
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
                    //String warehouse = request.getParameter("warehouse");
                    String quantpro = request.getParameter("quantpro");
                    String warehouse = request.getParameter("warehouse");
                    String makeorbuy = request.getParameter("makeorbuy");
                    String barcode = request.getParameter("barcode");
                    String category = request.getParameter("category");
                    String carr = "";

                  try{
                   System.out.println("inside buuuuu=="+code);

                  hhcc = scl.viewSingleCommodity2(code);
                   

                  carr = hhcc.getItemname();

                  }catch(Exception ex){
                  System.out.println();
                  }
                   
                   %>
                 <fieldset style="width:800px;">
    <legend class="tableheader">Add Items</legend>
    <form action="" method="post"  name="Test" onsubmit="return validate(this);">
  
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="18%" class="tab_lebel">&nbsp;</td>
          <td width="21%" class="tab_lebel">&nbsp;</td>
          <td width="40%">&nbsp;</td>
          <td width="21%">&nbsp;</td>
        </tr>
        <tr>
          <td class="tab_lebel">&nbsp;</td>
          <td class="tab_lebel">Items</td>
          <td><label>
                  <input type="text" name="commodityName" id="commodityName" style="width:200px;" value="<%=(request.getParameter("commodityName") != null) ? request.getParameter("commodityName") : carr%>">
          </label></td>
          <td>&nbsp;</td>
        </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="19">&nbsp;</td>
    <td>&nbsp;</td>
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
    <td><span class="tab_lebel">Store</span></td>
    <td><select name="warehouse" id="warehouse" style="width:200px;">
        <option  value="">--Select one Warehouse--</option>
        <%
                            try{
                            ArrayList list = scl.viewAllWareHouses();
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                              helpwarehouse  seci = (helpwarehouse)i.next();
                             //if(! (new Integer(seci.getCapacity()).intValue() == seci.getTrack().intValue())){

                            %>
        <option value="<%=seci.getWhcode()%>"<%=(request.getParameter("warehouse") != null && request.getParameter("warehouse").equalsIgnoreCase(seci.getWhcode())) ? new String("selected") : new String("")%>><%=seci.getHouseName()%></option>
        <%
                            //}
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
    </select></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
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
    <td class="tab_lebel">Quantity In</td>
    <td><input type="text" name="quantityin" id="quantityin" style="width:200px;" value="<%=(request.getParameter("quantityin") != null) ? request.getParameter("quantityin") : new String("")%>"></td>
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
    <td class="tab_lebel">Date</td>
    <td><input type="text" name="receiveddate" id="receiveddate" value="<%=(request.getParameter("receiveddate") != null) ? request.getParameter("receiveddate") : new String("")%>" style="width:200px;"><a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.Test.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Unit price</td>
    <td><input type="text" name="unitprice" id="Float" style="width:200px;" onblur="return checkNum(this);"></td>
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
      <input type="text" name="barcode" id="barcode" style="width:200px;"  value="<%=(request.getParameter("barcode") != null) ? request.getParameter("barcode") : new String("")%>">
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
    <td><input type="submit" name="addstockb" id="addstockb" value="Submit" class="bot" ></td>
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

        <%
                    //String commodityid = request.getParameter("commodityid");

                    int sub = 0;

                    try{
                        String itemstatus = "";
                        if(request.getParameter("addstockb") !=null){
                         //   if(unitprice.){

                         //SELECT SECTION
                       //hsec = scl.computeSection(sec3,whcode);

                      // System.out.println("watin de happen na"+);

                      msg = scl.addStock(new HelpStock(code,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,"",warehouse,CONFIG.getSTOCK_ITEM_BUY(),barcode,"",hhcc.getCategory(), null));
                        //(Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode        }
//                       String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category, Integer sno {

                        //System.out.println("pass 0");
                     msg = scl.addStockHistory(new HelpStock(null,code,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,"", warehouse,new CONFIG().getSET_STOCK_HISTORY(),CONFIG.getSTOCK_ITEM_BUY(),barcode,"",hhcc.getCategory()));
                     //Integer code, String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category
                        // System.out.println("pass 1");
                 //     sub = ((new Integer(hpr.getQuantityProduced()).intValue()) - (new Integer(quantityin).intValue()));
                       // System.out.println("pass 2");
                     // scl.deductQuantityInPro(code, new Integer(sub));
                     // response.sendRedirect("vPro.jsp");
                      // hs = scl.viewSingleSection(sec3);
                        style = "success";
                    }
                       //     }
                    }catch(Exception ex){
                       
                        style = "error";
                        // response.sendRedirect("errorAddItem.jsp");
                        System.out.println(ex.getMessage());
                    }
                   %>
                   <table  width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="22" class="<%=style%>"><%=msg%></td>
                     </tr>
                   </table>
                       </fieldset>
					
</body>
</html>
