<%-- 
    Document   : viewStockTransfer
    Created on : Sep 20, 2011, 1:08:01 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<%try{%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Stock Transfer</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>

        <%
        String code = request.getParameter("code");

        try{
          trans =  scl.viewSingleStockTransfer(new Integer(code));

        %>
 <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader">
    <td width="33%" height="19">Item Details</td>
    <td width="60%">&nbsp;</td>
    <td width="7%"><a href="javascript:window.print">[Print]</a></td>
  </tr>
</table>
<table width="80%" border="0" cellspacing="4" cellpadding="0" class="even">
  <tr>
    <td width="16%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
    <td width="21%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Item Code</td>
    <td><%=trans.getItemcode()%></td>
    <td class="tab_lebel">Barcode</td>
    <td><%=trans.getBarcode()%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Item Name</td>
    <td><%=trans.getItemname()%></td>
    <td class="tab_lebel">Warehouse</td>
    <td><%=trans.getFromwarehouse()%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Quantity</td>
    <td><%=trans.getQuantity()%></td>
    <td class="tab_lebel">Category</td>
    <td><%=trans.getItemcode()%></td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel"> Date of Transfer</td>
    <td><%=trans.getItemcode()%></td>
    <td class="tab_lebel">Status</td>
    <td><%=trans.getItemcode()%></td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
 <%
 
        }catch(Exception ex){
        System.out.println();
        }


%>
    </body>
</html>
 <%
        }catch(Exception ex){
            response.sendRedirect("errorpage.jsp");
        }


%>