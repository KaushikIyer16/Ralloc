/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.model.Student;
import com.ralloc.routes.AllocateRouteServlet;
import com.ralloc.routes.GenerateRouteServlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
    
    public static String errorMessage = "";
//    public static String timeString = "";
    
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
                  int t = 0;
                  String[] tempDateTimeValues = new String[2];
                  // Parse the request
                  List<FileItem> formItems = upload.parseRequest(request);
                  Iterator<FileItem> formIterator =  formItems.iterator();
                  while (formIterator.hasNext()) {
                      FileItem currFormItem = formIterator.next();
                      
                      if (currFormItem.isFormField()) {
//                          System.out.println(""+currFormItem.getFieldName()+"<---->"+currFormItem.getString()+"");
                          tempDateTimeValues[t++] = currFormItem.getString();
                      } 
                      else {
                          // this means that it is a form item
                          // take the uploadedFileStream as a parameter in the constructor to the excelWriter class
                          InputStream uploadedFileStream = currFormItem.getInputStream();
                          Workbook detailsBook = WorkbookFactory.create(uploadedFileStream);
                          ArrayList<Student> studentList;
                          HashMap<String, ArrayList<Student>> subjectStudents = new HashMap<>();
                          for(int i=0; i<detailsBook.getNumberOfSheets(); i++)
                          {
                              studentList = new ArrayList();
                              Sheet currentSheet = detailsBook.getSheetAt(i);
                              Iterator<Row> rowIterator = currentSheet.iterator();
                              while(rowIterator.hasNext())
                              {
                                Row currentRow = rowIterator.next();
//                                  Iterator<Cell> cellIterator = currentRow.iterator();
//                                  while(cellIterator.hasNext())
//                                      studentList.add(cellIterator.next().getStringCellValue());
                                String currentUsn = currentRow.getCell(0).getStringCellValue();
                                int currentDeptId = (int)currentRow.getCell(1).getNumericCellValue();
                                if(currentUsn == null || currentDeptId == 0)
                                {
                                    throw new InvalidFormatException("Document format invalid at " + currentUsn);
                                }
                                studentList.add(new Student(currentUsn, currentDeptId));
                              }
                              subjectStudents.put(currentSheet.getSheetName(), studentList);
                          }
                          // below is just a simple way to print the contents of the stream
                          Student.addStudents(subjectStudents);
//                          GenerateRouteServlet.date = tempDateTimeValues[0];
//                          GenerateRouteServlet.time = tempDateTimeValues[1];
                          //System.out.println("date value is -----> " + tempDateTimeValues[0]);
                          
                      }
                      
                  }
                  if (GenerateRouteServlet.detailedRoomMap != null) {
                      GenerateRouteServlet.detailedRoomMap.clear();
                  }
                  if (GenerateRouteServlet.roomMap != null) {
                      GenerateRouteServlet.roomMap.clear();
                  }
                  if (!AllocateRouteServlet.examDate.equalsIgnoreCase("")) {
                      AllocateRouteServlet.examDate = "";
                  }
                  if (!AllocateRouteServlet.examTime.equalsIgnoreCase("")) {
                      AllocateRouteServlet.examTime = "";
                  }
                  AllocateRouteServlet.examDate = tempDateTimeValues[0];
                  AllocateRouteServlet.examTime = tempDateTimeValues[1];
                  
//                  if (GenerateRouteServlet.date != null) {
//                      GenerateRouteServlet.date = "";
//                  }
//                  if (GenerateRouteServlet.time != null) {
//                      GenerateRouteServlet.time = "";
//                  }
                  
                  response.sendRedirect(request.getContextPath()+"/home");
              } catch (IOException | SQLException | FileUploadException | EncryptedDocumentException | InvalidFormatException | NullPointerException ex) {
                  System.out.println(ex.getMessage());
                  errorMessage = ex.getMessage();
                  response.sendRedirect(request.getContextPath()+"/viewError.jsp");
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
