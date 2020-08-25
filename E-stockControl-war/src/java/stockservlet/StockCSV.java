/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockservlet;

import com.csvreader.CsvReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import stockcontrolhelper.stockClearance;
import stockcontrolsession.SControlLocal;
import stockcontrolsession.SControlLocalHome;

/**
 *
 * @author Terseer
 */
public class StockCSV extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
           HttpSession session = request.getSession();
         if (true) {
            // create sessionbeanlocal obj
            SControlLocal al = lookupSControlBean();
            //SControlLocal lookupSControlBean()

            // collection to hold affected records
            ArrayList arl = new ArrayList();

            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                String code = session.getAttribute("whcode").toString();
                String username = session.getAttribute("username").toString();
                // Parse the request
                List /* FileItem */ items = upload.parseRequest(request);

                // Process the uploaded items
                Iterator iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    // Process a file upload
                    if (!item.isFormField()) {
                        // String fieldName = item.getFieldName();
                        // String contentType = item.getContentType();
                        // boolean isInMemory = item.isInMemory();
                        // long sizeInBytes = item.getSize();
                        // String fileName = item.getName();

                        // get the input stream of this csv file into buffer
                        CsvReader csv = new CsvReader(item.getInputStream(), Charset.defaultCharset());

                        // read csv headers
                        csv.readHeaders();

                        // loop through the records
                        while (csv.readRecord()) {
                            String commodityId = csv.get("commodityId");
                            String quantityIn = csv.get("quantityIn");
                            String receivedDate = csv.get("receivedDate");
                            String receivedBy = csv.get("receivedBy");
                            String unit = csv.get("unit");
                            String unitprice = csv.get("unitprice");
                            String unitcode = csv.get("unitcode");
                           // Integer quantitySupplied = csv.get("quantitySupplied");
                            String compartments = csv.get("compartments");
                            String status = csv.get("status");
                            //String whousecode = csv.get("//");
                            String MakeOrBuy = csv.get("MakeOrBuy");
                            String barcode = csv.get("barcode");
                            String category = csv.get("category");
                            String batchcode = csv.get("batchcode");

                           // version consideration
                            // check for duplicate records
                            stockClearance cdo = new stockClearance(commodityId, new Integer(quantityIn), receivedDate, username, unit, new Float(unitprice), unitcode, compartments,  code, MakeOrBuy, category,batchcode, status);
                            al.upLoadStocks(commodityId.toUpperCase(), new Integer(quantityIn), receivedDate, username, unit, new Float(unitprice), unitcode, compartments, code, MakeOrBuy, category, batchcode,username);
                            //String commodityId, Integer quantityIn, String receivedDate, String receivedBy, String unit, Float unitprice, String unitcode, String compactments, String status, String whousecode, String MakeOrBuy,String category, String batchcode


                            // add this copper to our collection for presentation
                            arl.add(cdo);
                        }
                        csv.close();
                    }
                }
            }
            catch (FileUploadException fx) {}
            catch (Exception ex) {
                System.out.println(ex.getMessage());
                ex.printStackTrace();
            }

            // set this collcetion session and proceed to reports page
       //
            session.setAttribute("arl", arl);

            // redirect to reports page
            response.sendRedirect("stockUploadReport.jsp");
        }
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StockCSV</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StockCSV at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
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
}
