<%-- 
    Document   : viewAllRoles
    Created on : Jun 29, 2011, 3:35:56 PM
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
        <title>View All Roles</title>
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
          String msg = "";
          String style = "";
          staffHelper ssh = null;
          HelpRole hr = null;
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
       if(request.getParameter("delete") !=null ){
       String[] pk = request.getParameterValues("remove");
        System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
               System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
               msg = scl.removeRoles((pk[i]));
           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>

        <%
            try{

                list = scl.viewAllRoles();
            }catch(Exception ex){
            System.out.println();
            }

            %>
            <form action="" method="post" id="myform" name="myform">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" class="tableheader"><strong>..::All Roles::..</strong></td>
    </tr>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="35%" height="20"><strong>Role Name</strong></td>
    <td width="39%"><strong>Page</strong></td>
    <td width="18%"><strong>modify</strong></td>
    <td width="8%"><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
  </tr>
    <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="23" colspan="4"  bgcolor="#FFCC99">No Records Found !</td>
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
                        hr  =(HelpRole)it.next();
			     if(count%2==0){
				 style = "even";
				 }else{
				 style = "odd";
				 }
  %>
  <tr class="<%=style%>" >
    <td height="22"><%=hr.getRoleName()%></td>
    <td><%=hr.getDefaultName()%></td>
    <td><a href="modifyRoles.jsp?code=<%=hr.getRoleName()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td>
      <input type="checkbox" name="remove" value="<%=hr.getRoleName()%>">    </td>
  </tr>
  
  <%  
count++;
  }
  	%>
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><%=h%> Record(s) Found</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
  </tr>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr class="art-postmetadataheader">
          <td ><div id="pageNavPosition2" align="justify">
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
