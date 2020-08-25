<%-- 
    Document   : makeSupply
    Created on : Jun 30, 2011, 11:39:26 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..:: Make Supply ::..</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
            <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
     
    </head>
    <body>
        <%
            ArrayList list = new ArrayList();
            String search1 = request.getParameter("search1");
            String category = request.getParameter("category");
            String warehouse = request.getParameter("warehouse");
            
            try {

                list = scl.viewAllStocks();
                if(warehouse !=null && warehouse !=""){
                   list = scl.viewAllStocks(warehouse);
                    //list = scl.viewAllSupplies(warehouse);
                }
                        //viewAllStocks(whcode);

                if (request.getParameter("button")!= null && search1 != "" ) {

                    list = scl.viewStoreByCategory(search1, warehouse);

                }
                if (category != null && category != "" ) {

                    list = scl.viewStoreByCategoryAndWareHouse(category, warehouse);

                }
                //
            } catch (Exception ex) {
                System.out.println();
            }
        %>
        <form action="" method="post">
            <table width="80%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="22" class="tableheader"><strong>Enter Item </strong></td>
              </tr>
            </table>
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="42%">&nbsp;</td>
                    <td width="31%">&nbsp;</td>
                    <td width="27%">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><label>
                            <input type="text" name="search1" id="search1" style="width:300px;" onblur="this.form.submit();">
                        </label></td>
                    <td><input type="submit" name="button" id="button" value="Inventory Search"  class="boton"></td>
                </tr>
                <tr  >
                    <td height="20">&nbsp;</td>
                  <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><div align="right">Select one Category</div></td>
                  <td><select name="category" id="category" style="width:200px;"  onChange="this.form.submit();">
                    <option  value="">--Select one Category--</option>
                    <%
                            try{
                            ArrayList lllist = scl.viewAllCategory();
                           Iterator i = lllist.iterator();
                            while(i.hasNext()){
                               hcc  = (HelpCategory)i.next();
                            %>
                    <option value="<%=hcc.getCategorycode()%>"<%=(request.getParameter("category") != null && request.getParameter("category").equalsIgnoreCase(hcc.getCategorycode())) ? new String("selected") : new String("")%>><%=hcc.getStockItemType()%></option>
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
                  <td>  <select name="warehouse" id="warehouse" style="width:200px;" onChange="this.form.submit();">
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
                  <td>&nbsp;</td>
                </tr>
            </table>
                </form>
        <form action="" method="post">
            <table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="22" class="tableheader"><strong> Goods In Store</strong></td>
              </tr>
            </table>

            <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
                <tr>
                    <td width="26%">&nbsp;</td>
                    <td width="20%">&nbsp;</td>
      <td colspan="4">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="21%" align="right">&nbsp; &nbsp;</td>
                                <td width="33%" align="right"><strong>FLAGS</strong>&nbsp;</td>
                              <td width="9%" align="right"><img src="images/RED.jpg" width="26" height="20"></td>
                              <td width="14%">Item Low</td>
                              <td width="9%" align="right"><img src="images/GREEN.jpg" width="26" height="20"></td>
                              <td width="14%">Item Ok</td>
                          </tr>
                  </table>                  </td>
                </tr>
                <tr class="tableheader">
                    <td height="20">Items</td>
                  <td><strong>Quantity In</strong></td>
                    <td width="23%"><strong>Received Date</strong></td>
                    <td width="11%"><strong>[Details]</strong></td>
                    <td width="12%"><strong>[Supply]</strong></td>
                  <td width="8%"><strong> </strong></td>
              </tr>
                <%
            if (list != null) {
                try {
                    if (list.isEmpty()) {
                %>
                <tr>
                    <td height="20" colspan="6" bgcolor="#FFCC99">No Records Found!</td>
                </tr>
                <%                } else {
                                     Iterator it = list.iterator();
                                     int h = 0;
                %>
              <%
                                     int count = 0;
                                     int sum = 0;
                                     while (it.hasNext()) {
                                         h++;
                                         hs = (HelpStock) it.next();
                                         sum += hs.getQuantityIn().intValue();
                                         if (count % 2 == 0) {
                                             style = "even";
                                         } else {
                                             style = "odd";
                                         }
                %>
                <tr class="<%=style%>">
                    <td class="tab_lebel" ><%=hs.getCommodityName()%></td>
                    <td class="tab_lebel"> <%=hs.getQuantityIn()%></td>
                    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
                    <td class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
                    <td class="tab_lebel"><a href="makeSupplyFinal.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Donate.png" width="21" height="21"></a></td>
                            <%
                                              
                                               //try {
                                                    //viewCommodityLimit

                                                            /*
 *
                                                        if(warehouse !=null && warehouse !=""){
                                                    hhcc = scl.viewSingleCommodity2(hs.getCommodityId());
                                                    id = hhcc.getItemcode();
                                                           //     if(warehouse !=null && warehouse !=""){


                                                    HelpLimit hl = scl.viewCommodityLimit(id, warehouse);
                                                if (hs.getQuantityIn() != null) {
                                                  
                                                        if (hs.getQuantityIn().intValue() < new Integer(hl.getLowerLimit()).intValue()) {

                                                            limit = "limitreach";
                                                           //System.out.println("okkk i don pass below limit and the lowerLimit is:====" +hl.getLowerLimit());
                                                        } else {
                                                            limit = "goods_ok";
                                                         // System.out.println("okkk i too much oooooo");
                                                        }
                                                      //  }

                                                   } */

                            %>
                    <td  ></td>
                            <%
                           // }
                                           

                            %>
                </tr>
                 <%
                  count++;
                  }
                %>
                <tr>
                  <td >&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                
            </table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td width="19%" ><%=h%>Record(s) Found</td>
                  <td width="74%">Total Q. ==&nbsp;&nbsp;<font color="#FF0000"><%=sum%></font></td>
                  <td width="7%"></td>
        </tr>
                <tr>
                    <td height="22" colspan="3" class="tableheader"><div id="pageNavPosition2" align="justify">
                            <script type="text/javascript"><!--
                                var page = new Pager('results', 25);
                                page.init();
                                page.showPageNav('page', 'pageNavPosition2');
                                page.showPage(1);
                                //--></script>
                        </div></td>
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
