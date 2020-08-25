<%-- 
    Document   : viewAllWarehouses
    Created on : Sep 18, 2011, 6:24:52 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAllWarehouses</title>
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
                 if (request.getParameter("delete") != null) {
                     String[] pk = request.getParameterValues("remove");
                    // System.out.println("pk1" + pk);
                     //int[] pk =Integer.parseInt(xi);
                     if (pk != null) {
                         //int intarray[] = new int[pk.length];
                        // System.out.println("pk2" + pk);
                         try {
                             for (int i = 0; i < pk.length; i++) {
                                 msg = scl.removeWarehosue(pk[i]);
                             }
                         } catch (Exception e) {
                             System.out.println("Error in remove" + e.getMessage());
                         }
                     }
                 }
        %>
        <%
        ArrayList list = new ArrayList();
        try{

            list = scl.viewAllWareHouses();

        }catch(Exception ex){
        System.out.println();
        }
        %>
        <form action="" method="post"  name="myform" id="myform"> <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr>
    <td width="20%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
    <td width="17%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td height="16" colspan="7" class="tableheader">List of Warehouses</td>
    </tr>
  <tr class="tableheader">
    <td height="20"><strong>Warehouse</strong></td>
    <td><strong>Address</strong></td>
    <td><strong>Status</strong></td>
    <td><strong>Capacity</strong></td>
    <td><strong>modify</strong></td>
    <td><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
    <td>&nbsp;</td>
     <%
                        if (list != null) {
                        try {
                        if (list.isEmpty()) {
     %>
  </tr>
  <tr>
    <td height="23" colspan="7" bgcolor="#FFCC99">No Record(s) Found</td>
    </tr>
     <%                } else {
                                  Iterator it = list.iterator();
                                  int h = 0;
     %>
      <%
                                 int count = 0;
                                 while (it.hasNext()) {
                                     h++;
                                     hew = (helpwarehouse) it.next();
                                     if (count % 2 == 0) {
                                         style = "even";
                                     } else {
                                         style = "odd";
                                     }
     %>
  <tr  class="<%=style%>">
    <td class="tab_lebel"><%=hew.getHouseName()%></td>
    <td><%=hew.getAddress()%></td>
    <td><%=hew.getStatus()%></td>
    <td><%=hew.getCapacity()%></td>
    <td><a href="modifyWarehouses.jsp?code=<%=hew.getWhcode()%>">[modify]</a></td>
    <td>
      <input type="checkbox" name="remove" value="<%=hew.getWhcode()%>">
    </td>
    <td>&nbsp;</td>
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
    <td><input type="submit" name="delete" id="delete" value="Remove" class="bot" onclick="return confirmation();"></td>
    <td>&nbsp;</td>
  </tr>
</table>
        <table width="80%" border="0"  cellpadding="0" cellspacing="0">
          <tr class="art-postmetadataheader">
            <td  ><div id="pageNavPosition2" align="justify">
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
