<%-- 
    Document   : viewAllStockTransfers
    Created on : Sep 20, 2011, 1:38:06 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view All Stock Transfers</title>
   <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
        <script type="text/javascript">
            checked = false;
            function checkedAll () {
                if (checked == false){checked = true}else{checked = false}
                for (var i = 0; i < document.getElementById('myform').elements.length; i++) {
                    document.getElementById('myform').elements[i].checked = checked;
                }
            }
        </script>
        <script type="text/javascript">
            function confirmation() {
                var answer = confirm("Are you Sure you want to Remove?");
                if (answer)
                    return true;
                else
                    return false;
            }
        </script>
     </head>
        <body>
           
            <%
   
            String receiveddate = request.getParameter("receiveddate");
            String wpartment = request.getParameter("wpartment");
            
            ArrayList list = new ArrayList();

            try{
                 list = scl.viewAllStockTransfers(wpartment);
                
              if(request.getParameter("button") !=null){
                  
               list = scl.viewAllStockTransfersByDateAndWarehouse(receiveddate, wpartment);
               
                }
              }catch(Exception ex){
            System.out.println(ex.getMessage());
            }
          %>
            <form action="" method="post" name="form1"  onsubmit="return validate(this);">
                   <div style="padding-left:253px"> Department
					<select name="wpartment" id="wpartment" style="width:200px;" onChange="this.form.submit();">
                    <option value="">--Select Department--</option>
                    <%
                            try{
                            ArrayList lllist = scl.viewAllWareHouses();
                           Iterator i = lllist.iterator();
                            while(i.hasNext()){
                              helpwarehouse he  = (helpwarehouse)i.next();
                            %>
                       <option value="<%=he.getWhcode()%>"<%=(request.getParameter("wpartment") != null && request.getParameter("wpartment").equalsIgnoreCase(he.getWhcode())) ? new String("selected") : hew.getHouseName()%>><%=he.getHouseName()%></option>
                               <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
                  </select>
														   </div>
            <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" class="tableheadB"><strong>..:: Select a Date::..</strong></td>
    </tr>
</table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="32%" height="24">&nbsp;</td>
      <td width="39%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
      <input type="text" name="receiveddate" id="receiveddate" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt="loading image.."></a></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
    </tr>
    <tr>
      <td height="18">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
  <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    <form action="" method="post" id="myform" name="myform"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="18" class="tableheader">List of Transferred Stocks</td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="22%" height="20" ><strong>Item</strong></td>
    <td width="20%"><strong>Quantity</strong></td>
    <td width="11%"><strong>Warehouse</strong></td>
    <td width="26%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="6%"><strong>Details </strong></td>
    <td width="15%">
      [receive Items]   </td>
    </tr>
      <%
                        if (list != null) {
                            try {
                        if (list.isEmpty()) {
      %>
  <tr>
    <td height="21" colspan="7" bgcolor="#FFCC99">No Record(s) Found !</td>
    </tr>
                <%                } else {
                                  Iterator it = list.iterator();
                                  int h = 0;
                %>
                 <%
                                 int count = 0;
                                 while (it.hasNext()) {
                                     h++;
                                     trans = (helpStockTransfer) it.next();

                                     if (count % 2 == 0) {
                                         style = "even";
                                     } else {
                                         style = "odd";
                                     }
                                    // Integer n = new Integer();
                                   //hs = scl.viewSingleCommodity2(trans.getItemcode()); // items table
                                    hhcc = scl.viewSingleCommodity2(trans.getItemcode());
                %>
  <tr class="<%=style%>">
    <td height="23"  class="tab_lebel"><%=trans.getItemcode()%></td>
    <td class="tab_lebel"><%=trans.getQuantity()%></td>
    <td class="tab_lebel"><%=scl.viewSingleWarehouse(trans.getFromwarehouse()).getHouseName()%></td>
    <td class="tab_lebel"><%=trans.getDatetransferred()%></td>
    <td><a href="viewSingleItem.jsp?code=<%=trans.getItemcode()%>"><img src="images/Coherence.png" width="21" height="21" alt="loadin image..."></a></td>
    <td><a href="receiveTransfer.jsp?code=<%=trans.getSno()%>">receive item</a></td>
  </tr>
    <% 
	 count++;
        }
    %>
</table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
         <tr>
           <td width="92%">&nbsp;</td>
           <TD width="8%">&nbsp;</TD>
         </tr>
         <tr>
           <td ><%=h%>&nbsp;Record(s) Found</td>
           <td >&nbsp;</td>
         </tr>
         <tr>
           <td height="17" colspan="2" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
       list.clear ();
      }
      }catch
      (Exception ex){
              System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
              }
              }
            %>
    </form>
    </body>
</html>
