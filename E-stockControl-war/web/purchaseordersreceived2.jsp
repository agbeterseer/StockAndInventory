<%-- 
    Document   : purchaseordersreceived2
    Created on : Oct 13, 2011, 9:46:14 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>purchaseordersreceived</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%
        String code = request.getParameter("code");
        String quantity = request.getParameter("quantity");
        String receiveddate = request.getParameter("receiveddate");
        String commo = "";
        
        try{
         hs = scl.viewSingleCommodity(code, whcode);

         hhcc = scl.viewSingleCommodity2(hs.getCommodityId());
         commo = hhcc.getItemname();

         System.out.println(";;;;;"+hs.getCommodityId());
       //  if(commo == null){
         //response.sendRedirect("receiveRequestError.jsp");
       //  }
        }catch(Exception ex){
        response.sendRedirect("receiveRequestError.jsp");
        }

        try{
           
          msg = scl.updateStockQuantity(new HelpStock(code,new Integer(quantity),whcode));

          msg = scl.addStockHistory(new HelpStock(code,hs.getQuantityIn(),hs.getReceivedDate(),username,hs.getUnitprice(),hs.getCommodityName(),hs.getUnit(),hs.getCompactments(), whcode, CONFIG.getSTOCK_ITEM_MAKE(), hs.getBarcode(), "", hs.getCategory()));
		//msg = scl.addStockHistory(new HelpStock(commodityName,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3,whcode,CONFIG.getSTOCK_ITEM_MAKE(),barcode,"",hhcc.getCategory()));
//Integer code, Str

          style = "success";
          }catch(Exception ex){
		  style = "error";
        System.out.println();
        }
         %>
         <fieldset style="width:800px;">
    <legend class="tableheader">Add Item's Quantity</legend>
    <form action="" method="post" name="form1" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="23%" height="26">&nbsp;</td>
    <td width="23%">&nbsp;</td>
    <td width="74%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Item</td>
    <td><label>
            <input type="text" name="code" id="code" style="width:200px;" value="<%=commo%>" readonly>
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
    <td class="tab_lebel">Date</td>
    <td><label>
      <input type="text" name="receiveddate" id="receiveddate" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="bot">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
<!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    </body>
</html>
