<%-- 
    Document   : manufacturersItemCost
    Created on : Oct 27, 2011, 9:48:06 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>manufacturersItemCost</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%
        try{
        String code = request.getParameter("code");
        String purches = request.getParameter("purches");
        String expense = request.getParameter("expense");
        String commodityname = request.getParameter("commodityname");
        String matcost  = request.getParameter("matcost");
        String labourcost = request.getParameter("labourcost");
        String overheadcost = request.getParameter("overheadcost");
        String dateadded = request.getParameter("dateadded");
        String meoo = "";

            try{
                     
                if(request.getParameter("button") !=null){
                 hs = scl.viewSingleCommodity2(code);
                  hhcc = scl.viewSingleCommodity2(hs.getCommodityId());

                  meoo =  hhcc.getItemname();
		
                msg = scl.addInventoryCost(new HelpInventoryCost(code,new Float(matcost),new Float(labourcost),new Float(overheadcost),null,dateadded));
                    //String itemCode, String materialCost, String labourCost, String overheadCost,Float actualCost,String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight 
                   //Integer sno, Integer itemCode, Float materialCost, Float labourCost, Float overheadCost,Float actualCost,String dateCreated,Float expenses,Float purchesCost,Float exchangeRate,Float freight
                    style = "success";
                }
                
              hs = scl.viewSingleCommodity2(new Integer(code));
              hhcc = scl.viewSingleCommodity2(hs.getCommodityId());

              meoo =  hhcc.getItemname();

            }catch(Exception ex){
                msg = msg;
                style = "error";
                System.out.println();
            }
            %>

         <fieldset style="width:800px;">
            <legend class="tableheader">Manufacturers Item Cost</legend>
        <form action="" method="post" name="myform">
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" colspan="3"  class="<%=style%>"><%=msg%></td>
  </tr>
  <tr>
    <td width="19%" class="tab_lebel">&nbsp;</td>
    <td width="27%" class="tab_lebel">Item</td>
    <td width="54%"><label>
            <input type="text" name="commodityname" id="commodityname" style="width:200px;" value="<%=meoo%>" readonly>
    </label></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Material Cost</td>
    <td><label>
            <%
            if(request.getParameter("code") !=null){
                            try{
                           int sum = 0;
                           ArrayList lisft = scl.viewAllMaterialsByItemCode(code);
                           Iterator i = lisft.iterator();
                            while(i.hasNext()){
                            hlp = (HelpMaterials)i.next();

                            sum +=hlp.getAmount().intValue();

                            }
              %>
               <input type="text" name="matcost" id="matcost" style="width:200px;" value="<%=sum%>">
                <% }catch(Exception ex){
                            ex.getMessage();
                            }
                            }
                 %>
    </label></td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Labour Cost</td>
    <td><label>
      <input type="text" name="labourcost" id="labourcost" style="width:200px;">
    </label></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="tab_lebel">Overhead Cost</span></td>
    <td><input type="text" name="overheadcost" id="overheadcost" style="width:200px;"></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Date</td>
    <td><input type="text" name="dateadded" id="dateadded" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myform.dateadded);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" class="bot"></td>
  </tr>
</table>
</form>
</fieldset>
  <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
 <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
 </iframe>
</body>
</html>
<%

  }catch(Exception ex){
response.sendRedirect("errorpage.jsp");
 }
%>