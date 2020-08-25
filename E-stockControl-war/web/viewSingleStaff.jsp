<%-- 
    Document   : viewSingleStaff
    Created on : Jun 29, 2011, 4:22:59 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view single staff</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
		     <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
     
        <%
        String code = request.getParameter("code");
        String regno = request.getParameter("regno");
        String password = request.getParameter("password");
        String surname = request.getParameter("surname");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String position = request.getParameter("position");
        String nationality = request.getParameter("nationality");
        String stateoforigin = request.getParameter("stateoforigin");
        String lga = request.getParameter("lga");
        String homeaddress = request.getParameter("homeaddress");
        String fonenumber = request.getParameter("fonenumber");
        %>

        <%
        try{

            hstaff = scl.viewSingleStaff(username);
            
         %>
   <form action="" method="post" enctype="multipart/form-data">
    <fieldset style="width:600px; " >
        <legend><font face="Arial, Helvetica, sans-serif"  color="#669966"><strong>Personal Details</strong></font></legend>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><img src="<%=(hstaff.getPassport() !=null) ? "sImgage" : "images/nopic_64.gif"%>" width="130" border="1" height="120"></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><a href="viewStaffPhoto.jsp?username=<%=hstaff.getUsername()%>">[ Upload Pic ]</a></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="12%">&nbsp;</td>
                      <td width="32%"> <input name="regno" type="hidden" id="regno" value="<%=hstaff.getUsername()%>"></td>
                    <td width="47%">&nbsp;</td>
                    <td width="9%"><a href="javascript:window.print();">[Print]</a></td>
                </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel"> First name</td>
                      <td><label>
                <input type="text" style="width:200px;" name="firstname" id="firstname" value="<%=(request.getParameter("firstname") != null) ? request.getParameter("firstname") : hstaff.getFirstName()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Last name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="lastname" id="lastname" value="<%=(request.getParameter("lastname") != null) ? request.getParameter("lastname") : hstaff.getLastName()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Gender</td>
                      <td><label>
                              <input type="text" name="gender" id="gender" style="width:200px;" value="<%=hstaff.getGender()%>">
                    </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Position</td>
                      <td><label>
                      <input type="text" name="position" id="position" style="width:200px;" value="<%=hstaff.getPosition()%>">
                    </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Nationlatlity</td>
                      <td><label>
                              <input type="text" name="nationality" id="nationality" style="width:200px;" value="<%=scl.viewNations(hstaff.getNationality()).getCountry()%>">
                    </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">State of Origin</td>
                      <td><label>
                              <input type="text" name="stateoforigin" id="stateoforigin" style="width:200px;" value="<%=scl.viewState(hstaff.getStateOfOrigin()).getState()%>">
                    </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Lga</td>
                      <td><label>
                              <input type="text" name="lga" id="lga" style="width:200px;" value="<%=scl.viewLga(hstaff.getLga()).getLga()%>">
                    </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td height="23" class="tab_lebel">Home address</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="homeaddress" id="homeaddress" value="<%=(request.getParameter("homeaddress") != null) ? request.getParameter("homeaddress") : hstaff.getHomeAddress()%>">
                      </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Phone number</td>
                      <td><label>
                       <input type="text"  style="width:200px;" name="fonenumber" id="fonenumber" value="<%=(request.getParameter("fonenumber") != null) ? request.getParameter("fonenumber") : hstaff.getPhoneNumber()%>">
                      </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td height="28">&nbsp;</td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="18"><a href="modifyStaffRecords.jsp?code=<%=hstaff.getUsername()%>">[Modify Records]</a></td>
                      </tr>
                    </table></td>

                    <td>&nbsp;</td>
                  </tr>
              </table>
     </fieldset>
        </form>
            <%
            }catch(Exception ex){
       request.getParameter("errorpage.jsp");
            }
           %>
    </body>
</html>
