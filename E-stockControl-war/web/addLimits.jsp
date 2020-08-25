<%-- 
    Document   : addLimits
    Created on : Jul 7, 2011, 11:10:51 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add Limits</title>
 <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
		 <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>

           <%
            String limcode = request.getParameter("limcode");
            String lo = request.getParameter("lo");
            String up = request.getParameter("up");

            try {
               if (request.getParameter("button2") !=null) {
                  msg = scl.addLimit(new HelpLimit(limcode,lo,up, whcode));

                 style = "success";
                }
            } catch (Exception ex) {
                style = "error";
                System.out.println();
            }
        %>
        <fieldset style="width:800px;">
            <legend class="tableheader"> Add Limits</legend>
         <form action="" method="post" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="4" class="<%=style%>"><%=msg%></td>
                    </tr>
                    <tr>
                      <td width="19%">&nbsp;</td>
                        <td width="25%">&nbsp;</td>
                        <td width="53%">&nbsp;</td>
                        <td width="3%">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                        <td>CommodityName</td>
                        <td><label>
                                <input type="text" name="limcode" id="limcode" style="width:200px;">
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
                        <td>Lower Limit</td>
                        <td><label>
                                <input type="text" name="lo" id="lo" style="width:200px;">
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
                        <td>Upper Limit</td>
                        <td><label>
                                <input type="text" name="up" id="up" style="width:200px;">
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
                        <td><label>
                        <input type="submit" name="button2" id="button2" value="Submit" class="bot">
                      </label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
        </form>
        </fieldset>
    </body>
</html>
