<%-- 
    Document   : stockUploadReport
    Created on : Nov 13, 2011, 11:33:20 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>stockUploadReport</title>
		
 <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
              <%@include  file="lookUp.jsp"%>
        <%
      //  String style = "";
        String title = "";
 try{
        //schoolcode = mspl.viewSingleStaff(session.getAttribute("username").toString()).getSc();
        //String status = session.getAttribute("status").toString();
        //SchoolsHelper ssh = null;
        //ssh = mspl.collectSchoolName(schoolcode);
        //String schoolname = ssh.getName();
        title = "Stock List, Upload Summary";
        }catch(Exception e){
            e.getMessage();
            }
        %>
        <form action="" name="form1" method="post">
          <table width="80%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="22" class="tableheadB"><%=title%></td>
            </tr>
          </table>
          <table width="80%" border="0"  cellpadding="0" cellspacing="0" class="container"  id="results">
      <tr class="tableheader">
          <td width="14%" height="20"  class="bheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Item</strong></td>
        <td width="14%" align="center" class="bheader"><strong>Quantity</strong></td>
        <td width="8%" align="center" class="bheader"><strong>Category</strong></td>
        <td width="8%" align="center" class="bheader"><strong>MakeOrBuy</strong></td>
        <td width="8%" align="center" class="bheader"><strong>Section</strong></td>
		</tr>
      <% try {
            int count = 0;
            int h = 0;
            ArrayList list = null;
            list = (ArrayList)session.getAttribute("arl");
            if (list!=null&&!list.isEmpty()){


            Iterator i = list.iterator();
            while(i.hasNext()){
                  h++;
              count++;
               stockClearance gsh  =(stockClearance)i.next();
        %>
         <%
        if(count%2==0){
            style = "even";

            }else{
            style = "odd";
            }

        %>
      
      <tr class="<%=style%>">
           <td height="22"  class="firstcell">&nbsp;<%=gsh.getCommodityId()%></td>
        <td align="center" class="row"><%=gsh.getQuantityIn()%></td>
        <td align="center" class="row"><%=gsh.getCategory()%></td>
        <td align="center" class="row"><%=gsh.getMakeOrBuy()%></td>
        <td align="center" class="lastcell"><%=gsh.getCompactments()%></td>
         </tr>
       <%
       count++;
        }
       %>
        <tr>
           <td class="row">&nbsp;</td>
        <td class="row">&nbsp;</td>
        <td  class="row">&nbsp;</td>
        <td  class="row">&nbsp;</td>
        <td  class="lastcell">&nbsp;</td>
         </tr>
    </table>
    <table width="80%" border="0"  cellpadding="0" cellspacing="0">
	<tr><td><strong><%=h%> Record(s) Found</strong></td>
	</tr>
      <tr>
        <td width="100%" height="16"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
            <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
        </div></td>
      </tr>
    </table>
        </form>
          <%
        }
        //msg = "Number Of Students in List: "+count;%>
            <%
            }catch(Exception e){
       // msg = "NO ITEMS FOUND";
        }
        %>
    </body>
</html>
