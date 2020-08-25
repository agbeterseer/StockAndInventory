<%-- 
    Document   : viewAllLimits
    Created on : Jul 7, 2011, 1:27:51 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view AllLimits</title>
     <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
             <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
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
             //  msg = scl.removeProduction(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>
    <%
         ArrayList list = new ArrayList();
        try {
            list = scl.viewAllLimits(whcode);

        } catch (Exception ex) {
            System.out.println();
        }
        %>
        <form action="" method="post"><table width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr class="tableheader">
    <td height="19" >List of Limits</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
                <tr class="tableheader">
                    <td height="20"><strong>Item Name</strong></td>
                  <td><strong>Lower Limit</strong></td>
                    <td><strong>Upper Limit</strong></td>
                    <td><strong>[modify]</strong></td>
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
                    <td height="27" colspan="5" bgcolor="#FFCC99">No Records Found !</td>
    </tr>
                <%                } else {
                               Iterator it = list.iterator();
                               int h = 0;
                %>
                <%
                              int count = 0;
                              while (it.hasNext()) {
                                  h++;
                                  hp = (HelpLimit) it.next();
                                  if (count % 2 == 0) {
                                   style = "even";
                                      }else{
                                      style = "odd";
                                      }
                %>
                <tr class="<%=style%>">
                    <td><%=scl.viewSingleCommodity2(hp.getCommodityCode()).getItemname()%></td>
                    <td><%=hp.getLowerLimit()%></td>
                    <td><%=hp.getUpperLimit()%></td>
                    <td><a href="modifyLimit.jsp?code=<%=hp.getCommodityCode()%>"><img src="img/edit.png" alt="image"></a></td>
                    <td><input type="checkbox" name="remove" value="<%=hpr.getCommodityid()%>"></td>
                </tr>
				<%
                count++;
                }
                %>
                <tr >
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                 
          </table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="45%"   ><%=h%> Record(s) Found</td>
          <td width="46%"></td>
          <td width="9%"><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
        </tr>
        <tr>
          <td height="23" colspan="3"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
