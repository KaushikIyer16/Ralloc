/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ralloc.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kaushiknsiyer
 */
@WebServlet(name = "InfrastructureAdditionServlet", urlPatterns = {"/Infrastructure/add"})
public class InfrastructureAdditionServlet extends HttpServlet {
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
//        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet InfrastructureAdditionServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Infrastructure Information</h1>");
//            out.println("<h2>"+request.getParameter("roomName")+"</h2>");
//            out.println("<h2>"+request.getParameter("hasDep")+"</h2>");
//            out.println("</body>");
//            out.println("</html>");
            try {
//                if(roomList == null){
//                roomList = new ArrayList<>();
//                roomList.add(new Room((String)request.getParameter("roomName"), Integer.parseInt(request.getParameter("roomCapacity")), request.getParameter("hasDep").equals("yes") ? 1: -1));
                String capacity = request.getParameter("roomCapacity");
                if(Integer.parseInt(capacity) <= 0)
                    throw new InputMismatchException("Invalid capacity entered");
                Room.addRoom(request.getParameter("roomName"), request.getParameter("roomCapacity"), request.getParameter("hasDep").equals("yes") ? 1: -1);
                response.sendRedirect(request.getHeader("referer"));
            }
            catch (Exception ex) {
                errorMessage = "Invalid or existing room entered : " + ex.getMessage();
                response.sendRedirect(request.getContextPath() + "/viewError.jsp");
                Logger.getLogger(InfrastructureAdditionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
