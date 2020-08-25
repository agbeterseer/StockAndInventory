<%-- 
    Document   : setUpInventoryCosting
    Created on : Sep 12, 2011, 9:28:50 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Costing setup</title>
          <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%

        String costype = request.getParameter("costype");

        try{
            if(costype !=null && costype !=""){
                
        msg = scl.setUpCost(new helpSetCost(costype, CONFIG.getSET_COSTING()));
            }
        }catch(Exception ex){
        System.out.println();
        }
%>
   <form action="" method="post" onsubmit="return validate(this);"><table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel"> Inventory Costing</td>
    <td><label>
      <select name="costype" id="costype">
        <option value="STANDARD COSTING">STANDARD COSTING</option>
        <option value="WEIGHTED AVERAGE COSTING">WEIGHTED AVERAGE COSTING</option>
      </select>
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="bot">
    </label></td>
  </tr>
</table>
</form>
    </body>
</html>
