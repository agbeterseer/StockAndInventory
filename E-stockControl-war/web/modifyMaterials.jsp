<%-- 
    Document   : modifyMaterials
    Created on : Jun 17, 2011, 11:25:35 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify materials.</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
   <%

          //  float a = 0.0F;
              String code = request.getParameter("code");
           if(request.getParameter("button") !=null){
            String materialname = request.getParameter("materialname");
            String dateused = request.getParameter("dateused");
            String materialtype = request.getParameter("materialtype");
            String quantityused = request.getParameter("quantityused");
            String amount = request.getParameter("amount");
        
            String commodityname = request.getParameter("commodityname");
           //   Float f = new Float("amount");
        
        try{
         
                msg = scl.modifyMaterials(new HelpMaterials(new Integer(code),materialname,materialtype,quantityused,dateused,new Float(amount),username,commodityname));
                style = "success";
              //String materialName, String materialType, String quantityUsed, String dateUsed, Float amount, String manager
         
        }catch(Exception ex){
                msg = ex.getMessage();
                style = "error";
                System.out.println();
        }
        }
        %>

        <%
        try{
            
            hlp = scl.viewSingleMaterial(new Integer(code));
       
         %>
        <fieldset style="width:800px;">
        <legend class="tableheader">Modify Materials</legend><form action="" method="post" name="form1">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Item</td>
    <td><label>
    <input type="text" name="commodityname" id="commodityname" style="width:200px;" value="<%=hlp.getItemCode()%>">
    </label></td>
    <td class="tab_lebel">DateUsed</td>
    <td><label>
            <input type="text" name="dateused" id="date" style="width:200px;" value="<%=hlp.getDateUsed()%>">
       <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dateused);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a>
    </label></td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td> 
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">MaterialName</span></td>
    <td><input type="text" name="materialname" id="material " style="width:200px;" value="<%=hlp.getMaterialName()%>"></td>
    <td><span class="tab_lebel">Cost</span></td>
    <td><input type="text" name="amount" id="Cost" style="width:200px;" value="<%=hlp.getAmount()%>"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">MaterialType</span></td>
    <td><input type="text" name="materialtype" id="material type" style="width:200px;" value="<%=hlp.getMaterialType()%>"></td>
    <td class="tab_lebel">Size/Quantity</td>
    <td><label>
            <input type="text" name="quantity" id="quantity" style="width:200px;" value="<%=hlp.getQuantityUsed()%>">
    </label></td>
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
    <td><input type="submit" name="button" id="button" value="Modify" class="boton"></td>
    <td>&nbsp;</td>
  </tr>
</table>
    <%
       }catch(Exception ex){
        System.out.println();
        }
        %>
</form>
      <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
     </fieldset>
    </body>
</html>
