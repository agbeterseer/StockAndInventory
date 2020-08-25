<%-- 
    Document   : completeSupplyForOfficeEdition
    Created on : Oct 26, 2011, 11:32:44 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supply Office Edition</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
     <%

   
        Float yea = null;
        String fl =  "";
        
        try{
            // session.setAttribute("restt", p.toString());
        String commodityId = session.getAttribute("commodityId").toString();
         String category = session.getAttribute("category").toString();
        String distributor = session.getAttribute("distributor").toString();
        String address = session.getAttribute("address").toString();
        String fonenumber = session.getAttribute("fonenumber").toString();
        String quantitysupplied = session.getAttribute("quantitysupplied").toString();
        String dos = session.getAttribute("dos").toString();

        String restt = session.getAttribute("restt").toString();

        yea = new Float(restt);

        System.out.println("yea"+yea);
        fl = yea.toString();

        System.out.println("Inside Invoice==="+restt);
        //if(request.getParameter("button") !=null){
       // msg = scl.modifySupply1(new HelpSupply(commodityId, new Float(restt),whcode));
       // msg = scl.makeSupply1(commodityId,username,distributor,dos, new Integer(quantitysupplied),new Float(restt),whcode);
       // response.sendRedirect("makeSupply.jsp");
      // }
       
         %>
   <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0" class="tableheader3">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0"   class="even">
      <tr>
        <td width="20%" height="21">&nbsp;</td>
        <td colspan="2"><div align="center"><samp style="font-size:10; color: #000000">Transaction</samp></div></td>
        <td width="21%"><div align="right"><a href="javascript:window.print();">[print]</a></div></td>
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
        <td align="right">Date:&nbsp;&nbsp;</td>
        <td class="tab_lebel"><%=dos%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td width="28%">&nbsp;</td>
        <td width="31%">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="18"><div align="right"><samp style="font-size:10">Item:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"> <%=scl.viewSingleCommodity2(commodityId).getItemname()%></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Name:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=distributor%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><samp style="font-size:10">Item Category:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=scl.viewSingleCategory(category).getStockItemType()%></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Address:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=address%></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><samp style="font-size:10">Quantity:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=quantitysupplied%></td>
        <td><div align="right"><samp style="font-size:10">Destributor's Phone Number:&nbsp;&nbsp;</samp></div></td>
        <td class="tab_lebel"><%=fonenumber%></td>
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
