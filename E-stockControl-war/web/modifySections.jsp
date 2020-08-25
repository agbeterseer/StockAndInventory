<%-- 
    Document   : modifySections
    Created on : Aug 6, 2011, 12:10:28 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>modifySections</title>
         <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>



        <%
        String secname = request.getParameter("secname");
        String capacity = request.getParameter("capacity");
        String descetiption = request.getParameter("descetiption");
        String code = request.getParameter("code");
        String warehouse = request.getParameter("warehouse");

        try{
            if (secname !=null && secname !="" && capacity !=null && capacity !="" && descetiption !=null && descetiption !=""){

                msg = scl.modifySections(new HelpSection(new Integer(code), secname,capacity,descetiption, "", null,warehouse));
                //new Integer("0"), secname,capacity,descetiption,"",null, warehouse

                style = "success";
                //String name, String capacity, String description, String status
            }
            }catch(Exception ex){
           style = "error";
        System.out.println();

        }
        %>

        <%
        try{
            
        hss = scl.viewSingleSection(new Integer(code));
        
         %>
<fieldset style="width:800px;">
    <legend>Modify Sections</legend>
       <form action="" method="post"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" colspan="3" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td height="23">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="23" class="tab_lebel">Warehouse</td>
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
    <td height="23">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Seciont Name</td>
    <td><input type="text" name="secname" id="secname" style="width:200px;" value="<%=hss.getName()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Section Capacity</td>
    <td><input type="text" name="capacity" id="capacity" style="width:200px;"  value="<%=hss.getCapacity()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Section Description</td>
    <td><label>
      <textarea name="descetiption" id="descetiption" cols="45" rows="5"> <%=hss.getDescription()%></textarea>
    </label></td>
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
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="boton">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
    <%

 }catch(Exception ex){
        System.out.println();
 }
    %>
</body>
</html>
