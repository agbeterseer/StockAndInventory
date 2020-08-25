<%-- 
    Document   : addProduction
    Created on : Jun 15, 2011, 11:36:28 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addProduction</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
      
        <%
        String commodidtytype = request.getParameter("commodidtytype");
        String materialused = request.getParameter("materialused");
        String quantityproduced = request.getParameter("quantityproduced");
        String dateofproduction = request.getParameter("dateofproduction");
        String commodityname = request.getParameter("commodityname"); 
        %>
     
        <%
        
         try{
         if(request.getParameter("button") !=null ){
             
         msg = scl.addProduction(new HelpProduction(commodidtytype, quantityproduced, materialused, dateofproduction, username, commodityname));
         
         msg = scl.ProductionHistory(new HelpProduction(commodidtytype, quantityproduced, materialused, dateofproduction, username, commodityname, "1"));

                  //String commodityType, String quantityProduced, String matrialsUsed, String dateOfProduced, String manager
         style = "success";
         }
        }catch(Exception ex){
         style = "error";
        System.out.println();
        }
        %>
  <form action="" method="post" name="form1" onsubmit="return validate(this);">
    <fieldset style="width:800px;">
    <legend class="tableheader">Add Items Produced</legend>
    <table width="100%" border="0"  cellpadding="0" cellspacing="0">
      <tr>
        <td height="21" colspan="4" class="<%=style%>"><%=msg%></td>
      </tr>
      <tr>
        <td width="13%">&nbsp;</td>
        <td width="29%">&nbsp;</td>
        <td width="37%">&nbsp;</td>
        <td width="21%">&nbsp;</td>
      </tr>
      <tr>
        <td class="tab_lebel">&nbsp;</td>
        <td class="tab_lebel">Item Name</td>
        <td><label>
                <select name="commodityname" id="commodityname" style="width:200px;" onchange="this.form.submit();">
            <option  value="">--Select one Item-</option>
            <%
                            try{
                            ArrayList list = scl.viewAllCommodities();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                               hhcc  = (Helpcommodity)i.next();
                               if(!hhcc.getMakeorbuy().equalsIgnoreCase(CONFIG.getSTOCK_ITEM_BUY())){
                            %> 
            <option value="<%=hhcc.getItemcode()%>"<%=(request.getParameter("commodityname") != null && request.getParameter("commodityname").equalsIgnoreCase(hhcc.getItemcode())) ? new String("selected") : new String("")%>><%=hhcc.getItemname()%></option>
            <%
                            }
                               }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
          </select>
        </label></td>
        <td  class="tab_lebel">&nbsp;</td>
      </tr>
      <tr>
        <td height="18">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td  class="tab_lebel">&nbsp;</td>
        <td  class="tab_lebel">Item Category</td>
        <td><label>
                <% if(request.getParameter("commodityname") !=null){%>
                <input type="text" name="commodidtytype" id="commodidtytype" style="width:200px;"  value="<%=hhcc.getCategory()%>" readonly>
               <%}%>
        </label></td>
        <td  class="tab_lebel">&nbsp;</td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="26"><span class="tab_lebel">Quantity Produced</span></td>
        <td><input type="text" name="quantityproduced" id="quantityproduced" style="width:200px;"></td>
        <td><label></label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="18">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="tab_lebel">&nbsp;</td>
        <td class="tab_lebel">Date Produced</td>
        <td><label>
          <input type="text" name="dateofproduction" id="dateofproduction" style="width:200px;">
        <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dateofproduction);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="26">&nbsp;</td>
        <td><input type="submit" name="button" id="button" class="bot" value="Submit"></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </fieldset>
    </form>
     <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    </body>
</html>
