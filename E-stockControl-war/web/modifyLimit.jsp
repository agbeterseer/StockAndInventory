<%-- 
    Document   : modifyLimit
    Created on : Jul 7, 2011, 1:39:12 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify Limit</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
          <%
        String limitcode = request.getParameter("limitcode");
        String lowerlimit = request.getParameter("lowerlimit");
        String upperlimit = request.getParameter("upperlimit");
        String code = request.getParameter("code");

        try{
            if (request.getParameter("button") !=null){

                msg = scl.modifyLimits(new HelpLimit(limitcode,lowerlimit,upperlimit,whcode));
                style = "success";
            }
           
        }catch(Exception ex){
                style = "error";
        System.out.println();
        }
        %>

        <%
        try{

            //String id, String whcode
            hp = scl.viewSingleLimit(code, whcode);
            
        }catch(Exception ex){
        System.out.println();
        }
        %>
 <fieldset style="width:800px;">
 <legend>Modify Limits</legend>
 <form action="" method="post" name="form1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3" class="<%=style%>"><%=msg%></td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>CommodityName</td>
    <td><label>
            <input type="text" name="limitcode" id="limitcode" style="width:200px;" value="<%=hp.getCommodityCode()%>" readonly>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Lower Limit</td>
    <td><label>
      <input type="text" name="lowerlimit" id="lowerlimit" style="width:200px;" value="<%=hp.getLowerLimit()%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Upper Limit</td>
    <td><label>
      <input type="text" name="upperlimit" id="upperlimit" style="width:200px;" value="<%=hp.getUpperLimit()%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Modify" class="boton">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
    </body>
</html>
