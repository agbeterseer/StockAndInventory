<%-- 
    Document   : viewSingleMaterial
    Created on : Jun 17, 2011, 11:28:21 AM
    Author     : Terseer
--%>

<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewSingleMaterial</title>
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
          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          HelpMaterials hmat = null;
          %>

        <%
          String msg = "";
          String style = "";
        %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }
          ArrayList list = new ArrayList();
        %>

        <%
        String search1 = request.getParameter("search1");
        
        try{

         if(search1 !=null && search1 !=""){
             list = scl.viewMateriaByName(search1);
         
         }

        }catch(Exception ex){
        System.out.println();
        }
       %>
<form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">Enter Name of Material</td>
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
    <td>&nbsp;</td>
    <td><label></label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<form action="" method="post" id="myform" name="myform">
  
  
  <table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
  <tr>
    <td height="21" colspan="6"  class="tableheader">View All Production Materials</td>
    </tr>
	<tr  class="tableheader">
    <td height="20"><strong>Material Name</strong></td>
    <td><strong>Material Type</strong></td>
    <td><strong>Quantity Uesd</strong></td>
    <td><strong>Date Uesd</strong></td>
    <td><strong>[Modify]</strong></td>
    <td><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
  </tr>
    <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="20" colspan="6" bgcolor="#FFCC99">No Records Found !</td>
    </tr>
  <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
  
   <%
                int count = 0;
               while(it.hasNext()){
                        h++;
                        hmat  =(HelpMaterials)it.next();

                         if(count%2==0){
  %>
  <tr class="even">
    <td height="26" class="tab_lebel"><%=hmat.getMaterialName()%></td>
    <td><%=hmat.getMaterialType()%></td>
    <td><%=hmat.getQuantityUsed()%></td>
    <td><%=hmat.getDateUsed()%></td>
    <td><a href="modifyMaterials.jsp?code=<%=hmat.getId()%>"><img src="img/edit.png" alt="image"></a></td>
    <td><input type="checkbox" name="remove" value="<%=hmat.getId()%>"></td>
  </tr>
  
  <%}else{%>
  <%}
    }%>
  <tr>
    <td><%=h%> Record(s) Found</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td> <input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
  </tr>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
        %>
</form>
    </body>
</html>
