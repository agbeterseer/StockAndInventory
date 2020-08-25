<%-- 
    Document   : InventoryMovements
    Created on : Oct 4, 2011, 8:14:57 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Movements</title>
         <link href="css/standerd.css" rel="stylesheet" type="text/css">
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
     </head>
    <body>
         <%
        String transfer = request.getParameter("transfer");
       int sum = 0;
       int sum1 = 0;
      ArrayList list = new ArrayList();
            try{
                if (request.getParameter("purchase") !=null){

                   response.sendRedirect("viewOrders.jsp");
                }
                 if (request.getParameter("adjust") !=null){

                     list = scl.viewAllStockHistoryByStatus(CONFIG.getSTOCK_HISTORY_ADJUSTMENT());

                }
                 if (request.getParameter("sales") !=null){

                }

                
                //System.out.println("jesson"+whcode);
                if(request.getParameter("transfer") !=null){

                list = scl.viewAllStockTransfers(whcode);
                }

            }catch(Exception ex){
            System.out.println();
            }
            %>
<form name="form1" action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" class="tableheadB"><strong> Inventory Movements</strong></td>
    </tr>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="21%">&nbsp;</td>
    <td width="20%">&nbsp;</td>
    <td width="39%">&nbsp;</td>
  </tr>
  <tr>
    <td height="15"><input name="purchase" type="submit"  class="tablehead" value="Sales Invoices"></td>
    <td ><input name="purchase" type="submit"  class="tablehead" value="Purchase orders"></td>
    <td><input name="transfer" type="submit"  class="tablehead" value="Stock Transfer"></td>
    <td><input name="adjust" type="submit"  class="tablehead" value="Stock Adjustments"></td> 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp; </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form> 
  <% if(transfer !=null){%>
          
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader1">
    <td width="28%" height="25"><strong>Items</strong></td>
    <td width="41%"><strong>Transferred Quantity </strong></td>
    <td width="31%"><strong>Transferred Date</strong></td>
    </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
   %>
  <tr> 
    <td height="23" colspan="8" bgcolor="#FFCC99">No Records Found!</td>
    </tr>
     <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
      <%
                   int count = 0;
                   while(it.hasNext()){
                        h++;
                        trans = (helpStockTransfer)it.next();
                        //  sum2 +=hsup.getCogs().intValue();
                        sum += trans.getQuantity().intValue();
			     if(count%2==0){
                                 style= "even";
                                 }else{
                                 style = "odd";
                                 }
  %>
  <tr class="<%=style%>">
      <td height="25"  class="tab_lebel"><%=scl.viewSingleCommodity(new Integer(trans.getItemcode()).toString(), whcode).getCommodityName()%></td>
      <td class="tab_lebel"><%=trans.getQuantity()%></td>
    <td class="tab_lebel"><%=trans.getDatetransferred()%></td>
    </tr>
 <%
 count++;
  }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="6" >&nbsp;</td>
        </tr>
        <tr>
          <td width="21%"><%=h%> &nbsp;Record(s) Found</td>
          <td width="19%" align="right">Total quantity==</td>
          <td width="29%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sum%></td>
          <td width="22%"></td>
          <td width="7%"></td>
          <td width="2%"></td>
    </tr>
     <tr>
       <td height="20" colspan="6" class="tableheader"><div id="pageNavPosition12" align="justify">
      <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition12');
        page.showPage(1);
//--></script>
    </div></td>
    </tr>
  </table>
  <%
        list.clear();
        }
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
  %>
        <%}%>
        <%  if(request.getParameter("adjust") !=null){ %>
   
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader1">
    <td width="18%" height="25">Items</td>
    <td width="24%"><strong>Quantity</strong></td>
    <td width="25%"><strong>Date Of Adjustment</strong></td>
    <td width="33%"><strong>Compartment</strong></td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
    %>
 <tr> 
    <td height="23" colspan="8" bgcolor="#FFCC99">No Records Found!</td>
  </tr>
     <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
     %>
     <%
                   int count = 0;
                   int jhk = 0;
                while(it.hasNext()){
                        h++;
                        hs =(HelpStock )it.next();
			  if (count % 2 == 0) {
                           style = "even";
                             } else {
                               style = "odd";
                             }
       %>
   <tr class="<%=style%>">
      <td class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
    <td class="tab_lebel"><%=hs.getCompactments()%></td>
  </tr>
    <% 
   count++;
   }
  %>
  <tr >
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
    <td  >&nbsp;</td>
  </tr>

</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="94%" ><%=h%> &nbsp;Record(s) Found</td>
        
          <td width="6%" >&nbsp;</td>
        </tr>
     <tr>
       <td height="23" colspan="2" class="tableheader"><div id="pageNavPosition2" align="justify">
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
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
%>

<%}%>
</body>
</html>
