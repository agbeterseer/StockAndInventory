<%-- 
    Document   : selectdepartment
    Created on : Apr 29, 2016, 3:29:05 PM
    Author     : JPT TERSOO AGBE
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
        <title>Select Department</title>
    <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
		<script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
		<script type="text/javascript" src="./jquery.js"></script>
		<script type="text/javascript" src="./script.js"></script>
        <script type="text/javascript">
            <!--
            // by Nannette Thacker
            // http://www.shiningstar.net
            // This script checks and unchecks boxes on a form
            // Checks and unchecks unlimited number in the group...
            // Pass the Checkbox group name...
            // call buttons as so:
            // <input type=button name="CheckAll"   value="Check All"
            //onClick="checkAll(document.myform.list)">
            // <input type=button name="UnCheckAll" value="Uncheck All"
            //onClick="uncheckAll(document.myform.list)">
            // -->


            function checkAll(field)
            {
                for (i = 0; i < field.length; i++)
                    field[i].checked = true ;
            }
            function ShowContactInfo(url,id,w) {
                var newWindow = window.open(url+".jsp?cid="+id,"Details","width="+w+",height=600,scrollbars=1");
            }

            function uncheckAll(field)
            {
                for (i = 0; i < field.length; i++)
                    field[i].checked = false ;
            }

            function popWindow(url,w) {
                var newWindow = window.open(url+".jsp","New","width="+w+",height=400,scrollbars=1");
            }

            function openWindow(){
                var url = "web004/PrintAllocateClassesToFormasters.jsp";
                var Print_win = window.open(url,"Print_win","menubar=yes, resizable=yes, width=400,height=400,top=0,left=0");
                Print_win.focus();
            }
        </script>
    </head>
    <body>
        <%
            SControlLocal scl = null;
            String mssg = "";
            staffHelper hstaff = null;
            helplogin hl = null;
            HelpRole hr = null;
            String y = "";
            helpSetCost hsc = null;
            String valu = "";
            String sta = "";
            HelpSection hss = null;
            StockEdtion  sdd = null;

        %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }

        %>

          <%
              ArrayList mm = new ArrayList();
              mm = scl.viewAllEditions();

           if(mm != null) {
            try{
                if(mm.isEmpty()) {

                request.getParameter("checkEdition.jsp");

                }else{
               Iterator it = mm.iterator();
             while(it.hasNext()){
                 sdd = (StockEdtion)it.next();
                session.setAttribute("edition",  sdd.getId());

                  //  System.out.println("edition" + sdd.getId());
                 }
                 }
                 }catch(Exception ex){
                  request.getParameter("checkEdition.jsp");
                 System.out.println("error due to:" + ex.getMessage());
                 }
            }



              try{
                  String wpartment = request.getParameter("wpartment");

                  if(request.getParameter("loginb") !=null){
                    session.setAttribute("wpartment", "code");
                  //  response.sendRedirect("wpartment")

                  }
              }catch(Exception es){
              System.out.println();

              }

            %>

          
       <div id="art-page-background-glare">
			<div id="art-page-background-glare-image">
				<div id="art-main">
					<div class="art-sheet">
						<div class="art-sheet-tl"></div>
						<div class="art-sheet-tr"></div>
						<div class="art-sheet-bl"></div>
						<div class="art-sheet-br"></div>
						<div class="art-sheet-tc"></div>
						<div class="art-sheet-bc"></div>
						<div class="art-sheet-cl"></div>
						<div class="art-sheet-cr"></div>
						<div class="art-sheet-cc"></div>
						<div class="art-sheet-body">
							<div class="art-nav">
								<div class="l"></div>
								<div class="r"></div>
								<ul class="art-menu">
									<li><a href="javascript:window.close();" class="active"><span class="l"> </span><span class="r"> </span><span class="t">Home Page</span></a></li>

								</ul>
							</div>
							<div class="art-content-layout">
								<div class="art-content-layout-row">
									<div class="art-layout-cell art-content">
										<div class="art-post">
											<div class="art-post-body">
												<div class="art-post-inner art-article">
													<div class="art-postmetadataheader">
														<h2 class="art-postheader">  </h2>
													</div>
													<div class="art-postcontent">
														   <form action="" method="post" onsubmit="return validate(this);">
														   <p></p>
														   <div style="padding-left:250px"> Department
														     <select name="wpartment" id="wpartment" style="width:200px;"  onChange="this.form.submit();">
                    <option value="">--Select Department--</option>
                    <%
                            try{
                            ArrayList lllist = scl.viewAllWareHouses();
                           Iterator i = lllist.iterator();
                            while(i.hasNext()){
                              helpwarehouse hcc  = (helpwarehouse)i.next();
                            %>
                    <option value="<%=hcc.getWhcode()%>"><%=hcc.getHouseName()%></option>
                    <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                            %>
                  </select>
														   </div>
														   
													   	    															   <p></p>
													   	     <div  style="padding-left:462px">


															   	     <input name="loginb" type="submit"  class="bot" id="loginb" value="Enter">

													   	     </div>
														   </form>
													</div>
													<div class="cleared"></div>
												</div>
												<div class="cleared"></div>
											</div>
										</div>
										<div class="cleared"></div>
									</div>
								</div>
							</div>
							<div class="cleared"></div>
							<div class="art-footer">
								<div class="art-footer-t"></div>
								<div class="art-footer-l"></div>
								<div class="art-footer-b"></div>
								<div class="art-footer-r"></div>
								<div class="art-footer-body"><a href="./#" class="art-rss-tag-icon" title="RSS"></a>
									<div class="art-footer-text">

										<p>Copyright © 2016. All Rights Reserved.</p>
									</div>
									<div class="cleared"></div>
								</div>
							</div>
							<div class="cleared"></div>
						</div>
					</div>
					<div class="cleared"></div>
					<p class="art-page-footer">Powered by <a href="">MCC Makurdi </a></p>
				</div>
			</div>
		</div>
    </body>
</html>
