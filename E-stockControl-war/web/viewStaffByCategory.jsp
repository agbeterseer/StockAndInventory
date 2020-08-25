<%-- 
    Document   : viewStaffByCategory
    Created on : Jun 29, 2011, 10:14:02 AM
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
        <title>View Staff</title>
          <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
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

        list = scl.viewStaffByCategory(search1);
        
        }
        }catch(Exception ex){
        System.out.println();
        }
		%>
        <form action="" method="post">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">Enter Staff Name</td>
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
      <td><input type="submit" name="button" id="button" value="Search"  class="bot"></td>
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
        <form action="" method="post">
   <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="tableheader"><strong>..::All Staff Records::..</strong></td>
    </tr>
</table>

   <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr  class="tableheader">
    <td><strong>Username</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Gender</strong></td>
    <td><strong>Position</strong></td>
    <td><strong>Details</strong></td>
    <td><strong>Modify</strong></td>
    <td><strong>Remove</strong></td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="19" colspan="7" bgcolor="#FFCC99">No Record(s) Found !</td>
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
                 ssh  =(staffHelper)it.next();
		 if(count%2==0){
		 style ="even";
		 }
		 else{
		 		 style ="odd";
		 }
  %>
  <tr class="<%=style%>">
    <td><%=ssh.getUsername()%></td>
    <td><%=ssh.getFirstName()%>, <%=ssh.getLastName()%></td>
    <td><%=ssh.getGender()%></td>
    <td><%=ssh.getPosition()%></td>
    <td>[view..]</td>
    <td><a href="modifyStaffRecords.jsp?code=<%=ssh.getUsername()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td><a href="remove.jsp">[remove]</a></td>
  </tr>
  <%
 count++;
  }
  %>

  
  </tr>
</table>

   <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2"><%=h%>Record(s) Found</td>
    </tr>
        <tr class="art-postmetadataheader">
        
        <td ><div id="pageNavPosition2" align="justify">
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
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
		%>
</form>
    </body>
</html>
