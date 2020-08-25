<%-- 
    Document   : addUnits
    Created on : Jun 29, 2011, 5:47:30 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add units</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
       <%
        String unitcode = request.getParameter("unitcode");
        String unitname = request.getParameter("unitname");
        String unittype = request.getParameter("unittype");
       // String commoditytype = request.getParameter("commoditytype");
        String warehouse = request.getParameter("warehouse");
        
        try{
            if(request.getParameter("button") !=null){
                msg = scl.addUnits(new helpUits(null,unitname,unittype, "", unitcode,warehouse));
                //Integer sno, String unitName, String unitType, String commodidtyType, String unitcode, String whcode
                //Integer id, String unitName, String unitType, String commodidtyType
                style = "success";
            }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
       %>
        <fieldset style="width:800px;">
        <legend class="tableheader">Add Units</legend>
        <form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="18%"  class="tab_lebel">&nbsp;</td>
    <td width="28%" height="22"  class="tab_lebel">Warehouse</td>
    <td width="50%"><select name="warehouse" id="warehouse" style="width:200px;">
      <option  value="">--Select one Warehouse--</option>
      <%
                            try{
                            ArrayList list =scl.viewAllWareHouses();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                            hew = (helpwarehouse)i.next();

                           // if(! hew.getWhcode().equalsIgnoreCase(whcode)){
                            %>
      <option value="<%=hew.getWhcode()%>"<%=(request.getParameter("warehouse") != null && request.getParameter("warehouse").equalsIgnoreCase(hew.getWhcode())) ? new String("selected") : hew.getHouseName()%>><%=hew.getHouseName()%></option>
      <%
                          //  }
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
        %>
    </select></td>
    <td width="4%">&nbsp;</td>
  </tr>
  <tr>
    <td  class="tab_lebel">&nbsp;</td>
    <td height="22"  class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td  class="tab_lebel">&nbsp;</td>
    <td  class="tab_lebel">Unit Code</td>
    <td><label>
      <input type="text" name="unitcode" id="unitcode" style="width:200px;">
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
    <td class="tab_lebel">UnitName</td>
    <td><label>
      <input type="text" name="unitname" id="unitname" style="width:200px;">
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
    <td class="tab_lebel">unitType</td>
    <td><label>
      <input type="text" name="unittype" id="unittype" style="width:200px;">
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
    </body>
</html>
