/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.model.DepartmentSubject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ralloc.model.Subject;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author kaushiknsiyer
 */
@WebServlet(name = "SubjectConfirmationServlet", urlPatterns = {"/Subject/confirm"})
public class SubjectConfirmationServlet extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        //try (PrintWriter out = response.getWriter()) {
            try {
                /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>the subjects are</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SubjectConfirmationServlet at " + request.getContextPath() + "</h1>");
//            
//            out.println("<table>");
//            for (int i = 0; i < SubjectAdditionServlet.subjectList.size(); i++) {
//                out.println("<h2>"+SubjectAdditionServlet.subjectList.get(i).getCourseCode()+"</h2><br/>");
//            }
//            out.println("</table>");
//            out.println("</body>");
//            out.println("</html>");
              Subject.addSubjectList(SubjectAdditionServlet.subjectList);
              DepartmentSubject.addSubject(SubjectAdditionServlet.departmentSubjectList);
            } catch (SQLException ex) {
                Logger.getLogger(SubjectConfirmationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("subjectList", SubjectAdditionServlet.subjectList);
            //SubjectAdditionServlet.subjectList = null;
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(request.getContextPath()+"/verifySubject.jsp");
            requestDispatcher.forward(request, response);
        //}
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
