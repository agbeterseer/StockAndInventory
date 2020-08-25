<%-- 
    Document   : printItemsOut
    Created on : May 2, 2016, 11:18:06 AM
    Author     : JPT TERSOO AGBE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>printItemsOut</title>
     <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
   </head>
    <body>
<% try{ %>
        <%
            ArrayList list = new ArrayList();
            int sum = 0;
            int sum2 = 0;
               String category = request.getParameter("category");
               String search1 = request.getParameter("search1");
               String warehouse = request.getParameter("warehouse");
            try {
                 warehouse = session.getAttribute("warehouse").toString();
                search1 = session.getAttribute("search1").toString();

                //list = scl.viewAllSupplies();

                if(warehouse!="" && warehouse !=null){
                    list = scl.viewAllSupplies(warehouse);
                }

                if (search1 != null && search1 != "" ) {

                    list = scl.viewSupplyByCategory2(search1, warehouse);
                }
                } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
     
 
        <form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader">
    <td width="94%" height="20"><strong>All Supplies made</strong></td>
    <td width="6%"><a href="javascript:window.print();">[Print]</a></td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
          <tr class="tableheader">
            <td width="16%" height="20"><strong> Item</strong></td>
            <td width="20%"><strong>Category</strong></td>
            <td width="25%"><strong>Qty Supplied</strong></td>
            <td width="22%"><strong>Date Of Supply</strong></td>
            <td width="17%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Qty Left</strong></td>
    </tr>
                <%
                       if (list != null) {
                           try {
                       if (list.isEmpty()) {
                %>
                <tr>
                    <td height="25" colspan="5" bgcolor="#FFCC99">No Records Found!</td>
                </tr>
                <%                } else {
                              Iterator it = list.iterator();
                              int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hsup = (HelpSupply) it.next();
                              sum += hsup.getQuantitySupplied().intValue();
                               sum2 +=hsup.getCogs().intValue();
                               System.out.println("hsup.getCommodityId()"+ hsup.getCommodityId());
                               System.out.println("hsup.getCommodityId() 2"+ hsup.getItemname());

                           hs =  scl.viewSingleCommodity(hsup.getItemname(), warehouse);
                           //hsup.getCommodityId() see view supply single to see the change done on getCommodityId
                              if(count % 2 == 0){
                                style = "even";
                                 } else {
                               style = "odd";
                         }
                %>
                   <tr class="<%=style%>">
                    <td height="23" class="tab_lebel"><%=hsup.getCommodityId()%></td>
                  <td class="tab_lebel"><%=scl.viewSingleCategory(hs.getCategory()).getStockItemType()%></td>
                    <td class="tab_lebel"><%=hsup.getQuantitySupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getDateSupplied()%></td>
                    <td  align="center"><%=hs.getQuantityIn()%></td>
            </tr>
       <%
        count++;
            }
          %>
        </table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
      <tr>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="22%" ><%=h%>&nbsp;Record(s) Found</td>
        <td width="18%"><div align="right">Total Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="18%"><%=sum%></td>
        <td width="28%"><div align="right">Total Amout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="14%">=N=&nbsp;<font color="#FF0000"><%=sum2%>.00</font></td>
    </tr>
      <tr>
        <td height="22" colspan="6"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
                                <script type="text/javascript"><!--
                                var page = new Pager('results', 25);
                                page.init();
                                page.showPageNav('page', 'pageNavPosition2');
                                page.showPage(1);
                                //--></script>
        </div>        </td>
     </tr>
    </table>
      <%
                             list.clear();
                           }
                           } catch (Exception ex) {
                             System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
                           }
                       }
            %>
    </form>
    </body>
</html>

<% } catch (Exception ex) {
       System.out.println();
    }

%>  <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
   </head>
    <body>
<% try{ %>
        <%
            ArrayList list = new ArrayList();
            int sum = 0;
            int sum2 = 0;
               String category = request.getParameter("category");
               String search1 = "";
               String warehouse = "";
            try {
                    warehouse = session.getAttribute("warehouse").toString();
                    search1 = session.getAttribute("search1").toString();
                //list = scl.viewAllSupplies();

                if(warehouse!="" && warehouse !=null){
                    list = scl.viewAllSupplies(warehouse);
                }else{
                    list = scl.viewSupplyByCategory2(search1, warehouse);
                    }
                } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
        <form action="" method="post" onsubmit="return validate(this);">
            <div style="padding-left:253px"> Department	 </div>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr class="tableheadB"  >
      <td height="29">Enter Item</td>
    </tr>
  </table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="42%"></td>
      <td width="31%"><span style="padding-left:253px">
        <select name="warehouse" id="warehouse" style="width:200px;" onChange="this.form.submit();">
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
    </select>
      </span></td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="text" name="search1" id="" style="width:300px;">
      </label></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
        <form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader">
    <td width="94%" height="20"><strong>All Supplies made</strong></td>
    <td width="6%"><a href="javascript:window.print();">[Print]</a></td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
          <tr class="tableheader">
            <td width="16%" height="20"><strong> Item</strong></td>
            <td width="20%"><strong>Category</strong></td>
            <td width="25%"><strong>Qty Supplied</strong></td>
            <td width="22%"><strong>Date Of Supply</strong></td>
            <td width="17%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Qty Left</strong></td>
    </tr>
                <%
                       if (list != null) {
                           try {
                       if (list.isEmpty()) {
                %>
                <tr>
                    <td height="25" colspan="5" bgcolor="#FFCC99">No Records Found!</td>
                </tr>
                <%                } else {
                              Iterator it = list.iterator();
                              int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hsup = (HelpSupply) it.next();
                              sum += hsup.getQuantitySupplied().intValue();
                               sum2 +=hsup.getCogs().intValue();
                               System.out.println("hsup.getCommodityId()"+ hsup.getCommodityId());
                               System.out.println("hsup.getCommodityId() 2"+ hsup.getItemname());

                           hs =  scl.viewSingleCommodity(hsup.getItemname(), warehouse);
                           //hsup.getCommodityId() see view supply single to see the change done on getCommodityId
                              if(count % 2 == 0){
                                style = "even";
                                 } else {
                               style = "odd";
                         }
                %>
                   <tr class="<%=style%>">
                    <td height="23" class="tab_lebel"><%=hsup.getCommodityId()%></td>
                  <td class="tab_lebel"><%=scl.viewSingleCategory(hs.getCategory()).getStockItemType()%></td>
                    <td class="tab_lebel"><%=hsup.getQuantitySupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getDateSupplied()%></td>
                    <td  align="center"><%=hs.getQuantityIn()%></td>
            </tr>
       <%
        count++;
            }
          %>
        </table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
      <tr>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="22%" ><%=h%>&nbsp;Record(s) Found</td>
        <td width="18%"><div align="right">Total Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="18%"><%=sum%></td>
        <td width="28%"><div align="right">Total Amout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="14%">=N=&nbsp;<font color="#FF0000"><%=sum2%>.00</font></td>
    </tr>
      <tr>
        <td height="22" colspan="6"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
                                <script type="text/javascript"><!--
                                var page = new Pager('results', 25);
                                page.init();
                                page.showPageNav('page', 'pageNavPosition2');
                                page.showPage(1);
                                //--></script>
        </div>        </td>
     </tr>
    </table>
      <%
                             list.clear();
                           }
                           } catch (Exception ex) {
                             System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
                           }
                       }
            %>
    </form>
    </body>
</html>

<% } catch (Exception ex) {
       System.out.println();
    }

%>