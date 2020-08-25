<%-- 
    Document   : viewSingleRequest
    Created on : Jul 28, 2011, 2:07:46 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Single Request</title>
   <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
</head>
    <body>
   
        <%
         ArrayList list = new ArrayList();
           String requisitioncode = request.getParameter("code");
        try{
             //lo = scl.viewSingleUser(username);
          //   lo.getRole().substring(0, 3);

            hrp = scl.viewSingleRequisition(new Integer(requisitioncode));
      
         %>
<form action="" method="post">
  <table width="80%" border="0" cellspacing="0" cellpadding="0" class="tableheader1">
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="even">
        <tr>
          <td height="20" colspan="4" class="tableheader">..:: Request for Item::..</td>
        </tr>
        <tr>
          <td width="14%" height="23">&nbsp;</td>
          <td width="36%">&nbsp;</td>
          <td width="15%">&nbsp;</td>
          <td width="35%">&nbsp;</td>
        </tr>
        <tr>
          <td height="26"  class="tab_lebel"><strong>Item:----</strong>></td>
          <td class="tab_lebel"><%=scl.viewSingleCommodity2(hrp.getCommodityId()).getItemname()%></td>
          <td  class="tab_lebel"><strong>Date:-------</strong></td>
          <td class="tab_lebel"></strong><%=hrp.getDateoFRequest()%></td>
        </tr>
        <tr>
          <td height="28" class="tab_lebel"><strong>Quantity :----</strong></td>
          <td class="tab_lebel"><%=hrp.getQuantity()%></td>
          <td height="26"  class="tab_lebel"><strong>Autorization:----</strong></td>
          <td class="tab_lebel"><%=hrp.getManager()%></td>
        </tr>
        <tr>
          <td height="14">&nbsp;</td>
          <td></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="24" class="tab_lebel"><strong>Description:----</strong></td>
          <td class="tab_lebel"><%=hrp.getComment()%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="14">&nbsp;</td>
          <td></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="26"  class="tab_lebel">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="28">&nbsp;</td>
          <td></td>
          <td><a href="javascript:window.print();">[print]</a></td>
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
  }catch(Exception ex){
        System.out.println();
  }

%>
    </body>
</html>
