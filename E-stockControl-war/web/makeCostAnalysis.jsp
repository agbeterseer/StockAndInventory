<%-- 
    Document   : makeCostAnalysis
    Created on : Aug 19, 2011, 11:05:56 AM
    Author     : Terseer
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>makeCostAnalysis</title>
          <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%@include  file="lookUp.jsp"%>
       <%
String material = request.getParameter("material");
String materiacost = request.getParameter("materiacost");
String item = request.getParameter("commodityname");
String dateadded = request.getParameter("dateadded");

       try{
            if(material !=null && material !="" && materiacost !=null && materiacost !="" && item !=null && item !="" && dateadded !=null && dateadded !=""){

                msg = scl.addCostAnalysis(new HelpCostAnalysis(material,new Float(materiacost),item,dateadded));
                style = "success";
                //String materials, Float amount, String itemCode, String dateAdded
            }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
         %>
     <fieldset style="width:800px;">
     <legend class="tableheader">Modify Materials</legend>
     <form action="" method="post" name="myform" id="myform" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="19%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
    <td width="54%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Material</td>
    <td><label>
      <input type="text" name="material" id="material" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">MaterialCost</td>
    <td><label>
      <input type="text" name="materiacost" id="materiacost" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Item</td>
    <td><label>
    <select name="commodityname" id="commodityname" style="width:200px;">
      <option  value="">--Select one Commodity--</option>
      <%
                            try{
                            ArrayList list =scl.viewAllCommodities();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                            hhcc  = (Helpcommodity)i.next();
                            %>
      <option value="<%=hhcc.getItemname()%>"><%=hhcc.getItemname()%></option>
      <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
    </select>
</label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel"> Date </td>
    <td><input type="text" name="dateadded" id="dateadded" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myform.dateadded);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label></label></td>
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
    <td><input type="submit" name="button" id="button" value="Submit" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>

    </fieldset>
      <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    </body>
</html>
