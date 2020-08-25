<%-- 
    Document   : addSections
    Created on : Aug 5, 2011, 11:40:17 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addSections</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
		<script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
       <%
        String secname = request.getParameter("secname");
        String capacity = request.getParameter("capacity");
        String descetiption = request.getParameter("descetiption");
        String warehouse = request.getParameter("warehouse");
                
        try{
            if (request.getParameter("ab") !=null){
                msg = scl.addSections(new HelpSection(new Integer("0"), secname,capacity,descetiption,"",null, warehouse));
                style = "success";
                //Integer sno, String name, String capacity, String description, String status, Integer track
                //String name, String capacity, String description, String status
            }
            }catch(Exception ex){
            style = "error";
            System.out.println();
        }
        %>
<fieldset style="width:800px;">
    <legend class="tableheader">Add Sections</legend>
       <form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="18%">&nbsp;</td>
    <td width="28%" height="23">&nbsp;</td>
    <td width="51%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Warehouse</td>
    <td><label>
      <select name="warehouse" id="warehouse" style="width:200px;"> 
          <option  value="">--Select one Warehouse--</option>
        <%
                            try{
                            ArrayList list =scl.viewAllWareHouses();
                           Iterator i = list.iterator();
                            while(i.hasNext()){
                            hew = (helpwarehouse)i.next();
                            %>
        <option value="<%=hew.getWhcode()%>"<%=(request.getParameter("warehouse") != null && request.getParameter("warehouse").equalsIgnoreCase(hew.getWhcode())) ? new String("selected") : hew.getHouseName()%>><%=hew.getHouseName()%></option>
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
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Seciont Name</td>
    <td><input type="text" name="secname" id="secname" style="width:200px;"></td>
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
    <td class="tab_lebel">Section Capacity</td>
    <td><input type="text" name="capacity" id="capacity" style="width:200px;"></td>
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
    <td class="tab_lebel">Section Description</td>
    <td><label>
      <textarea name="descetiption" id="descetiption" cols="45" rows="5"></textarea>
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="ab" id="ab" value="Submit" class="bot">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form> 
</fieldset>
</body>
</html>
