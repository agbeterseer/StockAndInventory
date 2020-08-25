<%-- 
    Document   : InventoryUsageinquiries
    Created on : Oct 4, 2011, 8:47:33 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Usage Inquiries</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
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
  <tr class="tableheader">
    <td width="94%" height="17"><strong>Inventory Usage Inquiries </strong></td>
    <td width="6%"><a href="javascript:window.print();">[Print]</a></td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
          <tr class="tableheader">
            <td width="12%" height="20"><strong>Items</strong></td>
            <td width="20%"><strong>Authorization</strong></td>
            <td width="27%" ><strong>Quantity</strong></td>
            <td width="24%" ><strong>Date Of Supply</strong></td>
            <td width="17%" ><strong>Unit price</strong></td>
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
                              // sum = hsup.getCogs().intValue();
                               sum2 += hsup.getCogs().intValue();
                               sum += hsup.getQuantitySupplied().intValue();
                              if(count % 2 == 0){
                                style = "even";
                                 } else {
                               style = "odd";
                         }
                %>
                   <tr class="<%=style%>">
                    <td height="20"  class="tab_lebel"><%=scl.viewSingleCommodity2(hsup.getCommodityId()).getItemname()%></td>
                  <td class="tab_lebel"><%=hsup.getIssuedBy()%></td>
                    <td class="tab_lebel"><%=hsup.getQuantitySupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getDateSupplied()%></td>
                    <td class="tab_lebel"><%=hsup.getCogs()%></td>
                </tr>
           <%
        count++;
            }
          %>
        </table>
   <table width="80%" border="0"  cellpadding="0" cellspacing="0">
      <tr>
        <td height="19" >&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td width="12%" height="21" >&nbsp;</td>
        <td width="20%"><div align="right">Total Quantity ---</div></td>
        <td width="27%" align="center"><%=sum%></td>
      
        <td width="24%"><div align="right">Total Amout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td width="17%" align="center">=N=&nbsp;<font color="#FF0000"><%=sum2%>.00</font></td>
     </tr>
      <tr>
        <td height="22" colspan="5"><%=h%>&nbsp;Record(s) Found</td>
      </tr>
      <tr>
        <td height="16" colspan="5" class="art-postmetadataheader">&nbsp;</td>
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
