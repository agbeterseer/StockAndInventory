<%-- 
    Document   : viewAllSupplies
    Created on : Jun 30, 2011, 12:57:08 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Supplies Made</title>
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
               String receiveddate = request.getParameter("receiveddate");

            try {
                
                
                //list = scl.viewAllSupplies();
                if(request.getParameter("findate") !=null){

                    list= scl.viewAllSupplieByDate(receiveddate);
                }
                
                if(warehouse!="" && warehouse !=null){
                    list = scl.viewAllSupplies(warehouse);

                    session.setAttribute("warehouse", warehouse);
                 session.setAttribute("search1", search1);
                }

                if (search1 != null && search1 != "" ) {

                    list = scl.viewSupplyByCategory2(search1, warehouse);
                }
                } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
        <form action="" method="post" name="form1" >
       
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr class="tableheadB"  >
      <td height="29">Enter Item</td>
    </tr>
  </table>
  <table width="80%" border="0" cellspacing="2" cellpadding="2">
    <tr>
      <td width="38%"></td>
      <td width="36%">&nbsp;</td>
      <td width="23%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="text" name="search1" id="" style="width:300px;">
      </label></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
    </tr>
    <tr>
      <td></td>
      <td>
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
      </td>
      <td>&nbsp;</td>
   
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
        <input type="text" name="receiveddate" id="receiveddate" value="<%=(request.getParameter("receiveddate") != null) ? request.getParameter("receiveddate") : new String("")%>" style="width:200px;">
      <a href="javascript:void(0)" onClick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
      <td>
        <input type="submit" name="findate" id="findate" value="Find By Date"  class="bot">
      </td>
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
            <td width="22%"><strong>Recieved By</strong></td>
            <td width="17%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Details</strong></td>
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
                              // System.out.println("hsup.getCommodityId()"+ hsup.getCommodityId());
                              // System.out.println("hsup.getCommodityId() 2"+ hsup.getItemname());

                         //  hs =  scl.viewSingleCommodity(hsup.getCommodityId(), warehouse);
                               hs = scl.viewSingleCommodity22(hsup.getCommodityId());
                           //hsup.getCommodityId() see view supply single to see the change done on getCommodityId
                              if(count % 2 == 0){
                                style = "even";
                                 } else {
                               style = "odd";
                         }
                %>
                   <tr class="<%=style%>">
                    <td height="23" class="tab_lebel"><%=hsup.getComodityname()%></td>
                  <td class="tab_lebel"><%=scl.viewSingleCategory(hs.getCategory()).getStockItemType()%></td>
                    <td class="tab_lebel"><%=hsup.getQuantitySupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getDateSupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getDistributorId()%></td>
                    <td  align="center"><a href="viewSingleSupply.jsp?code=<%=hsup.getSno()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
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
        <td width="28%"><div align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="14%"></td>
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
  <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>