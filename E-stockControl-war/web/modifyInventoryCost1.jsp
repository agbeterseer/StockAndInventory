<%-- 
    Document   : modifyInventoryCost1
    Created on : Oct 28, 2011, 3:55:47 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify item cost</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
     <%
        String code = request.getParameter("code");
        String purches = request.getParameter("purches");
        String expense = request.getParameter("expense");
        String commodityname = request.getParameter("commodityname");
        String matcost  = request.getParameter("matcost");
        String exchangerate = request.getParameter("exchangerate");
        String freight = request.getParameter("freight");
        String dateadded = request.getParameter("dateadded");

            try{
                if(request.getParameter("button2") !=null){

                msg = scl.addInventoryCost2(new HelpInventoryCost(code, dateadded, new Float(expense), new Float(purches), new Float(exchangerate), new Float(freight)));
                        //String itemCode, String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight

                }
            }catch(Exception ex){
            System.out.println();
            }
            %>
            <%

                try{

                   hic = scl.viewSingleInventoryCost(code);


                    %>
     <fieldset style="width:800px;"><legend class="tableheader">Importers Item Cost</legend>
 <form action="" method="post" name="myform">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="30" colspan="3" class="<%=style%>"><%=msg%></td>
  </tr>
  <tr>
    <td class="tab_lebel">Item</td>
    <td><input type="text" name="commodityname" id="commodityname" style="width:200px;" value="<%=scl.viewSingleCommodity2(code).getItemname()%>" readonly></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="39%">&nbsp;</td>
    <td width="36%">&nbsp;</td>
    <td width="25%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Expenses</td>
    <td><label>
      <input type="text" name="expense" id="expense" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Purches Cost</td>
    <td><label>
      <input type="text" name="purches" id="purches" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Exchange rate</td>
      <td><label>
        <input type="text" name="exchangerate" id="exchangerate" style="width:200px;">
      </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Freight</td>
    <td><label>
      <input type="text" name="freight" id="freight" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Date</td>
    <td><input type="text" name="dateadded" id="dateadded" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myform.dateadded);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button2" id="button2" value="Submit" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
         <%
          }catch(Exception ex){
            System.out.println();
          }
        %>
  <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    </body>
</html>
