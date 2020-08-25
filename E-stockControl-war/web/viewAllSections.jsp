<%-- 
    Document   : viewAllSections
    Created on : Aug 6, 2011, 12:09:34 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAllSections</title>
  <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
        <script type="text/javascript">
            checked = false;
            function checkedAll () {
                if (checked == false){checked = true}else{checked = false}
                for (var i = 0; i < document.getElementById('myform').elements.length; i++) {
                    document.getElementById('myform').elements[i].checked = checked;
                }
            }
        </script>
        <script type="text/javascript">
            function confirmation() {
                var answer = confirm("Are you Sure you want to Remove?");
                if (answer)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>


        <%
          ArrayList list = new ArrayList();
                 if (request.getParameter("delete") != null) {
                     String[] pk = request.getParameterValues("remove");
                     System.out.println("pk1" + pk);
                     //int[] pk =Integer.parseInt(xi);
                     if (pk != null) {
                         //int intarray[] = new int[pk.length];
                         System.out.println("pk2" + pk);
                         try {
                             for (int i = 0; i < pk.length; i++) {
                                 msg = scl.removeSeciton(new Integer(pk[i]));
                             }
                         } catch (Exception e) {
                             System.out.println("Error in remove" + e.getMessage());
                         }
                     }
                 }
        %>

        <%
            try {

                list = scl.viewAllSections(whcode);
            } catch (Exception ex) {
                System.out.println();
            }

        %>
        <form action="" method="post" id="myform" name="myform"><table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
                <tr class="tableheader">
                    <td height="17" colspan="7" >..:: All Sections::..</td>
                </tr>
                <tr class="tableheader">
                    <td height="21"><strong>Seciont Name</strong></td>
                    <td><strong>Section Capacity</strong></td>
                    <td><strong>Section Description</strong></td>
                    <td>Warehouse</td>
                    <td><strong>Status</strong></td>
                    <td><strong>modify</strong></td>
                    <td><strong>
                     <input type="checkbox" name="checkall2" onClick="checkedAll();">
                     </strong></td>
                </tr>
                <%
                       if (list != null) {
                           try {
                               if (list.isEmpty()) {
                %>
                <tr>
                    <td height="25" colspan="7" bgcolor="#FFCC99">No Records Found !</td>
                </tr>
                <%                } else {
                              Iterator it = list.iterator();
                              int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hss = (HelpSection) it.next();
                                  if (count % 2 == 0) {
                                      style = "even";
                                  } else {
                                      style = "odd";
                                  }
                %>
                <tr class="<%=style%>">
                    <td height="26" class="tab_lebel"><%=hss.getName()%></td>
                    <td><%=hss.getCapacity()%></td>
                    <td><%=hss.getDescription()%></td>
                    <td><%=scl.viewSingleWarehouse(hss.getWhcode()).getHouseName()%></td>
                    <td><%=hss.getStatus()%></td>
                    <td><a href="modifySections.jsp?code=<%=hss.getName()%>"><img src="img/edit.png" alt="no image"></a></td>
                    <td><input type="checkbox" name="remove" value="<%=hss.getSno()%>"></td>
                </tr>
                <%
                  count++;
                  }
                %>
            </table>
            <table width="80%" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td width="92%">&nbsp;</td>
                    <TD width="8%">&nbsp;</TD>
                </tr>
                <tr>
                    <td ><%=h%>&nbsp;Record(s) Found</td>
                    <td ><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
                </tr>
                <tr  class="art-postmetadataheader">
                    <td colspan="2"><div id="pageNavPosition2" align="justify">
                            <script type="text/javascript"><!--
                                var page = new Pager('results', 25);
                                page.init();
                                page.showPageNav('page', 'pageNavPosition2');
                                page.showPage(1);
                                //--></script>
                        </div></td>
                </tr>
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
