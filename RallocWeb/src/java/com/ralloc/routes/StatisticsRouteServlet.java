/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.routes;

import com.ralloc.bean.RoomBean;
import com.ralloc.bean.StatisticsBean;
import com.ralloc.bean.StudentBean;
import com.ralloc.bean.SubjectStudentCount;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.model.Department;
import com.ralloc.model.Room;
import com.ralloc.model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sree
 */
@WebServlet(name = "StatisticsRouteServlet", urlPatterns = {"/Stats"})
public class StatisticsRouteServlet extends HttpServlet {
    
    public static ArrayList<StatisticsBean> statTableList;
    
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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet StatisticsRouteServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet StatisticsRouteServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

        try{
            HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap = GenerateRouteServlet.detailedRoomMap;
            
            HashMap<String, Integer> allStudentList = Student.getAllStudentDepartment();
            
            ArrayList<StatisticsBean> tempStatTable = new ArrayList<>();
            
            for(RoomBean roomBean : detailedRoomMap.keySet()){
                ArrayList<SubjectStudentUsn> subjectList = detailedRoomMap.get(roomBean);
                for(SubjectStudentUsn subject: subjectList){
                    int[] deptCount = new int[100];
                    for(String usn: subject.getUsnList()){
                        deptCount[allStudentList.get(usn)]++;
                    }
                    for(int i=0; i<deptCount.length; i++){
                        if (deptCount[i] != 0) {
                            tempStatTable.add(new StatisticsBean(subject.getCourseCode(), Room.getRoomNameById(roomBean.getRoomId()), deptCount[i], Department.getDepartmentNameById(i)));
                        }
                    }
                }
            }
            statTableList = tempStatTable;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        RequestDispatcher rq = request.getRequestDispatcher("/viewStats.jsp");
        rq.forward(request, response);
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
