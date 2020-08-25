<%-- 
    Document   : CostItemForBuy
    Created on : Oct 28, 2011, 10:29:34 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostItemForBuy</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
        <%
try{
     ArrayList list = new ArrayList();
        String code = request.getParameter("code");
        String costtype = "";
        String status = "";


       // System.out.println("sta"+sta);
        //try{

    //list = scl.viewStoreByCategoryAndWareHouse(code, whcode);


         //  hsc =  scl.viewSingleCostMethode(valu);
          // status = hsc.getStatus();
        //  list = scl.viewAllCategory();
//
           //costtype = hsc.getCostType();

         //}catch(Exception ex){
       // System.out.println();
       // }
	%>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
          <tr class="tableheader">
            <td width="49%" height="18"><strong>Items</strong></td>
            <td ><strong>Make Cost</strong></td>
            <td><strong>Modify Cost</strong></td>
  </tr>
            <%
             ArrayList kkk = new ArrayList();
            try{
                kkk = scl.viewStoreByCWMD(code, whcode, CONFIG.getSTOCK_ITEM_BUY());
           
            }catch(Exception ex){System.out.println();}

           if(kkk != null) {
            try{
                if(kkk.isEmpty()) {
        %>
          <tr>
            <td colspan="3" bgcolor="#FFCC99">No Records Found !</td>
            </tr>
            <%
                }else{

                    Iterator it = kkk.iterator();
                    int h = 0;
      %>
      <%
                   int count = 0;
                          int sum = 0;
                while(it.hasNext()){
                        h++;
                        hs  =(HelpStock )it.next();
		       // sum += hs.getQuantityIn().intValue();
                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>
          <tr class="<%=style%>">
            <td height="22" class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
            <td width="21%" class="tab_lebel"><a href="importersItemCost.jsp?code=<%=hs.getCode()%>">Cost</a></td>
            <td width="30%"><a href="modifyInventoryCost2.jsp?code=<%=hs.getCode()%>">modify</a></td>
          </tr>
          <%
	  count++;
	  }
	  %>
        </table>
<table width="50%" border="0"  cellpadding="0" cellspacing="0">
            <tr>
              <td>&nbsp;</td>
              <td >&nbsp;</td>
    
            </tr>
            <tr>
              <td width="49%" ><%=h%> &nbsp;Record(s) Found
              <td width="51%">&nbsp;</td>
         
  </tr>
            <tr>
              <td height="18" colspan="3" class="art-postmetadataheader"><div id="pageNavPosition" align="justify">
                  <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
              </div></td>
            </tr>
    </table><%
        kkk.clear();
        }
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
%>
    </body>
</html>
<%

  }catch(Exception ex){
response.sendRedirect("errorpage.jsp");
 }
%>