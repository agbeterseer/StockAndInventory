<%-- 
    Document   : modifyWarehouses
    Created on : Sep 19, 2011, 11:49:36 AM
    Author     : Terseer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Warehous</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script type="text/ecmascript" language="javascript"  src="js/validation.js"></script>
    </head>
    <body>
   <%
    String code = request.getParameter("code");
    System.out.println("codeddddddd" +code);

        session.setAttribute("code", code);
        String codeme = session.getAttribute("code").toString();
     try{
   if(request.getParameter("mwhouse") !=null){
       
    String warehouse = request.getParameter("warehouse");
    String addresses = request.getParameter("addresses");
    String capacityi = request.getParameter("capacityi");
    String cdate = request.getParameter("cdate");
   

    
  try{
      System.out.println("after submit code" +codeme);
       

        scl.modifyWarehouse(new helpwarehouse(codeme, warehouse, cdate,"",addresses, capacityi,""));
        //String whcode, String houseName, String dateCreated, String status, String address, String capacity/
        

    }catch(Exception ex){
    System.out.println();
    }
    }
      %>

      <%
            try{
                   hew = scl.viewSingleWarehouse(codeme);

%>
    <fieldset style="width:800px;">
    <legend class="tableheader">Modify Warehouse</legend>
<form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="18%">&nbsp;</td>
    <td width="26%">&nbsp;</td>
    <td width="56%">&nbsp;</td>
  </tr>
  <tr>
    <td height="27" colspan="3" class="<%=style%>"><%=msg%></td>
  </tr>
  <tr>
    <td  class="tab_lebel">&nbsp;</td>
    <td  class="tab_lebel">Warehouse Name</td>
    <td><label>
            <input type="text" name="warehouse" id="warehouse"  style="width:200px;" value="<%=hew.getHouseName()%>">
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
      <input type="text" name="capacityi" id="capacityi"  style="width:200px;" value="<%=hew.getCapacity()%>">
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
      <input type="text" name="cdate" id="created date" style="width:200px;" value="<%=hew.getDateCreated()%>">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="tab_lebel">Address</span></td>
    <td><textarea name="addresses" id="addresses" cols="45" rows="5"><%=hew.getAddress()%></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="mwhouse" id="mwhouse" value="Submit"  class="bot"></td>
  </tr>
</table>
</form>
</fieldset>
    <%
    }catch(Exception ex){
    System.out.println();
    }

  }catch(Exception ex){
    System.out.println();
    }

            %>
</body>
</html>
