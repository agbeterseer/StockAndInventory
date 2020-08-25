<%-- 
    Document   : viewAllMaterials
    Created on : Jun 17, 2011, 11:26:31 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Materials</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
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
                                 msg = scl.removeMaterial(new Integer(pk[i]));
                             }
                         } catch (Exception e) {
                             System.out.println("Error in remove" + e.getMessage());
                         }
                     }
                 }
        %>

        <%
            try {
                
                list = scl.viewAllMaterials();

            } catch (Exception ex) {
                System.out.println();
            }
        %>

        <form action="" method="post" id="myform" name="myform"><table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
                <tr>
                    <td height="31" colspan="7"  class="tableheadB">View All Production Materials</td>
                </tr>
                <%
                        if (list != null) {
                            try {
                                if (list.isEmpty()) {
                %>
                <tr>
                    <td height="23" colspan="7"  bgcolor="#FFCC99">No Records Found !</td>
          </tr>
                <%                } else {
                                  Iterator it = list.iterator();
                                  int h = 0;
                %>
                <tr class="tableheader1">
                    <td height="20">Material Name</td>
                    <td>Material Type</td>
                    <td>Quantity Uesd</td>
                    <td>Date Uesd</td>
                    <td>Status</td>
                    <td>[modify]</td>
                    <td><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
                </tr>
                <%
                                 int count = 0;
                                 while (it.hasNext()) {
                                     h++;
                                     hmat = (HelpMaterials) it.next();

                                     if (count % 2 == 0) {
                                         style = "even";
                                     } else {
                                         style = "odd";
                                     }
                %>
                <tr class="<%=style%>">
                    <td height="26" class="tab_lebel"><%=hmat.getMaterialName()%></td>
                    <td><%=hmat.getMaterialType()%></td>
                    <td><%=hmat.getQuantityUsed()%></td>
                    <td><%=hmat.getDateUsed()%></td>
                    <td>&nbsp;</td>
                    <td><a href="modifyMaterials.jsp?code=<%=hmat.getId()%>"><img src="img/edit.png" alt="image"></a></td>
                    <td><input type="checkbox" name="remove" value="<%=hmat.getId()%>"></td>
                </tr>
                <%
                count++;
                }
               %>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><%=h%> Record(s) Found</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td> <input type="submit" name="delete" id="delete" value="Remove" class="boton"></td>
                </tr>
            </table>
            <table width="80%" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td class="tableheader"><div id="pageNavPosition2" align="justify">
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
          list.clear ();
            }
            }catch(Exception ex){
              System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
              }
              }
            %>
        </form>
    </body>
</html>
