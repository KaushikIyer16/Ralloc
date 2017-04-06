/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.routes;

import com.ralloc.bean.RoomBean;
import com.ralloc.bean.SubjectStudentCount;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.controller.Ralloc;
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
 * @author kaushiknsiyer
 */
@WebServlet(name = "GenerateRouteServlet", urlPatterns = {"/Generate"})
public class GenerateRouteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
    public static HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        Ralloc rallocController = new Ralloc();
        rallocController.getRoomAllocation();
        roomMap = rallocController.getRoomMap();
        detailedRoomMap = rallocController.getDetailedRoomMap();
        request.setAttribute("Date", request.getAttribute("Date"));
        request.setAttribute("Time", request.getAttribute("Time"));
        RequestDispatcher rq = request.getRequestDispatcher("viewAllotment.jsp");
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
