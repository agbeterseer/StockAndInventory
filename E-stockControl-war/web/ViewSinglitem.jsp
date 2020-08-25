<%-- 
    Document   : ViewSinglitem
    Created on : Oct 14, 2011, 10:09:28 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View single item</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
        <%
        String code = request.getParameter("code");

        try{
            if(code !=null){
            
            hhcc = scl.viewSingleCommodity2(code);
          %>
    
          <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader">
    <td width="92%" height="20" >Item Details</td>
    <td width="8%"><a href="javascript:window.print();">[Print]</a></td>
  </tr>
</table>
          <table width="80%" border="0" cellspacing="0" cellpadding="0"  class="even">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><form action="" method="post">
  <table width="100%" border="0" cellspacing="4" cellpadding="0" class="even">
    <tr>
      <td width="13%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
      <td width="16%">Date </td>
      <td width="32%" class="tab_lebel"><%=hhcc.getDateadded()%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Item Code</td>
      <td class="tab_lebel"><%=hhcc.getItemcode()%></td>
      <td>Authorisation</td>
      <td class="tab_lebel"><%=hhcc.getAuthorisation()%>
    
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Item Name</td>
      <td class="tab_lebel"><%=hhcc.getItemname()%></td>
      <td>Description</td>
      <td class="tab_lebel"><%=hhcc.getDescription()%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Category</td>
      <td class="tab_lebel"><%=scl.viewSingleCategory(hhcc.getCategory()).getStockItemType()%></td>
      <td>Make or Buy</td>
      <td class="tab_lebel"><%=hhcc.getMakeorbuy()%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

        <%
            }
             }catch(Exception ex){
             System.out.println();
        }
        %>
    </body>
</html>
