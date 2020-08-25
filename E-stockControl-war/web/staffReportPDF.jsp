<%-- 
    Document   : staffReportPDF
    Created on : Jul 1, 2011, 1:37:12 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..::STAFF REPORT ::..</title>
           <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
        <%
        ArrayList list = new ArrayList();
      try{

          list = scl.viewAllStaff();

      }catch(Exception ex){
      System.out.println();
      }
       %>
 <form action="" method="post">
   <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="19" class="tableheader"><strong>..::All Staff Records::..</strong></td>
    </tr>
</table>
 <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="19"><a href="generateStaffPDF.jsp">[GENERATE REPORT]</a></td>
    </tr>
</table>
     <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td height="20"><strong>Username</strong></td>
    <td><strong>Name</strong></td>
    <td><strong>Gender</strong></td>
    <td><strong>Position</strong></td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
    %>
  <tr>
    <td height="19" colspan="4" bgcolor="#FFCC99">No Record(s) Found !</td>
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
                 hstaff  =(staffHelper)it.next();
		 if(count%2==0){
		  style = "even";
		 }else{
		 style = "odd";
		 }
  %>
  <tr class="<%=style%>">
    <td height="21" class="tab_lebel"><a href="viewSingleStaff1.jsp?code=<%=hstaff.getUsername()%>"><%=hstaff.getUsername()%></a></td>
    <td ><a href="viewSingleStaff1.jsp?code=<%=hstaff.getUsername()%>"><%=hstaff.getFirstName()%>, <%=hstaff.getLastName()%></a></td>
    <td><%=hstaff.getGender()%></td>
    <td><%=hstaff.getPosition()%></td>
  </tr>

  <%
count++;
  }
  %>

</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
       <tr>
       <td colspan="2">&nbsp;</td>
    </tr>
        <tr>
        <td ><%=h%>Record(s) Found</td>
    </tr>
  </table>
  <table width="80%" border="0"  cellpadding="0" cellspacing="0">
    <tr  class="art-postmetadataheader">
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
