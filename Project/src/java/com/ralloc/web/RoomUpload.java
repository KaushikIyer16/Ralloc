/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.web;

import com.ralloc.bean.*;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="a",urlPatterns = {"/aa"})
public class RoomUpload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            List<ClassRoom> C = new ArrayList<ClassRoom>();
            String numStr = request.getParameter("no");
            int i, n = Integer.parseInt(numStr);
            for(i=1; i<=n; i++)
            {
                String rid=request.getParameter("Room_Id" + Integer.toString(i));
                String rname=request.getParameter("Room_name" + Integer.toString(i));
                String cap=request.getParameter("Capacity" + Integer.toString(i));
                C.add(new ClassRoom(Integer.parseInt(rid),Integer.parseInt(cap), rname));
        }
            request.setAttribute("no",n);
            
            /*
                    C is the list of ClassRoom Objects
            
            */
            request.setAttribute("ClassList",C);
            RequestDispatcher view = request.getRequestDispatcher("Room.jsp");
            view.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if RoomUpload servlet-specific error occurs
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
     * @throws ServletException if RoomUpload servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns RoomUpload short description of the servlet.
     *
     * @return RoomUpload String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
