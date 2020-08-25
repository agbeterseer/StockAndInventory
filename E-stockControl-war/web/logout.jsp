<%-- 
    Document   : logout
    Created on : Jun 7, 2011, 3:23:27 PM
    Author     : Terseer
--%>

<%@page contentType="text/html"%>
<%@page import= "java.util.*"%>


<%
    session = request.getSession();
    try{
        if(session == null){
            session.setAttribute("logoutMessage", "Please log in again!");
            response.sendRedirect("exit.jsp");


        }
    }catch(Exception eex){
        System.out.println("There is a problem in session == null condition!" + eex.getMessage());
    }


    if(session != null){
        try{

            session.invalidate();
            response.sendRedirect("exit.jsp");
%>


<%
        }catch(java.lang.IllegalStateException e){
            System.out.println("IllegalStateExcepton: " + e.getMessage());
            e.printStackTrace();
        }catch(Exception ex){
            System.out.println("An Exception occured in logoff.jsp " + ex.getMessage());
        }
    }
%>