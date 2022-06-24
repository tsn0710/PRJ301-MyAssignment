/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;


import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author Tong Nhat
 */
public class attendanceForALesson extends HttpServlet {

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
//        response.getWriter().print(request.getParameter("id")+"\n"
//                +request.getParameter("group")+"\n"
//                + request.getParameter("course")+"\n"
//                + request.getParameter("instructor")+"\n"
//                + request.getParameter("slot")+"\n"
//                + request.getParameter("room")+"\n"
//                + request.getParameter("date"));
        int idOfLesson = Integer.parseInt(request.getParameter("id"));
//just need idOfLesson to get list of Student in this Lesson so im comment all below
//        String group = request.getParameter("group");
//        String course = request.getParameter("course");
//        String instructor = request.getParameter("instructor");
//        int slot = Integer.parseInt(request.getParameter("slot"));
//        String room = request.getParameter("room");
//        Date date = Date.valueOf(request.getParameter("date"));
 //           response.getWriter().print(idOfLesson);
        StudentDBContext sdbc = new StudentDBContext();
        ArrayList<Student> studentList = sdbc.list(idOfLesson);
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("view/attendanceForALesson.jsp").forward(request, response);
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
