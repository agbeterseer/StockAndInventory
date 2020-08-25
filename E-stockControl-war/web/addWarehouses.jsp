<%-- 
    Document   : addWarehouses
    Created on : Sep 13, 2011, 8:46:51 AM
    Author     : Terseer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add Warehouse</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
<script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
       
    </head>
    <body>
    <%
    String warehouse = request.getParameter("warehouse");
    String addresses = request.getParameter("addresses");
    String capacityi = request.getParameter("capacityi");
    String cdate = request.getParameter("cdate");
    String branchcode = request.getParameter("branchcode");

    try{
    if(request.getParameter("Submit") !=null){
	
       msg = scl.addWareHouse(new helpwarehouse(warehouse,cdate,"",addresses,capacityi,branchcode));
      // scl.addWareHouse(new helpwarehouse(warehouse,cdate,"",addresses,capacityi,branchcode));
       style = "success";
        //String whcode, String houseName, String dateCreated, String status, String address, String capacity, String bcode
       //String houseName, String dateCreated, String address, String capacity, String bcode
        }
    }catch(Exception ex){
    System.out.println();
    }
     %>
    <fieldset style="width:800px;">
    <legend class="tableheader">Add Warehouse</legend>
    <form action=""  name="myForm" method="post" onsubmit="return validate(this);" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" colspan="3" class="<%=style%>"><%=msg%></td>
  </tr>
  <tr>
    <td width="18%"  class="tab_lebel">&nbsp;</td>
    <td width="28%"  class="tab_lebel">Warehouse Name</td>
    <td width="54%"><label>
            <input type="text" name="warehouse" id="warehouse"  style="width:200px;" onblur="validateF(this);">
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Capacity</td>
    <td><label>
      <input type="text" name="capacityi" id="capacity"  style="width:200px;">
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Date Created</td>
    <td><label>
      <input type="text" name="cdate" id="created date" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.myForm.cdate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="tab_lebel">Address</span></td>
    <td><textarea name="addresses" id="addresses" cols="45" rows="5"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="18">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
      
  <td class="tab_lebel">Branch</td>
    <td><label>
      <select name="branchcode" id="branchcode" style="width:200px;" >
          <option value="">....select one.....</option>
               <%
                            try{
                            ArrayList list = scl.viewAllBranch();
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                                hbb = (HelpBranch)i.next();
                %>
      <option value="<%=hbb.getBranchCode()%>"<%=(request.getParameter("branchcode") != null && request.getParameter("branchcode").equalsIgnoreCase(hbb.getBranchCode())) ? new String("selected") : new String("")%> ><%=hbb.getBranchCode()%></option>
                             <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
      </select>
    </label></td>
  
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="Submit" value="Submit" class="bot">
    </label></td>
  </tr>
</table>
</form>
<!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
 </iframe>
</fieldset>
</body>
</html>
