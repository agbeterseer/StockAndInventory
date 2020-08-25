<%-- 
    Document   : supplyReportPDF
    Created on : Jul 1, 2011, 1:36:18 PM
    Author     : Terseer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUPPLY REPORT</title>
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
        <%

        ArrayList list = new ArrayList();
            int sum = 0;
            int sum2 = 0;
            try {
			
                list = scl.viewAllSupplies(whcode);

            } catch (Exception ex) {
                System.out.println();

            }
        %>

        <form action="" method="post">
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" class="tableheader"><strong>..:: All Supplies ::..</strong></td>
    </tr>
</table>
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="generateSupplyPDF.jsp">[GENERATE SUPPLY REPORT]</a></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
          <tr class="tableheader">
            <td width="16%" height="20"><strong> Item</strong></td>
            <td width="20%"><strong>Category</strong></td>
            <td width="25%"><strong>Quantity</strong></td>
            <td width="22%"><strong>Date Of Supply</strong></td>
            <td width="17%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Unit price</strong></td>
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

                              hs =  scl.viewSingleCommodity(hsup.getItemname(), whcode);


                            //  System.out.println("hs.getCategory()=="+hs.getCategory());
                                                                   
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
            <td  align="center"><%=hsup.getCogs()%>0</td>
          </tr>
               <%
        count++;
           }
          %>
        </table>
        <table width="80%" border="0"  cellpadding="0" cellspacing="0">
  <tr>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
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
  <tr  class="art-postmetadataheader">
    <td height="16" colspan="6" ><div id="pageNavPosition2" align="justify">
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
