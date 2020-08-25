<%-- 
    Document   : supperAdminCreateAdmin
    Created on : Feb 22, 2012, 9:13:28 AM
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
        <title>createuser</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
             <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%

          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
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
        try{
         String usernamer = "";
        try{

     usernamer = session.getAttribute("usernamer").toString();

        }catch(Exception ex){
     // response.sendRedirect("errorpage.jsp");
        }
        %>
        <%
        String username = request.getParameter("username");
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
        String whouse = request.getParameter("whouse");
        %>

        <%
        try {
            if (request.getParameter("button") !=null) {
               msg = scl.createUser(new helplogin(username, password, position));
               style = "success";
               msg = scl.addStaff(new staffHelper(username, firstname, lastname, gender, position, nationality, stateoforigin, lga, homeaddress, fonenumber, null, null,whouse));
               //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport, String whcode
               System.out.println("this my point of wahalaoooooo i don pass am");
               session.setAttribute("username", username);
               response.sendRedirect("printLoginDetails.jsp");

                //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport
            }
            } catch (Exception ex) {
            System.out.println();
            style = "error";
            }
        %>
        <table width="67%" border="0" align="center"  cellpadding="0" cellspacing="0">
          <tr>
            <td width="14%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td width="22%">&nbsp;</td>
            <td width="39%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr class="tableheader1">
            <td height="23"><a href="addSockAndInventoryEdition.jsp"><img src="images/Import Document.png" width="32" height="32"></a></td>
            <td><a href="supAddBranch.jsp"><img src="images/Add.png"/></a></td>
            <td><a href="supAddWarehouse.jsp"><img src="images/Add Green Button.png" width="32" height="32"></a></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr class="tableheader">
            <td height="36"><a href="addSockAndInventoryEdition.jsp">set  Edition</a></td>
            <td><a href="supAddBranch.jsp">Add Branch</a></td>
            <td><a href="supAddWarehouse.jsp">Add Warehouse</a></td>
            <td><a href="supperAdminCreateAdmin.jsp">Create User</a> </td>
            <td><a href="superControl.jsp">Logout</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="76%"> <form action="" method="post"  onsubmit="return validate(this);">
                        <fieldset style="width:600px;"  >
                            <legend class="tableheader"><strong>Login details</strong></legend>
                            <table width="100%" border="0"  cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="<%=style%>"><%=msg%></td>
                                </tr>
                                <tr>
                                  <td width="25%">&nbsp;</td>
                                    <td width="25%">&nbsp;</td>
                        <td width="45%">&nbsp;</td>
                                  <td width="5%">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="tab_lebel">&nbsp;</td>
                                    <td class="tab_lebel">Username</td>
                                  <td><input type="text" style="width:200px;" name="username" id="username" value="<%=(request.getParameter("username") != null) ? request.getParameter("username") : new String("")%>"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  <td><label></label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="tab_lebel">&nbsp;</td>
                                    <td class="tab_lebel">Password</td>
                                    <td><input type="password" style="width:200px;" name="password" id="password" value="<%=(request.getParameter("password") != null) ? request.getParameter("password") : new String("")%>"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
          </fieldset>
          <fieldset style="width:600px; " >
                            <legend class="tableheader"><strong>Personal Details</strong></legend>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="25%">&nbsp;</td>
                      <td width="25%">&nbsp;</td>
                      <td width="46%">&nbsp;</td>
                      <td width="4%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">First name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="firstname" id="firstname" value="<%=(request.getParameter("firstname") != null) ? request.getParameter("firstname") : new String("")%>">
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
                              <input type="text" style="width:200px;" name="lastname" id="lastname" value="<%=(request.getParameter("lastname") != null) ? request.getParameter("lastname") : new String("")%>">
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
                      <select name="gender" id="gender" style="width:200px;">
                        <option value="MALE"<%=request.getParameter("gender") != null && request.getParameter("gender").equalsIgnoreCase("MALE") ? new String("selected") : new String("")%>>MALE</option>
                        <option value="FEMALE" <%=request.getParameter("gender") != null && request.getParameter("gender").equalsIgnoreCase("FEMALE") ? new String("selected") : new String("")%>>FEMALE</option>
                      </select>
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
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Nationlatlity</td>
                      <td><label>
                              <select name="nationality" id="nationality" onchange="this.form.submit();" style="width:200px;">
                                  <option class="mspInputNav">---select one---</option>
                                  <%
                                                    try {
                                                        java.util.ArrayList aslistn = scl.viewAllNations();
                                                        java.util.Iterator in = aslistn.iterator();
                                                        while (in.hasNext()) {
                                                            np = (NationalityHelper) in.next();

                                                %>
                                  <option value="<%=np.getCode()%>" <%=request.getParameter("nationality") != null && request.getParameter("nationality").equalsIgnoreCase(np.getCode()) ? new String("selected") : new String("")%> class="mspInputNav"><%=np.getCountry()%></option>
                                  <%
                                                        }
                                                    } catch (Exception e) {
                                                        System.out.println("i can't see the nation");
                                                    }
                                  %>
                              </select>
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
                        <select name="stateoforigin" id="stateoforigin" onChange="this.form.submit();" style="width:200px;">
                                  <option class="mspinputnav">
                          ---select one---
                          <%
         if (request.getParameter("nationality") != null) {
             try {
                 java.util.ArrayList aslistn = scl.viewByCountry(request.getParameter("nationality"));
                 java.util.Iterator in = aslistn.iterator();
                 while (in.hasNext()) {
                     shh = (StateHelper) in.next();

                                                %>
                  <option value="<%=shh.getCode()%>" <%=request.getParameter("stateoforigin") != null && request.getParameter("stateoforigin").equalsIgnoreCase(shh.getCode()) ? new String("selected") : new String("")%> class="mspInputNav" ><%=shh.getState()%></option>
                          <%
                                                            }
                                                        } catch (Exception e) {
                                                            System.out.println("i can't see the nation");
                                                        }
                                                    }
                            %>
                        </select>
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
                              <select name="lga" id="lga" style="width:200px;">
                               <option>---select one---</option>
                     <%
                    if (request.getParameter("stateoforigin") != null) {
                        try {
                            java.util.ArrayList aslistn = scl.viewByState(request.getParameter("stateoforigin"));
                            java.util.Iterator in = aslistn.iterator();
                            while (in.hasNext()) {
                                lp = (LGAHelper) in.next();
                                                %>
                                  <option value="<%=lp.getCode()%>" <%=request.getParameter("lga") != null && request.getParameter("lga").equalsIgnoreCase(lp.getCode()) ? new String("selected") : new String("")%>  class="mspInputNav"><%=lp.getLga()%></option>
                                  <%
                            }
                        } catch (Exception e) {
                            System.out.println("i can't see the nation");
                        }
                    }
                      %>
                              </select>
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
                        <input type="text" style="width:200px;" name="homeaddress" id="homeaddress" value="<%=(request.getParameter("homeaddress") != null) ? request.getParameter("homeaddress") : new String("")%>">
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
                              <input type="text"  style="width:200px;" name="fonenumber" id="fonenumber" value="<%=(request.getParameter("fonenumber") != null) ? request.getParameter("fonenumber") : new String("")%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                      <td height="25">&nbsp;</td>
                    <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="tab_lebel">&nbsp;</td>
                    <td class="tab_lebel">Position</td>
                    <td><label>
                            <select name="position" id="position" style="width:200px;" onchange="this.form.submit();">
                        <option value="--select one--">--select one--</option>
                        <option value="STOCK"<%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("STOCK") ? new String("selected") : new String("")%>>stock</option>
                        <option value="SUPPLY" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("SUPPLY") ? new String("selected") : new String("")%>>supply</option>
                        <option value="PRODUCTION" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("PRODUCTION") ? new String("selected") : new String("")%>>production</option>
                        <option value="POS" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("POS") ? new String("selected") : new String("")%>>pos</option>
                        <option value="ADMIN" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("ADMIN") ? new String("selected") : new String("")%>>admin</option>
                      </select>
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
                    <td class="tab_lebel">Warehouse</td>
                    <td><label>
                      <select name="whouse" id="whouse" style="width:200px;">
                  <option value="">....select one.....</option>
                            <%
                                                    try {
                                                        java.util.ArrayList list = scl.viewAllWareHouses();
                                                        java.util.Iterator in = list.iterator();
                                                        while (in.hasNext()) {
                                                         helpwarehouse   hew = (helpwarehouse) in.next();

                                                %>
                                  <option value="<%=hew.getWhcode()%>" <%=request.getParameter("whouse") != null && request.getParameter("whouse").equalsIgnoreCase(hew.getWhcode()) ? new String("selected") : new String("")%> class="mspInputNav"><%=hew.getHouseName()%></option>
                                  <%
                                                    }
                                                    } catch (Exception e) {
                                                        System.out.println("i can't see the nation");
                                                    }
                                                %>
                      </select>
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
                    <td>&nbsp;</td>
                    <td><input type="submit"  class="bot"  name="button" id="button"  value="Submit"  ></td>
                    <td>&nbsp;</td>
                  </tr>
              </table>
          </fieldset>
        </form></td>
            <td width="22%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
       
    </body>
</html>

<%
 } catch (Exception ex) {
         response.sendRedirect("superControl.jsp");
 }
%>