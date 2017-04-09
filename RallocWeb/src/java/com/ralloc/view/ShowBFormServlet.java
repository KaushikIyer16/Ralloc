/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import com.ralloc.bean.RoomBean;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.routes.GenerateRouteServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ShowBFormServlet", urlPatterns = {"/Generate/show/bform"})
public class ShowBFormServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void printDetailedRoomAllocation() {
        for (RoomBean room : GenerateRouteServlet.detailedRoomMap.keySet()) {
            ArrayList<SubjectStudentUsn> currRoomUsn = GenerateRouteServlet.detailedRoomMap.get(room);
            System.out.println("\n+++"+room.getRoomId()+"\n");
            int i=0;
            for (SubjectStudentUsn subjectStudentUsn : currRoomUsn) {
                System.out.println("\n\n -->  "+subjectStudentUsn.getCourseCode());
                
                ArrayList<String> usnList = subjectStudentUsn.getUsnList();
                for (String string : usnList) {
                    if (i<4) {
                        System.out.print(string+" ");
                        i++;
                    } else {
                        System.out.println(string+" ");
                        i=0;
                    }
                }
            }
            
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //printDetailedRoomAllocation();
        System.out.println("the value of date and time is "+request.getAttribute("date"));
        request.setAttribute("roomMap", GenerateRouteServlet.roomMap);
        request.setAttribute("detailRoomMap", GenerateRouteServlet.detailedRoomMap);
        request.setAttribute("Date", request.getParameter("Date"));
        request.setAttribute("Time", request.getParameter("Time"));

        RequestDispatcher rq = request.getRequestDispatcher("/bForm.jsp");
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
