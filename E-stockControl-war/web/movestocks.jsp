<%-- 
    Document   : movestocks
    Created on : Sep 20, 2011, 11:17:14 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<%try{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>movestocks</title>
       	  <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
             <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%
        String code = request.getParameter("code");
        String stocitem = request.getParameter("stocitem");
        String barcode = request.getParameter("barcode");
        String quantity = request.getParameter("quantity");
        String currentwarehouse = request.getParameter("currentwarehouse");
        String warehouse = request.getParameter("warehouse");
        String ddate = request.getParameter("ddate");
        String category = request.getParameter("category");
        String makeorbuy = request.getParameter("makeorbuy");
        String mmm = "";
        String cat = "";
        
        
        try{
           hs = scl.viewSingleCommodity(code,whcode);
          hew = scl.viewSingleWarehouse(whcode);
         
          hhcc = scl.viewSingleCommodity2(hs.getCommodityId());
          mmm = hhcc.getItemname();
          hcc = scl.viewSingleCategory(hhcc.getCategory());
          cat = hcc.getStockItemType();

        }catch(Exception ex){

        System.out.println(ex.getMessage());
        }
        try{
            
       
        if(request.getParameter("button") !=null){
                     
         msg = scl.makeStockTransfer(new helpStockTransfer(code,stocitem,ddate, new Integer(quantity),"",whcode,warehouse,barcode,makeorbuy,hhcc.getCategory(),hs.getUnitprice()));


          msg = scl.addStockHistory(new HelpStock(code,hs.getQuantityIn(),ddate,username,hs.getUnitprice(),"",hs.getUnitcode(),hs.getCompactments(), new CONFIG().getSTOCK_HISTORY_TRANSFER(),whcode,CONFIG.getSTOCK_ITEM_MAKE(),barcode,""));
          //      scl.addStockHistory(new HelpStock(trans.getItemcode(),hs.getQuantityIn(),receiveddate,username,hs.getUnitprice(),"",hs.getUnitcode(),hs.getCompactments(), new CONFIG().STOCK_HISTORY_RECEIVED,whcode,CONFIG.STOCK_ITEM_MAKE,"N/A",""));
           style = "success";

           }
          }catch(Exception ex){
          msg = ex.getMessage();
         style = "error";
         //System.out.println();
        }
         %>
      <fieldset style="width:800px;">
    <legend class="tableheader">Transfer Item</legend>
  <form action="" method="post" name="form1" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="22"><font color="red">Quantity In Store</font></td>
    <td><font color="red"><%=hs.getQuantityIn()%></font></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="15%">&nbsp;</td>
    <td width="32%" height="22">&nbsp;</td>
    <td width="40%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="tab_lebel">Item</span></td>
    <td><input type="text" name="stocitem" id="stocitem" style="width:200px;" value="<%=mmm%>" readonly></td>
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
    <td class="tab_lebel">Category</td>
    <td><label>
            <input type="text" name="category" id="category" style="width:200px;" value="<%=cat%>" readonly>
    </label></td>
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
    <td class="tab_lebel">Make or Buy</td>
    <td><label>
            <input type="text" name="makeorbuy" id="makeorbuy" style="width:200px;" value="<%=hs.getMakeOrBuy()%>" readonly>
    </label></td>
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
    <td class="tab_lebel">Barcode</td>
    <td><label>
            <input type="text" name="barcode" id="barcode"  style="width:200px;" value="<%=hs.getBarcode()%>" readonly>
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
    <td class="tab_lebel">Quantity</td>
    <td><label>
      <input type="text" name="quantity" id="quantity" style="width:200px;">
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
    <td class="tab_lebel"> Sending Location</td>
<td><label>
            <input type="text" name="currentwarehouse" id="currentwarehouse" value="<%=hew.getHouseName()%>" style="width:200px;" readonly>
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
    <td class="tab_lebel">Receiving Location</td>
    <td><label>
      <select name="warehouse" id="warehouse" style="width:200px;">
        <option  value="">--Select one Warehouse--</option>
        <%
                            try{
                            ArrayList list =scl.viewAllWareHouses();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                            hew = (helpwarehouse)i.next();

                            if(! hew.getWhcode().equalsIgnoreCase(whcode)){
                            %>
        <option value="<%=hew.getWhcode()%>"<%=(request.getParameter("warehouse") != null && request.getParameter("warehouse").equalsIgnoreCase(hew.getWhcode())) ? new String("selected") : hew.getHouseName()%>><%=hew.getHouseName()%></option>
        <%
                            }
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
        %>
      </select>
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
    <td class="tab_lebel">Date of Transaction</td>
    <td ><label>
      <input type="text" name="ddate" id="ddate" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.ddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
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
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="boton">
    </label></td>
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