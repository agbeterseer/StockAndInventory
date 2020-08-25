<%-- 
    Document   : viewSingleSupply
    Created on : May 5, 2016, 11:13:00 AM
    Author     : JPT TERSOO AGBE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Single Supply</title>
           <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
        <%


        String code = request.getParameter("code");
//HelpSupply hsup = null;

        try{
         hsup = scl.viewSingleSupply(new Integer(code));


        }catch(Exception ex){

        System.out.println();
        }

        %>
        <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tableheader3">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="even"  >
      <tr>
        <td width="20%" height="21">&nbsp;</td>
        <td colspan="2"><div align="center"><samp style="font-size:10; color: #000000"> Single Record</samp> <samp style="font-size:10; color:#FFFFFF">Invoice</samp></div></td>
        <td width="23%"><div align="right"><a href="javascript:window.print();">[print]</a></div></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right"><samp style="font-size:10">Date:&nbsp;&nbsp;</samp></td>
        <td class="tab_lebel"><%=hsup.getDateSupplied()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td width="24%">&nbsp;</td>
        <td width="33%">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="18"><div align="right"><samp style="font-size:10">Item:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"> <%=scl.viewSingleCommodity2(hsup.getCommodityId()).getItemname()%></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Name:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=hsup.getDistributorId()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><samp style="font-size:10">&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Address:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=hsup.getLocation()%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><samp style="font-size:10">Quantity:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=hsup.getQuantitySupplied()%></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Phone Number:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=hsup.getPhonenumber()%></td>
      </tr>
      <tr>
        <td><div align="right"><samp style="font-size:10">Quantity Left:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=scl.viewSingleCommodity22(hsup.getCommodityId()).getQuantityIn()%></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td ></td>
        <td align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableheader">
        
        </table></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp; </td>
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
    </body>
</html>
