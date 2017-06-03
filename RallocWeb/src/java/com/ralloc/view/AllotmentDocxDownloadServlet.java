/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.controller.AllotmentDocument;
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
@WebServlet(name = "AllotmentDocxDownloadServlet", urlPatterns = {"/Download/allotmentDocument"})
public class AllotmentDocxDownloadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public File roomAllocationFile;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        
        
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File docRepository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        //FileOutputStream fileStream=null;
        roomAllocationFile = File.createTempFile("RoomAllocation", ".docx", docRepository);
        //FileOutputStream out = new FileOutputStream(new File(tmpDir,"RoomAllocation.docx"));
        FileOutputStream out = new FileOutputStream(roomAllocationFile);
        roomAllocationFile.deleteOnExit();
        AllotmentDocument populateRoomDocx = new AllotmentDocument();
        try
        {
        populateRoomDocx.writeAllotment(out,detailedRoomMap, roomMap);
        }
        catch(SQLException ex){
            System.out.println(ex);
        }
         FileInputStream inStream = new FileInputStream(roomAllocationFile);
         
        // if you want to use a relative path to context root:
        String relativePath = getServletContext().getRealPath("");
        System.out.println("relativePath = " + relativePath);
         
        // obtains ServletContext
        ServletContext context = getServletContext();
         
        // gets MIME type of the file
        String mimeType = context.getMimeType(roomAllocationFile.getAbsolutePath());
        if (mimeType == null) {        
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        System.out.println("MIME type: " + mimeType);
         
        // modifies response
        response.setContentType(mimeType);
        response.setContentLength((int) roomAllocationFile.length());
         
        // forces download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", roomAllocationFile.getName());
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
        
       
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             
        processRequest(request, response);
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
