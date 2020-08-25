<%-- 
    Document   : singleRequest
    Created on : Jul 28, 2011, 11:36:47 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>single Request</title>
       <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>

        <%
         // ArrayList list = new ArrayList();
        helplogin lo = null;
        String commodityid = request.getParameter("commodityid");
        //String commodityname = request.getParameter("commodityname");
        String dateorrequest = request.getParameter("dateorrequest");
        String comments = request.getParameter("comments");
        String requisitionCode = "";
        String code = request.getParameter("code");
        String quantity = request.getParameter("quantity");
        %>

        <%
         try{
             lo = scl.viewSingleUser(username);
         requisitionCode = lo.getRole().toString();
            if(request.getParameter("button") !=null){

            msg = scl.addRequest(new HelpRequisition(commodityid,dateorrequest,username,requisitionCode,"",comments, new Integer(quantity),""));
            //String commodityId, String commodityName, String dateoFRequest, String manager, String requisitionCode, String role, String comment Integer quantity,String status
            style = "success";
            //System.out.println("requisition code ==="+requisitioncode);
        }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %>
    <form action="" method="post" name="form1">
    <fieldset style="width:800px; ">
    <legend class="tableheader">Requst For Goods</legend>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="19%">&nbsp;</td>
    <td width="27%">&nbsp;</td>
    <td width="50%">&nbsp;</td>
    <td width="4%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Item Name</td>
    <td><label>
    
      <select name="commodityid" id="commodityid" style="width:200px;" >
        <option  value="">--Select one Commodity--</option>
        <%
                            try{
                            ArrayList list = scl.viewAllCommodities();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                               hhcc  = (Helpcommodity)i.next();
                            %>
        <option value="<%=hhcc.getItemcode()%>"<%=(request.getParameter("commodityid") != null && request.getParameter("commodityid").equalsIgnoreCase(hhcc.getItemcode())) ? new String("selected") : new String("")%>><%=hhcc.getItemname()%></option>
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
    <td height="16">&nbsp;</td>
    <td>    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Quantity</td>
    <td><label>
    <input type="text" name="quantity" id="quantity" style="width:200px;"  value="<%=(request.getParameter("quantity") != null) ? request.getParameter("quantity") :new String("")%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">DateoFRequest</td>
    <td>
      <input type="text" name="dateorrequest" id="dateorrequest" style="width:200px;">
     <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dateorrequest);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Comment</td>
    <td><label>
      <textarea name="comments" id="comments" cols="45" rows="5"></textarea>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="15">&nbsp;</td>
    <td><input type="hidden" name="requisitioncode" id="requisitioncode"  value="<%=lo.getRole()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="bot">
    </label></td>
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
