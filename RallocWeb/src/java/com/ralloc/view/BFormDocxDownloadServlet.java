/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.controller.BFormDocument;
import com.ralloc.controller.IndentDocument;
import com.ralloc.routes.AllocateRouteServlet;
import com.ralloc.routes.GenerateRouteServlet;
import static com.ralloc.routes.GenerateRouteServlet.detailedRoomMap;
import static com.ralloc.routes.GenerateRouteServlet.roomMap;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

/**
 *
 * @author Bhargav
 */
@WebServlet(name = "BFormDocxDownloadServlet", urlPatterns = {"/Download/bFormDocument"})
public class BFormDocxDownloadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public File bFormFile;
    public String date,time;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
       DiskFileItemFactory factory = new DiskFileItemFactory();
       date=AllocateRouteServlet.examDate;
       time=AllocateRouteServlet.examTime;
        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File docRepository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        //FileOutputStream fileStream=null;
        bFormFile = File.createTempFile("bform"+date+" "+time,".docx", docRepository);
        //FileOutputStream out = new FileOutputStream(new File(tmpDir,"RoomAllocation.docx"));
        FileOutputStream out = new FileOutputStream(bFormFile);
        bFormFile.deleteOnExit();
        
        BFormDocument populateBFormDocx = new BFormDocument(out,detailedRoomMap,AllocateRouteServlet.examDate,AllocateRouteServlet.examTime,getServletContext().getResourceAsStream("/images/BMS_LOGO_Print.png"));
        System.out.println(getServletContext().getResourceAsStream("/images/BMS_LOGO_Print.png"));
        try
        {
        populateBFormDocx.createDoc();
        }
        catch(SQLException ex){
            System.out.println(ex);
        }
         FileInputStream inStream = new FileInputStream(bFormFile);
         
        // if you want to use a relative path to context root:
        String relativePath = getServletContext().getRealPath("");
        System.out.println("relativePath = " + relativePath);
         
        // obtains ServletContext
        ServletContext context = getServletContext();
         
        // gets MIME type of the file
        String mimeType = context.getMimeType(bFormFile.getAbsolutePath());
        if (mimeType == null) {        
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
         
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) bFormFile.length());
         
        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", bFormFile.getName());
        response.setHeader(headerKey, headerValue);
         
        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
         
        while ((bytesRead = inStream.read(buffer)) != -1) {
            System.out.println(bytesRead);
            outStream.write(buffer, 0, bytesRead);
        }
         
        inStream.close();
        outStream.close();     
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(BFormDocxDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(BFormDocxDownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
