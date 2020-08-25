<%-- 
    Document   : createLimits
    Created on : Jul 13, 2011, 3:05:52 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>create Limits</title>
 <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
		 <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%
            String category = request.getParameter("category");
            String lowerlimit = request.getParameter("lowerlimit");
            String upperlimit = request.getParameter("upperlimit");
        %>

        <%

            try {

                if (request.getParameter("button") !=null) {

                    msg = scl.addLimit(new HelpLimit(category, lowerlimit, upperlimit,whcode));
                    style = "success";

                }
            } catch (Exception ex) {
                style = "error";

                System.out.println();
            }
        %>
        <fieldset style="width:800px;">
    <legend class="tableheader">Add Limits</legend>
        <form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="23" colspan="4" class="<%=style%>"><%=msg%></td>
          </tr>
                <tr>
                  <td width="19%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                    <td width="53%">&nbsp;</td>
                    <td width="3%">&nbsp;</td>
                </tr>
                <tr>
                  <td  class="tab_lebel">&nbsp;</td>
                    <td  class="tab_lebel">Category</td>
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
                </tr>
                <tr>
                  <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                  <td class="tab_lebel">&nbsp;</td>
                    <td class="tab_lebel">Lower Limit</td>
                    <td><input type="text" name="lowerlimit" id="lowerlimit" style="width:200px;"></td>
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
                    <td class="tab_lebel">Upper Limit</td>
                    <td><label>
                            <input type="text" name="upperlimit" id="upperlimit" style="width:200px;">
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
                    <td><input type="submit" name="button" id="button" value="Submit" class="bot"></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
        </fieldset>
    </body>
</html>
