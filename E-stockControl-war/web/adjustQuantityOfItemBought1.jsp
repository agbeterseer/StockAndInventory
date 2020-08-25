<%-- 
    Document   : adjustQuantityOfItemBought1
    Created on : Feb 20, 2012, 5:51:50 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@include  file="lookUp.jsp" %>
<%try{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adjust Quantity </title>
          <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
         <%
        String code = request.getParameter("code");
        String quantityin = request.getParameter("quantityin");
        String quantpro = request.getParameter("quantpro");
	String addeddate = request.getParameter("addeddate");
        Integer quant = null;
         int sub = 0;

         try{

              String sss = session.getAttribute("ccode").toString();
           // System.out.println("na so we go de dey---------- not straight" +sss);
                hs = scl.viewSingleCommodity(sss, whcode);
                 quant = hs.getQuantityIn();
                 if(request.getParameter("butt")!=null){
                   hs = scl.viewSingleCommodity(sss, whcode);
                   quant = hs.getQuantityIn();
             // System.out.println("na so we go de dey----------" +hs.getCommodityId());
             int m = quant.intValue() + new Integer(quantityin).intValue();

            msg = scl.updateStockQuantity(new HelpStock(sss,new Integer(m),whcode));

           msg = scl.addStockHistory(new HelpStock(null,sss,hs.getQuantityIn(),hs.getReceivedDate(),username,hs.getUnitprice(),hs.getCommodityName(),hs.getUnit(),hs.getCompactments(), new CONFIG().getSTOCK_HISTORY_ADJUSTMENT(),whcode,CONFIG.getSTOCK_ITEM_MAKE(), hs.getBarcode(),"",hs.getCategory()));

          // msg = scl.addStockHistory(new HelpStock(null,code,new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3, whcode,new CONFIG().SET_STOCK_HISTORY,CONFIG.STOCK_ITEM_BOUGHT,barcode,"",hhcc.getCategory()));
            session.setAttribute("ccode", code);
           response.sendRedirect("SuccessForQuantUpdate.jsp");

           }
         }catch(Exception ex){

        response.sendRedirect("errorpage.jsp");
         }
 %>
  <fieldset style="width:800px;">
        <legend class="tableheader">Adjust Quantity</legend>
  <form action="" method="post" name="myform" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="19%">&nbsp;</td>
    <td width="30%" height="25">&nbsp;</td>
    <td width="51%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Quantity Already in Stock</td>
    <td><label>
      <input type="text" name="quantpro" id="quantpro" value="<%=quant%>"  style="width:200px;" readonly="readonly">
    </label></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="23">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td height="21" class="tab_lebel">Quantity In</td>
    <td><label>
      <input type="text" name="quantityin" id="quantityin" style="width:200px;">
    </label></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="24">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Date</td>
    <td><input type="text" name="addeddate" id="addeddate" style="width:200px;" >
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myform.addeddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="butt" id="butt" value="Submit" class="bot"></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
</form>
   <%
    }catch(Exception ex){
   response.sendRedirect("errorQuantityIn.jsp");
    }
   %>
     <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
    <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
    </iframe>
</fieldset>
    </body>
</html>

