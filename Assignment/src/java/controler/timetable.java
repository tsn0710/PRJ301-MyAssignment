/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.LessonDBContext;
import dal.WeekDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Lesson;
import model.Week;

/**
 *
 * @author Tong Nhat
 */
public class timetable extends HttpServlet {

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
        //input: no
        //output: campusList
        //        weekList
        //to weeklyTimetable.jsp
        ArrayList<String> campusList = new ArrayList<>();
        campusList.add("FU-HL");
        campusList.add("FU-Hồ Chí Minh");
        campusList.add("FU-Đà Nẵng");
        request.setAttribute("campusList", campusList);
        WeekDBContext wDBC = new WeekDBContext();
        ArrayList<Week> weekList = wDBC.list();
        request.setAttribute("weekList", weekList);
        request.getRequestDispatcher("view/weeklyTimetable.jsp").forward(request, response);
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
        //input:campus(String),
        //      lecture(String)
        //      numberOfWeek(int)
        //output:8 ArrayList: slot 1 to slot 8. Each slot contain Lesson in 7 day: Mon to Sun
        //       weekList(arrayList)
//       Date: now 
        String campus = request.getParameter("campus");
        String lecture = request.getParameter("lecture");
        int numberOfWeek = Integer.parseInt(request.getParameter("numberOfWeek"));
//validate 

        //output
        String slot = "";
        for (int i = 1; i <= 8; i++) { //for each slot:
            slot = "slot" + i;
            ArrayList<Lesson> lessons = new ArrayList<>();
            LessonDBContext ldbc = new LessonDBContext();
            //List of Lesson in slot i
            lessons = ldbc.list(i,numberOfWeek);
            if(lessons==null || lessons.size()==0){
                continue;
            }
            request.setAttribute(slot, lessons);

        }
        ArrayList<String> campusList = new ArrayList<>();
        campusList.add("FU-HL");
        campusList.add("FU-Hồ Chí Minh");
        campusList.add("FU-Đà Nẵng");
        request.setAttribute("campusList", campusList);
        WeekDBContext wDBC = new WeekDBContext();
        ArrayList<Week> weekList = wDBC.list();
        request.setAttribute("weekList", weekList);
        request.getRequestDispatcher("view/weeklyTimetable.jsp").forward(request, response);
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
