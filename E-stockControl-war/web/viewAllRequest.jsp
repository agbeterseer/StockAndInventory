<%-- 
    Document   : viewAllRequest
    Created on : Jun 30, 2011, 10:48:02 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view AllRequest</title>
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
    <style type="text/css">
<!--
.style1 {font-weight: bold}
-->
    </style>
    </head>
    <body>
       <%
 
       if(request.getParameter("delete") !=null ){
           
       String[] pk = request.getParameterValues("remove");
        //System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
               //System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
               msg = scl.removeRequest(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>

       <%
       
        ArrayList list = new ArrayList();
               helplogin hl = null;
           String requisitioncode = request.getParameter("requisitioncode");
           
        try{
             hl = scl.viewSingleUser(username);
          //   lo.getRole().substring(0, 3);

            list = scl.viewAllRequest(username);
            
        }catch(Exception ex){

        System.out.println();
        }
         %>

       <form action="" method="post" id="myform"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheader"  >
    <td height="17">..::Orders::..</td>
    </tr>
</table>

  <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td height="20"><strong>Items</strong></td>
    <td><strong>DateoFRequest</strong></td>
    <td><strong>Quantity</strong></td>
    <td><strong>[View]</strong></td>
    <td><strong>[Modify]</strong></td>
    <td><input name="checkall2" type="checkbox" class="style1" onClick="checkedAll();"></td>
  </tr>
                <%
                       if (list != null) {
                       try {
                       if (list.isEmpty()) {
                %>
   <tr>
                  <td height="22" colspan="6" bgcolor="#FFCC99">No Record(s) Found !</td>
                </tr>
                <%
                               } else {
                              Iterator it = list.iterator();
                              int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hrp = (HelpRequisition) it.next();
                                  if (count % 2 == 0) {
                                  style = "even";
                                      }else{
                                      style = "odd";
                                      }
                %>
               
    <tr class="<%=style%>">
    <td  class="tab_lebel"><%=hrp.getCommodityId()%></td>
    <td class="tab_lebel"><%=hrp.getDateoFRequest()%></td>
    <td class="tab_lebel"><%=hrp.getQuantity()%></td>
    <td ><a href="viewSingleRequest.jsp?code=<%=hrp.getSno()%>">[view..]</a></td>
    <td><a href="modifyRequest.jsp?code=<%=hrp.getSno()%>"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
    <td><input type="checkbox" name="remove" value="<%=hrp.getSno()%>"></td>
  </tr>
   <%
            count++;
                   }
   %>
    <tr >
      <td height="15">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
                <tr><td width="89%"><%=h%>&nbsp;Record(s) Found</td>
                <td width="11%"><input name="requisitioncode" type="hidden" id="requisitioncode" value="<%=hl.getRole()%>">
                  <input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
    </tr>
     <tr> <td  class="art-postmetadataheader" colspan="2"><div id="pageNavPosition2" align="justify">
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
