<%-- 
    Document   : viewSupplyByCategory
    Created on : Jun 30, 2011, 1:09:24 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view supply</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
 
     <%
        ArrayList list = new ArrayList();
        String search1 = request.getParameter("search1");
        try{

            list = scl.viewAllSupplies(whcode);
            
        if(search1 !=null && search1 !=""){
 
        list = scl.viewSupplyByCategory2(search1.toUpperCase(),whcode);
      
        }
        }catch(Exception ex){
        System.out.println();
        }
	%>
<form action="" method="post">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr class="tableheader"  >
      <td height="17">..::View Suppies::..</td>
    </tr>
  </table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">Enter Commodity Id</td>
    </tr>
    <tr>
      <td width="42%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="text" name="search1" id="search1" style="width:300px;">
      </label></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">Select one Category</div></td>
      <td><select name="category" id="category" style="width:200px;"  onChange="this.form.submit();">
          <option  value="">--Select one Category--</option>
          <%
                            try{
                           ArrayList lhist = scl.viewAllCategory();
                           Iterator i = lhist.iterator();
                            while(i.hasNext()){
                               hcc  = (HelpCategory)i.next();
                            %>
          <option value="<%=hcc.getCategorycode()%>"><%=hcc.getStockItemType()%></option>
          <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
      </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
        <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
                <tr class="tableheader">
                    <td height="21"><strong>Items</strong></td>
                  <td><strong>Issued By</strong></td>
                    <td><strong>Date Of Supply</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <%
                       if (list != null) {
                           try {
                               if (list.isEmpty()) {
                %>
                <tr>
                    <td colspan="4" bgcolor="#FFCC99">No Records Found!</td>
                </tr>
                <%                } else {
                              Iterator it = list.iterator();
                              int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hsup = (HelpSupply) it.next();
                                  if (count % 2 == 0) {

                                         style = "even";
                                      }else{
                                          style = "odd";
                                       }

                %>
                <tr class="<%=style%>">
                    <td height="22"><%=hsup.getCommodityId()%></td>
                  <td><%=hsup.getIssuedBy()%></td>
                    <td><%=hsup.getDateSupplied()%></td>
                    <td>&nbsp;</td>
                </tr>
               
                <%
                count++;
                     }
                %>
            </table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2"><%=h%>Record(s) Found</td>
                </tr>
                <tr>

                    <td  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
                            <script type="text/javascript"><!--
                                var page = new Pager('results', 25);
                                page.init();
                                page.showPageNav('page', 'pageNavPosition2');
                                page.showPage(1);
                                //--></script>
                        </div></td></tr>
            </table>
            <%
                                   list.clear();
                               }
                           } catch (Exception ex) {
                               System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
                           }
                       }
            %>
        </form>
    </body>
</html>
