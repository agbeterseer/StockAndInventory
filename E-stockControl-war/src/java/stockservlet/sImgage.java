/*
 * sImgage.java
 *
 * Created on November 27, 2009, 4:26 PM
 */
package stockservlet;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.*;
import javax.servlet.http.*;
import stockcontrolhelper.staffHelper;
import stockcontrolsession.SControlLocal;
import stockcontrolsession.SControlLocalHome;

/**
 *
 * @author Terseer
 * @version
 */
public class sImgage extends HttpServlet {

    SControlLocal scl = null;
    String msg = null;

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        String pK = request.getParameter("regno");
        String username1 = "";
        //System.out.println("pk is " + pK);
        HttpSession session = request.getSession();

        if (pK != null) {
               //   System.out.println("na soooooooooooooooooooo==:::pK=="+pK);
            response.flushBuffer();

            response.setContentType("image/jpg");
            ServletOutputStream outStream = response.getOutputStream();

            scl = this.lookupSControlBean();
            staffHelper sh = scl.viewSingleStaff(pK);

            if (response.isCommitted()) {
                outStream.write(sh.getPassport());
                response.flushBuffer();
            }
        }

        if (username1 != null) {
            
            //System.out.println("na soooooooooooooooooooo==:::"+username1);
            try {
                username1 = session.getAttribute("username").toString();
                //setPic(item.get());
                response.flushBuffer();

                response.setContentType("image/jpg");
                ServletOutputStream outStream = response.getOutputStream();

                scl = this.lookupSControlBean();
                staffHelper sh = scl.viewSingleStaff(username1);

                if (response.isCommitted()) {
                    outStream.write(sh.getPassport());
                    response.flushBuffer();
                }

            } catch (Exception ex) {
                // response.sendRedirect("appPotoError.jsp");
                System.out.println("this is where the problem lies");
                ex.printStackTrace();
            }
        }
    }

    private SControlLocal lookupSControlBean() {
        try {
            Context c = new InitialContext();
            SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
    
