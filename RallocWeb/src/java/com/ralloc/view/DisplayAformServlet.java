/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.model.Student;
import static com.ralloc.view.UploadFileServlet.errorMessage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 *
 * @author Mahesh
 */
@WebServlet(name = "DisplayAformServlet", urlPatterns = {"/Aform/display"})
public class DisplayAformServlet extends HttpServlet {
    public static String errorMessage = "";
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
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(isMultipart)
        {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);
            HashMap<String, String> studentList = new HashMap<>();
            HashMap<String, HashMap<String, String>> subjectStudents = new HashMap<>();
            try {
                List<FileItem> formItems = upload.parseRequest(request);
                Iterator<FileItem> formIterator =  formItems.iterator();
                while (formIterator.hasNext()){
                    FileItem currFormItem = formIterator.next();
                    if (!currFormItem.isFormField()) {
                        
                        InputStream uploadedFileStream = currFormItem.getInputStream();
                        Workbook detailsBook = WorkbookFactory.create(uploadedFileStream);
                        
                        for(int i=0; i<detailsBook.getNumberOfSheets(); i++)
                          {
                              Sheet currentSheet = detailsBook.getSheetAt(i);
                              Iterator<Row> rowIterator = currentSheet.iterator();
                              while(rowIterator.hasNext())
                              {
                                Row currentRow = rowIterator.next();
                                String currentUsn = currentRow.getCell(0).getStringCellValue();
                                String currentStatus = (String)currentRow.getCell(1).getStringCellValue();
                                if(currentUsn == null || currentStatus == null)
                                {
                                    throw new InvalidFormatException("Document format invalid at " + currentUsn);
                                }
                                studentList.put(currentUsn, currentStatus);
                              }
                              subjectStudents.put(currentSheet.getSheetName(), studentList);
                          }
                    } 
                }
                System.out.println("Till here its fine");
                RequestDispatcher rq = request.getRequestDispatcher("/aForm.jsp");
                request.setAttribute("studentList", studentList);
                request.setAttribute("subjectStudents", subjectStudents);
                rq.forward(request, response);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                errorMessage = e.getMessage();
                response.sendRedirect(request.getContextPath()+"/viewError.jsp");
                Logger.getLogger(UploadFileServlet.class.getName()).log(Level.SEVERE, null, e);
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
