/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.model.DepartmentSubject;
import com.ralloc.model.Subject;
import static com.ralloc.view.DepartmentAdditionServlet.errorMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaushiknsiyer
 */
@WebServlet(name = "SubjectAdditionServlet", urlPatterns = {"/Subject/add"})
public class SubjectAdditionServlet extends HttpServlet {
    
    
    public static ArrayList<Subject> subjectList = new ArrayList<>();
    public static ArrayList<DepartmentSubject> departmentSubjectList = new ArrayList<>();
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
            throws ServletException, IOException{
            response.setContentType("text/html;charset=UTF-8");
        
//            response.sendRedirect(request.getHeader("referer"));
//        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<h1>mother fff servlets</h1>");
//            if (request.getAttribute("subjectList") == null) {
//                subjectList = new ArrayList<>();
//            } else {
//                subjectList = (ArrayList<Subject>)request.getAttribute("subjectList");
//            }
//            if (request.getAttribute("departmentSubjectList") == null) {
//                departmentSubjectList = new ArrayList<>();
//            } else {
//                departmentSubjectList = (ArrayList<DepartmentSubject>)request.getAttribute("departmentSubjectList");
//            }
            if(subjectList == null){
                subjectList = new ArrayList<>();
            }
            try{
            
            String courseCode = request.getParameter("courseCode");
            String chooseDept = request.getParameter("department");
            if(!courseCode.matches("[0-9]{2}[a-zA-Z]{2}[0-9][a-zA-Z]{5}")){
                throw new InputMismatchException("Invalid Course Code Format");
            } 
            else if(chooseDept == null){
                throw new InputMismatchException("Choose a valid Department");
            }
            else{
                subjectList.add(new com.ralloc.model.Subject(
                request.getParameter("courseCode"),
                request.getParameter("name"), 
                request.getParameter("deptElectGrp").equals("yes"),
                request.getParameter("clustElectGrp").equals("yes"),
                request.getParameter("instElectGrp").equals("yes"),
                request.getParameter("hasDependency").equals("yes") ? 1:-1
                ));
            }
            departmentSubjectList.add(new com.ralloc.model.DepartmentSubject(Integer.parseInt(request.getParameter("department")), request.getParameter("courseCode")));
            System.out.println(request.getParameter("instElectGrp"));
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("departmentSubjectList", departmentSubjectList);
//            out.println(subjectList.size());
//            RequestDispatcher rd = request.getRequestDispatcher("/Subject");
//            rd.forward(request, response);
            response.sendRedirect(request.getHeader("referer"));
            }
            catch(InputMismatchException ex){
                errorMessage = "An invalid or existing department data was entered : " + ex.getMessage();
                response.sendRedirect(request.getContextPath()+"/viewError.jsp");
                Logger.getLogger(SubjectAdditionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
//        }
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
