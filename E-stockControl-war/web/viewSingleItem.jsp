<%-- 
    Document   : viewSingleItem
    Created on : Sep 20, 2011, 11:50:00 AM
    Author     : Terseer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewSingleItem</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
         <%
        String code = request.getParameter("code");
        String warehouse = request.getParameter("warehouse");

        String nmn = "";
        String kk = "";

      
         //hew = scl.viewSingleWarehouse(whcode);
       
         %>
    
     <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader">
    <td width="92%" height="19" >Item Details</td>
    <td width="8%"><a href="javascript:window.print();">[Print]</a></td>

  </tr>
  <tr>
      <td><select name="warehouse" id="warehouse" style="width:200px;" onChange="this.form.submit();">
          <option  value="">--Select one Warehouse--</option>
          <%
                            try{
                            ArrayList lisat = scl.viewAllWareHouses();
                            Iterator i = lisat.iterator();
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
      <td></td>

  </tr>
</table>
<%
     try{
            if(warehouse !=null && warehouse !=""){

                 hs = scl.viewSingleCommodity(code, warehouse);
         hhcc = scl.viewSingleCommodity2(hs.getCommodityId());
         kk = hhcc.getItemcode();
         nmn =hhcc.getItemname();
              

        %>
<table width="80%" border="0" cellspacing="0" cellpadding="0" class="even">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
     <td><table width="100%" border="0" cellspacing="4" cellpadding="0" class="even">
      <tr>
        <td width="13%">&nbsp;</td>
        <td width="38%">&nbsp;</td>
        <td width="24%">&nbsp;</td>
        <td width="25%">&nbsp;</td>
      </tr>
      <tr>
        <td><font  color="#000000">Item Code:</font></td>
        <td class="tab_lebel" ><%=kk%></td>
        <td><div align="right"><font color="#000000">Quantity: &nbsp;&nbsp;</font></div></td>
        <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><font  color="#000000">Item name:</font></td>
        <td class="tab_lebel"><%=nmn%><td><div align="right"><font  color="#000000">Date Add to store:</font>&nbsp;&nbsp;
        </div>
        <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><font  color="#000000">Category:</font></td>
        <td class="tab_lebel"><%=scl.viewSingleCategory(scl.viewSingleCommodity2(hs.getCommodityId()).getCategory()).getStockItemType()%></td>
        <td ><div align="right"><font  color="#000000">Compactment:</font>&nbsp;&nbsp;</div></td>
        <td class="tab_lebel"><%=hs.getCompactments()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><font  color="#000000">Cost:</font></td>
        <td class="tab_lebel"><%=hs.getUnitprice()%></td>
        <td ><div align="right"><font  color="#000000">BarCode:&nbsp;&nbsp;</font></div></td>
        <td class="tab_lebel"><%=hs.getBarcode()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><font  color="#000000">Warehouse:</font></td>
        <td class="tab_lebel"><%=scl.viewSingleWarehouse(hs.getWhousecode()).getHouseName()%></td>
        <td><div align="right"><font  color="#000000">Make or Buy:&nbsp;&nbsp;</font></div></td>
        <td class="tab_lebel"><%=hs.getMakeOrBuy()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

     </form>
<%

  }else{
%>
No Record(s) Found!

 <%
 }
}catch(Exception ex){
//response.sendRedirect("itemerror.jsp");
}
%>


    </body>
</html>
 