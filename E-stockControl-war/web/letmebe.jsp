<%-- 
    Document   : letmebe
    Created on : Oct 26, 2011, 8:52:21 AM
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
        <title>letmebe</title>
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");


            if (username != null && username != "" && password != null && password != "") {

                // System.out.println("username to lowercadse==:" +username);
                //System.out.println("password to lowercadse==:" +password);

                String a = "";
                String b = "";
                String user = "";
                String pass = "";
                String msg = "";
                String stname = "";


                try {

                    ArrayList llistt = scl.viewAllCostMethod();

                    Iterator i = llistt.iterator();
                    while (i.hasNext()) {

                        hsc = (helpSetCost) i.next();

                        valu = hsc.getCostType();

                        sta = hsc.getStatus();
                    }
                    session.setAttribute("sta", hsc.getStatus());
                    session.setAttribute("valu", hsc.getCostType());

                } catch (Exception ex) {
                    System.out.println();
                }

                //    tt = username.substring(0, 3);
                try {

                    if (password.equalsIgnoreCase("superadmin") && username.equalsIgnoreCase("superadmin")) {

                        session.setAttribute("username", username);
                        response.sendRedirect("superAdmin.jsp");
                    }

                    msg = scl.authenticatePassword(password, username);

                    if (!password.equalsIgnoreCase(msg)) {
                        System.out.println("msgmsg  ==msg" + msg);
                        mssg = msg;
                    } else {

                        session.setAttribute("msg", msg);

                        if (username.equalsIgnoreCase(scl.viewSingleUser(username).getUsername()) && password.equalsIgnoreCase(scl.viewSingleUser(username).getPassword())) {
                            if (password.equalsIgnoreCase(msg)) {
                                hl = scl.viewSingleUser(username);
                                //rh = sr.viewRole(uh.getRole(),);
                                msg = "";
                                session.setAttribute("username", username);
                                if (hl.getRole().equalsIgnoreCase("STOCK")) {
                                    hstaff = scl.viewSingleStaff(username);
                                    stname = hstaff.getFirstName().toUpperCase() + " " + hstaff.getLastName().toUpperCase();
                                    //y = scl.viewStudent(username);
                                    String wh = hstaff.getWhcode();
                                    //code = y.getSchoolcode();
                                    //  stud = y.getSurname().toUpperCase() + ", " + y.getFirstName().toUpperCase();
                                    System.out.println("wwwwwwwwwww"+wh);
                                    //image = y.getPassport();
                                    //session.setAttribute("code", code);
                                    session.setAttribute("whcode", wh);
                                    session.setAttribute("stname", stname);
                                    response.sendRedirect("storeMenu.jsp");
                                }
                                if (hl.getRole().equalsIgnoreCase("SUPPLY")) {
                                    hstaff = scl.viewSingleStaff(username);
                                    stname = hstaff.getFirstName().toUpperCase() + " " + hstaff.getLastName().toUpperCase();
                                    //y = scl.viewStudent(username);
                                    //code = y.getSchoolcode();
                                    //  stud = y.getSurname().toUpperCase() + ", " + y.getFirstName().toUpperCase();
                                    //image = y.getPassport();
                                    //session.setAttribute("code", code);
                                    // session.setAttribute("stud", stud);
                                     session.setAttribute("whcode", hstaff.getWhcode());
                                    session.setAttribute("stname", stname);
                                    response.sendRedirect("supplyMenu.jsp");
                                }
                                if (hl.getRole().equalsIgnoreCase("PRODUCTION")) {
                                    hstaff = scl.viewSingleStaff(username);
                                    //code = y.getSchoolcode();
                                    stname = hstaff.getFirstName().toUpperCase() + "  " + hstaff.getLastName().toUpperCase();
                                    //image = y.getPassport();
                                    //session.setAttribute("code", code);
                                     session.setAttribute("whcode", hstaff.getWhcode());
                                    session.setAttribute("stname", stname);
                                    response.sendRedirect("productionHome.jsp");
                                }
                                if (hl.getRole().equalsIgnoreCase("POS")) {
                                    //y = scl.viewStudent(username);
                                    //code = y.getSchoolcode();
                                    // stud = y.getSurname().toUpperCase() + ", " + y.getFirstName().toUpperCase();
                                    //image = y.getPassport();
                                    //session.setAttribute("code", code);
                                    // session.setAttribute("stud", stud);
                                     session.setAttribute("whcode", hstaff.getWhcode());
                                    response.sendRedirect("pos/poshome.jsp");
                                }
                                if (hl.getRole().equalsIgnoreCase("ADMIN")) {
                                    hstaff = scl.viewSingleStaff(username);
                                    stname = hstaff.getFirstName().toUpperCase() + "  " + hstaff.getLastName().toUpperCase();
                                    session.setAttribute("stname", stname);
                                    //y = scl.viewStudent(username);
                                    //code = y.getSchoolcode();
                                    // stud = y.getSurname().toUpperCase() + ", " + y.getFirstName().toUpperCase();
                                    //image = y.getPassport();
                                    //session.setAttribute("code", code);
                                    // session.setAttribute("stud", stud);
                                     session.setAttribute("whcode", hstaff.getWhcode());
                                    response.sendRedirect("adminMenu.jsp");
                                }

                            }
                        }
                    }
                } catch (Exception ex) {
                    System.out.println();
                }
            }
        %>
   <fieldset style="width:400px; margin-left:35%;"><legend style="font-family: Arial, Helvetica, sans-serif; font:small; color:#996633">login</legend>   <form action="" method="post"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="45%">&nbsp;</td>
                        <td width="39%">&nbsp;</td>
                        <td width="16%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">Username:</td>
                        <td><label>
                                <input type="text" style="width:200px;" name="username" id="username">
                            </label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">Password:</td>
                        <td><label>
                                <input type="password" style="width:200px;" name="password" id="password">
                            </label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><label>
                                <input name="loginb" type="submit" class="boton" id="loginb" value="Submit">
                            </label></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </form></fieldset>
    </body>
</html>
