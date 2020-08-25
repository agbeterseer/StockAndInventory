<%-- 
    Document   : addCategory
    Created on : Sep 30, 2011, 10:43:18 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addCategory</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
</head>
    <body>
        <%
            String stockitemtype = request.getParameter("stockitemtype");
            String description = request.getParameter("description");
             try{

            if (request.getParameter("button") !=null){

              msg = scl.addCategory(new HelpCategory("",stockitemtype,description,""));

              style = "success";
            }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %>
              <fieldset style="width:800px;">
            <legend class="tableheader">Add Category</legend>
<form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td height="18" colspan="4" class="tableheader"><samp style="font-size:11px">The stock type - the category may relates to [<strong>service items</strong>], <strong>[finished goods items]</strong> or <strong>[raw
      material items]</strong></samp></td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="14%" class="tab_lebel">&nbsp;</td>
    <td width="27%" class="tab_lebel"> Stock Item Type</td>
    <td width="37%"><label>
      <input type="text" name="stockitemtype" id="stockitemtype" style="width:200px;">
      </label></td>
    <td width="22%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Description</td>
    <td>
      <textarea name="description" id="description" cols="45" rows="5"></textarea>    </td>
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
      <input type="submit" name="button" id="button" value="Submit" class="bot">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</fieldset>
    </body>
</html>
