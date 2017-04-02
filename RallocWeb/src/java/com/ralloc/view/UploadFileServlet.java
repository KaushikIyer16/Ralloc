/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author kaushiknsiyer
 */
@WebServlet(name = "UploadStudentFileServlet", urlPatterns = {"/Allocate/add"})
@MultipartConfig
public class UploadFileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UploadFileServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UploadFileServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
          boolean isMultipart = ServletFileUpload.isMultipartContent(request);
          if (isMultipart) {
              out.println("there is a multipart request");
              
              // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Configure a repository (to ensure a secure temp location is used)
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

              try {
                  // Parse the request
                  List<FileItem> formItems = upload.parseRequest(request);
                  Iterator<FileItem> formIterator =  formItems.iterator();
                  while (formIterator.hasNext()) {
                      FileItem currFormItem = formIterator.next();
                      
                      if (currFormItem.isFormField()) {
                          out.println("<h2>"+currFormItem.getFieldName()+"<---->"+currFormItem.getString()+"</h2>");
                      } else {
                          // this means that it is a form item
                          // take the uploadedFileStream as a parameter in the constructor to the excelWriter class
                          InputStream uploadedFileStream = currFormItem.getInputStream();
                          // below is just a simple way to print the contents of the stream
                          StringWriter writer = new StringWriter();
                          IOUtils.copy(uploadedFileStream,writer, "UTF-8");
                          out.println("<h2>"+writer.toString()+"</h2>");
                      }
                      
                  }
                  
              } catch (FileUploadException ex) {
                  Logger.getLogger(UploadFileServlet.class.getName()).log(Level.SEVERE, null, ex);
              }
            }
          
        }
          
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
