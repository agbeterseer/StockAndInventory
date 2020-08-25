<%-- 
    Document   : modifyUnits
    Created on : Jun 29, 2011, 7:54:06 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify units</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%

        String unitname = request.getParameter("unitname");
        String unittype = request.getParameter("unittype");
        String unitcode = request.getParameter("unitcode");
        String commoditytype = request.getParameter("commoditytype");
        String code = request.getParameter("code");


        try{

            if(request.getParameter("button") !=null){

                msg = scl.modifyUnits(new helpUits(unitname,unittype, commoditytype,unitcode,whcode,new Integer(code)));
                        //Integer id, String unitName, String unitType, String commodidtyType
                style = "success";
        }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %>
        <%
         try{
              hu = scl.viewSingleUnit(code,whcode);
        %>
        <fieldset style="width:800px;"><legend>Add Materials</legend>
        <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td  class="tab_lebel">&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">Unit Code</span></td>
    <td><input type="text" name="unitcode" id="unitcode" style="width:200px;" value="<%=hu.getUnitcode()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">UnitName</span></td>
    <td><input type="text" name="unitname" id="unitname" style="width:200px;" value="<%=hu.getUnitName()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">unitType</span></td>
    <td><input type="text" name="unittype" id="unittype" style="width:200px;" value="<%=hu.getUnitType()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">commodidtyType</span></td>
    <td><input type="text" name="commoditytype" id="commoditytype" style="width:200px;" value="<%=hu.getCommodidtyType()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Modify" class="boton"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
    <%  }catch(Exception ex){


            }
%>
    </body>
</html>
