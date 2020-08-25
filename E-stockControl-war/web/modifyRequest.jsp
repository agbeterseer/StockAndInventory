<%-- 
    Document   : modifyRequest
    Created on : Jul 5, 2011, 10:37:14 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modify Request</title>
          <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
  
        <%
        String commodityid = request.getParameter("commodityid");
        String commodityname = request.getParameter("commodityname");
        String dateorrequest = request.getParameter("dateorrequest");
        String comments = request.getParameter("comments");
        String requisitioncode = request.getParameter("requisitioncode");
        String code = request.getParameter("code");
        String quantity = request.getParameter("quantity");
           helplogin hl = null;
        %>

        <%

        try{
             hl = scl.viewSingleUser(username);
        //  requisitionCode = lo.getRole().toString();
            if(request.getParameter("button") !=null){

            msg = scl.modifyRequest(new HelpRequisition(new Integer(code),"",dateorrequest,username,requisitioncode,"",comments, new Integer(quantity),""));
            //String commodityId, String commodityName, String dateoFRequest, String manager, String requisitionCode, String role, String comment
            style = "success";
          //  System.out.println("requisition code ==="+requisitioncode);
        }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %>

        <%
        try{
            if(code !=null){

            hrp = scl.viewSingleRequisition(new Integer(code));
            
         %>
        <form action="" method="post" name="form1">
            <fieldset style="width:800px; ">
    <legend class="tableheader">Modify Requst For Goods</legend>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td height="22" colspan="3" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="31%" class="tab_lebel">&nbsp;</td>
<td width="67%"><label>
            <input type="hidden" name="commodityid" id="commodityid" style="width:200px;" value="<%=code%>" readonly>
    </label></td>
    <td width="2%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Quantity</td>
    <td><label>
      <input type="text" name="quantity" id="quantity" style="width:200px;" value="<%=hrp.getQuantity()%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">DateoFRequest</td>
    <td><label>
      <input type="text" name="dateorrequest" id="dateorrequest" style="width:200px;" value="<%=hrp.getDateoFRequest()%>">
     <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dateorrequest);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""> </a></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Comment</td>
    <td><label>
      <textarea name="comments" id="comments" cols="45" rows="5"><%=hrp.getCommodityId()%></textarea>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="15">&nbsp;</td>
    <td><input type="hidden" name="requisitioncode" id="requisitioncode"  value="<%=hl.getRole()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td></td>
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
</fieldset>
    </form>
    <%
    }
      }catch(Exception ex){
        System.out.println();

        }
       %>
     <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
    </body>
</html>
