<%-- 
    Document   : viewAllUnits
    Created on : Jun 29, 2011, 8:20:53 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view All Units</title>
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
       if(request.getParameter("delete") !=null ){
       String[] pk = request.getParameterValues("remove");
        System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
               System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
              // msg = scl.rremoveStock(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>
        <%
        ArrayList list = new ArrayList();
        try{
            String wcode = request.getParameter("wcode");
            if(wcode !=null){
                
            list = scl.viewAllUnits(whcode);
            }
        }catch(Exception ex){
        System.out.println();
        }
         %>
<form action="" method="post" id="myform" name="myform">
     
                   <div style="padding-left:253px"> Department
					<select name="wpartment" id="wpartment" style="width:200px;" onChange="this.form.submit();">
                    <option value="">--Select Department--</option>
                    <%
                            try{
                            ArrayList lllist = scl.viewAllWareHouses();
                           Iterator i = lllist.iterator();
                            while(i.hasNext()){
                              helpwarehouse he  = (helpwarehouse)i.next();
                            %>
                       <option value="<%=he.getWhcode()%>"<%=(request.getParameter("wpartment") != null && request.getParameter("wpartment").equalsIgnoreCase(he.getWhcode())) ? new String("selected") : hew.getHouseName()%>><%=he.getHouseName()%></option>
                               <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
                  </select>
														   </div>
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      
    <td height="17" class="tableheader" >..::All Units::..</td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="28%" height="20"><strong>Unit Name</strong></td>
    <td width="20%"><strong>Unit Type</strong></td>
    <td width="30%"><strong>Commodity Type</strong></td>
    <td width="13%"><strong>[Modify]</strong></td>
    <td width="9%">
      <input type="checkbox" name="checkall2" onClick="checkedAll();">    </td>
    </tr>
      <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
       %>
  <tr>
    <td height="21" colspan="5"  bgcolor="#FFCC99">No Records Found</td>
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
                        hu = (helpUits )it.next();
			     if(count%2==0){
				 style = "even";
				 }else{
				 style = "odd";
				 }
  %>
  <tr class="<%=style%>">
    <td height="28" class="tab_lebel"><%=hu.getUnitName()%></td>
    <td><%=hu.getUnitType()%></td>
    <td><%=hu.getCommodidtyType()%></td>
    <td><a href="modifyUnits.jsp?code=<%=hu.getSno()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td>
      <input type="checkbox" name="remove" value="<%=hu.getSno()%>">   </td>
    </tr>
   <%
	count++;
  }
  %>
</table>
<table width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="92%"><%=h%>Record(s) Found</td>
          <td width="8%"><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
    </tr>
        <tr class="art-postmetadataheader">
        
        <td height="22"><div id="pageNavPosition2" align="justify">
      <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
    </div></td>
       <td></td>
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
