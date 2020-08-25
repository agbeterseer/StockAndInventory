<%-- 
    Document   : modifyItems
    Created on : Oct 14, 2011, 10:08:12 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modifyItems</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
    <%
        String code = request.getParameter("code");
        String commodityId = request.getParameter("commodityId");
        String commodidtyname = request.getParameter("commodidtyname");
        String commodidtytype = request.getParameter("commodidtytype");
        String addeddate = request.getParameter("addeddate");
        String makeorbuy = request.getParameter("makeorbuy");
        String category = request.getParameter("category");
	String lo = request.getParameter("lo");
        
        try{
              if(request.getParameter("button") !=null){

                msg = scl.modifyItems(new Helpcommodity(code,commodidtyname,category,makeorbuy,commodidtytype,username,addeddate,"",lo,whcode));
                //String itemcode, String itemname, String category, String makeorbuy, String description, String authorisation, String dateadded, String del
                style = "success";
            }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %>
        <%
          try{

            if(code !=null){

            hhcc = scl.viewSingleCommodity2(code);

            hp = scl.viewSingleLimit(code, whcode);

          
                %>
 <fieldset style="width:800px;">
          <legend class="tableheader">Modify Items</legend>
    <form action="" method="post" name="myform" onsubmit="return validate(this);">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" colspan="5" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="15%" height="21">&nbsp;</td>
    <td width="29%">&nbsp;</td>
    <td width="40%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel" >&nbsp;</td>
    <td class="tab_lebel" >CommodityName<font color="#FF0000">*</font></td>
    <td><input type="text" name="commodidtyname" id="commodidtyname" style="width:200px;" value="<%=(request.getParameter("lo") != null) ? request.getParameter("lo") : hhcc.getItemname()%>"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">AddedDate<font color="#FF0000">*</font></td>
    <td><input type="text" name="addeddate" id="addeddate" style="width:200px;"  value="<%=hhcc.getDateadded()%>">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myform.addeddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel" >&nbsp;</td>
    <td class="tab_lebel" >Make Or Buy<font color="#FF0000">*</font></td>
    <td><label>
    <select name="makeorbuy" id="makeorbuy" style="width:200px;">
      <option value="...Select One...">---Select One---</option>
           <option value="<%=CONFIG.getSTOCK_ITEM_BUY()%>"<%=(request.getParameter("makeorbuy") != null && request.getParameter("makeorbuy").equalsIgnoreCase(CONFIG.getSTOCK_ITEM_BUY())) ? new String("selected") : new String("")%>><%=CONFIG.getSTOCK_ITEM_BUY()%></option>
            <option value="<%=CONFIG.getSTOCK_ITEM_MAKE()%>"<%=(request.getParameter("makeorbuy") != null && request.getParameter("makeorbuy").equalsIgnoreCase(CONFIG.getSTOCK_ITEM_MAKE())) ? new String("selected") : new String("")%>><%=CONFIG.getSTOCK_ITEM_MAKE()%></option>
          </select>
    </label></td> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Category<font color="#FF0000">*</font></td>
    <td><label>
      <select name="category" id="category" style="width:200px;">
    <option  value="">--Select one Commodity--</option>
            <%
                            try{
                            ArrayList list = scl.viewAllCategory();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                               hcc  = (HelpCategory)i.next();
                            %>
            <option value="<%=hcc.getStockItemType()%>"<%=(request.getParameter("category") != null && request.getParameter("category").equalsIgnoreCase(hcc.getStockItemType())) ? new String("selected") : new String("")%>><%=hcc.getStockItemType()%></option>
            <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
      </select>
    </label></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Lower Limit<font color="#FF0000">*</font></td>
    <td><label>
      <input type="text" name="lo" id="lo" style="width:200px;"  value="<%=(request.getParameter("lo") != null) ? request.getParameter("lo") :hp.getLowerLimit()%>">
    </label></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="tab_lebel">Description</span></td>
    <td><textarea name="commodidtytype" id="commodidtytype" cols="45" rows="5"><%=hhcc.getDescription()%></textarea></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" class="boton"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
    </fieldset>
  <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
  <% 
    }  

           }catch(Exception ex){
             System.out.println();
            }
  
            %>

    </body>
</html>
