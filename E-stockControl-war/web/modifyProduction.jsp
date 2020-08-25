<%-- 
    Document   : modifyProduction
    Created on : Jun 15, 2011, 2:31:49 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify Production</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
       
        <%
        String commodidtytype = request.getParameter("commodidtytype");
        String materialused = request.getParameter("materialused");
        String quantityproduced = request.getParameter("quantityproduced");
        String dateofproduction = request.getParameter("dateofproduction");
        String code = request.getParameter("code");
	String commodityname = request.getParameter("commodityname");
        %>
     
        <%
        try{
        if(request.getParameter("button") !=null ){

           msg = scl.modifyProduction(new HelpProduction(commodidtytype, quantityproduced, materialused, dateofproduction, username, code));

           msg = scl.ProductionHistory(new HelpProduction(commodidtytype, quantityproduced, materialused, dateofproduction, username, code, "modified"));

           style = "success";
        }
        }catch(Exception ex){
        style = "error";
        //System.out.println();
        }
        %>
        <%
        try{
            hpr = scl.viewSingleProduction(code);
        %>
        <form name="form1" action="" method="post" onsubmit="return validate(this);">
     <fieldset style="width:800px; ">
    <legend class="tableheader">Modify Production</legend>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      
      <tr>
       <td height="21" colspan="4" class="<%=style%>"><%=msg%></td>
      </tr>
      <tr>
        <td width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
      <tr>
        <td class="tab_lebel" >commodity Name</td>
      <td><label>
              <input type="text" name="commodityname" id="commodityname" style="width:200px;" value="<%=scl.viewSingleCommodity2(hpr.getCommodityid()).getItemname()%>" readonly>
      </label></td>
      <td  class="tab_lebel">matrialsUsed</td>
      <td><label>
        <input type="text" name="materialused" id="materialused" style="width:200px;" value="<%=hpr.getMatrialsUsed()%>" >
        </label></td>
    </tr>
      <tr>
        <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
      <tr>
        <td  class="tab_lebel">commodityType</td>
      <td><label>
        <input type="text" name="commodidtytype" id="commodidtytype" style="width:200px;" value="<%=hpr.getCommodityType()%>" >
      </label></td>
      <td  class="tab_lebel">dateOfProduced</td>
      <td><label>
        <input type="text" name="dateofproduction" id="dateofproduction" style="width:200px;" value="<%=hpr.getDateOfProduced()%>">
         <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dateofproduction);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
    </tr>
      <tr>
        <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
      <tr>
        <td height="26"><span class="tab_lebel">quantityProduced</span></td>
      <td><input type="text" name="quantityproduced" id="quantityproduced" style="width:200px;" value="<%=hpr.getQuantityProduced()%>"></td>
      <td><label></label></td>
      <td>&nbsp;</td>
    </tr>
      <tr>
        <td height="26">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="26">&nbsp;</td>
        <td>&nbsp;</td>
        <td><input type="submit" name="button" id="button" class="bot" value="Modify"></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
     <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    <%
        }catch(Exception ex){
        response.sendRedirect("errorpage.jsp");
        } 
    %>
    </body>
</html>
