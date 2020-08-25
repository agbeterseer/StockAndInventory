<%-- 
    Document   : CostItemForMake
    Created on : Oct 28, 2011, 10:29:22 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostItemForMake</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>

         <%

     ArrayList list = new ArrayList();
        String code = request.getParameter("code");
        String costtype = "";
        String status = "";


       // System.out.println("sta"+sta);
        //try{

    //list = scl.viewStoreByCategoryAndWareHouse(code, whcode);


         //  hsc =  scl.viewSingleCostMethode(valu);
         //  status = hsc.getStatus();
        //  list = scl.viewAllCategory();

           //costtype = hsc.getCostType();

        // }catch(Exception ex){
        //System.out.println();
       // }
	%>

        <table width="50%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableheader">
            <td width="50%" height="21">Items</td>
            <td colspan="2">Make Item Cost</td>
          </tr>
           <%
           try{
                list = scl.viewStoreByCWMD(code, whcode, CONFIG.getSTOCK_ITEM_MAKE());

            }catch(Exception ex){System.out.println();}

           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
          <tr>
            <td colspan="3" bgcolor="#FFCC99">No Records Found !</td>
            </tr>
            <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
      <%
                   int count = 0;
                          int sum = 0;
                while(it.hasNext()){
                        h++;
                        hs  =(HelpStock )it.next();
		        sum += hs.getQuantityIn().intValue();
                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>

          <tr class="<%=style%>">
            <td height="25" class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
            <td width="34%" class="tab_lebel"><a href="manufacturersItemCost.jsp?code=<%=hs.getCode()%>">Set Item Cost</a></td>
            <td width="16%">&nbsp;</td>
          </tr>
            <%
		  count++;
		  }
            %>
          <tr >
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
<table width="50%" border="0"  cellpadding="0" cellspacing="0">
            <tr>
              <td>&nbsp;</td>
              <td >&nbsp;</td>

            </tr>
            <tr>
              <td width="64%" ><%=h%> &nbsp;Record(s) Found
              <td width="36%">&nbsp;</td>

  </tr>
            <tr>
              <td height="19" colspan="3"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
                  <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
              </div></td>
            </tr>
          </table><%
        list.clear();
        }
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
%>
    </body>
</html>
