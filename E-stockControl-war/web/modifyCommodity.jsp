<%-- 
    Document   : modifyCommodity
    Created on : Jun 24, 2011, 9:33:22 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Modify Goods</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
       
    </head>
    <body>
                   <%
                    String code = request.getParameter("code");
                    String commodityid = request.getParameter("commodityid");
                    String sunit = request.getParameter("sunit");
                    String quantityin = request.getParameter("quantityin");
                    String receiveddate = request.getParameter("receiveddate");
                    String unitprice = request.getParameter("unitprice");
                    String commodityName = request.getParameter("commodityName");
                    
                    String qantityleft = request.getParameter("qantityleft");
                    String sec3 = request.getParameter("sec3");
                    String warehouse = request.getParameter("warehouse");
                    //String barcode = request.getParameter("barcode");
                    String makeorbuy = request.getParameter("makeorbuy");
                    String category = request.getParameter("category");
                    try{
                        if(request.getParameter("button") !=null){
                           // System.out.println("code in here nowww"+ code);

                            msg = scl.modifyStock(new HelpStock(code, new Integer(quantityin),receiveddate,username,new Float(unitprice),commodityName,sunit,sec3,warehouse,makeorbuy,"","",category));

                            msg = scl.addStockHistory(new HelpStock(code,new Integer(quantityin),receiveddate,username,new Float(unitprice),sunit,sec3, "modify",warehouse,"","","",category));

                            //Integer code, String commodityId, Integer quantityIn, String receivedDate, String receivedBy, Float unitprice, String commodityName, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy, String barcode, String DiscountCategory,String category) {
                      style = "success";
                    }
                    }catch(Exception ex){
                        style = "error";
                        System.out.println();
                    }
                   %>

                   <%
                   try{
                       //System.out.println("this is the codeee" +code);
                      //  System.out.println("whcode == codeee" +whcode);
                   hs = scl.viewSingleCommodity22(code);
                  
                  %>
<fieldset style="width:800px;">
    <legend class="tableheader">Modify Goods</legend>
    <form action="" method="post" name="form1" onsubmit="return validate(this);"><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="36%">&nbsp;</td>
    <td width="41%">&nbsp;</td>
    <td width="23%">&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">Commodity Id</td>
    <td><input type="text" name="commodityid" id="commodityid" style="width:200px;" value="<%=hs.getCommodityId()%>"  readonly></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">Commodity Name</td>
    <td><label>
            <input type="text" name="commodityName" id="commodityName" style="width:200px;" value="<%=(request.getParameter("commodityName") != null) ? request.getParameter("commodityName") : scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%>">
    </label></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">Warehouse</td>
    <td><label>
      <input type="text" name="warehouse" id="warehouse" style="width:200px;" value="<%=scl.viewSingleWarehouse(hs.getWhousecode()).getHouseName()%>" readonly>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">Category</span></td>
    <td><select name="category" id="category" style="width:200px;">
      <option  value="<%=hs.getCategory()%>"><%=hs.getCategory()%></option>
      <%
                            try{
                            ArrayList list =scl.viewAllCategory();
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                               hcc  = (HelpCategory)i.next();
                            %>
      <option value="<%=hcc.getCategorycode()%>"<%=(request.getParameter("category") != null && request.getParameter("category").equalsIgnoreCase(hcc.getCategorycode())) ? new String("selected") : new String("")%> ><%=hcc.getStockItemType()%></option>
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
  </tr>
 
  <tr>
    <td><label></label></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">Quantity In</td>
    <td><input type="text" name="quantityin" id="quantityin" style="width:200px;" value="<%=hs.getQuantityIn()%>"></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>

  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">Received Date</td>
    <td><input type="text" name="receiveddate" id="receiveddate" style="width:200px;" value="<%=hs.getReceivedDate()%>"> <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">Unit price</span></td>
    <td><input type="text" name="unitprice" id="unitprice" style="width:200px;" value="<%=hs.getUnitprice()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 
  <tr>
    <td height="17">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td height="19">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Make Or Buy</td>
    <td><label>
            <input type="text" name="makeorbuy" id="makeorbuy" style="width:200px;" value="<%=hs.getMakeOrBuy()%>" >
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Modify" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
</fieldset>
    <%
    
 }catch(Exception ex){
 response.sendRedirect("errorpage.jsp"); 
 }
    %>
</body>
</html>
