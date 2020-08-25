<%-- 
    Document   : setCost
    Created on : Aug 22, 2011, 9:39:06 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>setCost</title>
   <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>  
               <%
                String costtype = request.getParameter("costtype"); 
                try{
                    
                    if (costtype !=null && costtype !=""){
                      msg = scl.changeCostingMethod(new helpSetCost (costtype,""));
                     }
                }catch(Exception ex){
                    System.out.println();
                }
                 %>
 <form action="" method="post" onsubmit="return validate(this);"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="17" colspan="2" class="tableheader"><strong>..::: INVENTORY COSTING..::</strong></td>
    </tr>
  <tr>
    <td height="35" colspan="2"  class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td height="28" class="tab_lebel">Cost Type</td> 
    <td><label>
      <select name="costtype" id="costtype">
        <option value="STANDARD COSTING"<%=request.getParameter("costtype") != null && request.getParameter("costtype").equalsIgnoreCase("STANDARD COSTING") ? new String("selected") : new String("")%>>STANDARD COSTING</option>
        <option value="WEIGHTED AVERAGE COSTING"<%=request.getParameter("costtype") != null && request.getParameter("costtype").equalsIgnoreCase("WEIGHTED AVERAGE COSTING") ? new String("selected") : new String("")%>>WEIGHTED AVERAGE COSTING</option>
        </select>
    </label></td>
    </tr>
  <tr>
    <td height="19">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td ><label>
      <input type="submit" name="button" id="button" value="OK" class="bot">
    </label></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
 </form>
    </body>
</html>
