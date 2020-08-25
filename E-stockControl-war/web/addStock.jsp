<%-- 
    Document   : addStock
    Created on : Jun 25, 2011, 9:09:31 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add Stock</title>
       	<link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
        <style type="text/css">
<!--
.style1 {
	color: #FF6633;
	font-weight: bold;
}
-->
        </style>
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
                    String category = request.getParameter("category");
                                      
                    try{
                          hew = scl.viewSingleWarehouse(whcode);
        
                        hpr = scl.viewSingleProduction(code);
                        hhcc = scl.viewSingleCommodity2(code);

                 
                        if(new Integer(hpr.getQuantityProduced()).equals(new Integer(0))){
                             session.setAttribute("commodityName", scl.viewSingleCommodity2(hpr.getCommodityid()).getItemname());
                            // System.out.println("hppl.getQuantityProduced()5555"+ code);
                             response.sendRedirect("addStockError.jsp");
                    }
                    }catch(Exception ex){
                    System.out.println();

                    }
                   %>
                   <fieldset style="width:800px;">
    <legend class="bot">Add Goods</legend>
    <form action="" method="post"  name="form1" onsubmit="return validate(this);">
  
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="28" class="<%=style%>"><%=msg%></td>
    </tr>
</table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="29" colspan="4" ></td>
    </tr>
   
  <tr>
    <td width="15%">&nbsp;</td>
    <td width="24%"><span class="style1">Quantity Produced</span></td>
    <td width="40%"><label>
      <input type="text" name="quantpro" id="quantpro" value="<%=(request.getParameter("quantpro") != null) ? request.getParameter("quantpro") : hpr.getQuantityProduced()%>"  style="width:200px;" readonly="readonly">
    </label></td>
   <td width="21%">&nbsp;</td>
    </tr>
 
      <% if (request.getParameter("code") !=null){
              hpr = scl.viewSingleProduction(code);
      %>
          <tr>
            <td height="22" class="tab_lebel">&nbsp;</td>
            <td class="tab_lebel">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Commodity Name</td>
    <td><label>
      <input type="text" name="commodityName" id="commodityName" style="width:200px;"  value="<%=(request.getParameter("quantpro") != null) ? request.getParameter("quantpro") : hpr.getCommodityid()%>"readonly="readonly">

    </label></td>
    <td>&nbsp;</td>
</tr><%}%>
  <tr>
    <td>&nbsp;</td>
    <td height="19">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td><span class="tab_lebel">Compactment<font color="#FF0000">*</font></span></td>
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
        <option value="<%=seci.getName()%>"<%=(request.getParameter("sec3") != null && request.getParameter("sec3").equalsIgnoreCase(seci.getName())) ? new String("selected") : new String("")%>><%=seci.getName()%></option>
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
    <td class="tab_lebel">&nbsp;</td>
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
      <option value="<%=hpu.getUnitcode()%>"<%=(request.getParameter("sunit") != null && request.getParameter("sunit").equalsIgnoreCase(hpu.getUnitcode())) ? new String("selected") : new String("")%> ><%=hpu.getUnitName()%></option>
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
    <td><input type="text" name="receiveddate" id="receiveddate" value="<%=(request.getParameter("receiveddate") != null) ? request.getParameter("receiveddate") : new String("")%>" style="width:200px;"><a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
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
    <td><input type="text" name="unitprice" id="unitprice" style="width:200px;" value="<%=(request.getParameter("unitprice") != null) ? request.getParameter("unitprice") : new String("")%>"></td>
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
    <td><input type="submit" name="addstockb" id="addstockb" value="Submit" class="bot"></td>
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
                
                        String itemstatus = "";
                        try{
                        if(request.getParameter("addstockb") !=null ){

                      if(new Integer(quantpro).intValue() < new Integer(quantityin).intValue()){

                             response.sendRedirect("errorQuantityProLess.jsp");

                             }else{
                            try{
                               hsec = scl.computeSection(sec3,whcode);

                            }catch(Exception ex){
                            System.out.println();

                            }
                              try{
                   
                       // SELECT SECTION
                         msg = scl.addStock(new HelpStock(commodityName,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3,whcode,CONFIG.getSTOCK_ITEM_MAKE(),barcode,"",hhcc.getCategory()));
//Integer code, String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category
                   

                      sub = ((new Integer(hpr.getQuantityProduced()).intValue()) - (new Integer(quantityin).intValue()));
             
                      scl.deductQuantityInPro(code, new Integer(sub));
                       style = "success";
                      //(Integer sno, String commodityId, Integer quantityIn, String receivedDate, String quantityLeft, String receivedBy, Float unitprice, String commodityName, String unitcode        }
                     }catch(Exception ex){
                       style = "error";
                     
         
                    }
                          try{
                 
                     msg = scl.addStockHistory(new HelpStock(commodityName,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3,whcode,CONFIG.getSTOCK_ITEM_MAKE(),barcode,"",hhcc.getCategory()));
//Integer code, String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category
                         response.sendRedirect("vPro.jsp");
                        }catch(Exception ex){
                       
                        System.out.println("");
                        }
                      }
                        }
                   }catch(Exception ex){
                     response.sendRedirect("errorAddItem.jsp");
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
