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
import java.time.LocalDate;
import static java.time.temporal.ChronoUnit.DAYS;
import java.util.ArrayList;
import model.Week;

/**
 *
 * @author Tong Nhat
 */
public class timetable3 extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet timetable3</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet timetable3 at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ArrayList<String> campusList = new ArrayList<>();
        campusList.add("FU-HL");
        campusList.add("FU-Hồ Chí Minh");
        campusList.add("FU-Đà Nẵng");
        request.setAttribute("campusList", campusList);
        WeekDBContext wDBC = new WeekDBContext();
        ArrayList<Week> weekList = wDBC.list();
        request.setAttribute("weekList", weekList);
        //input:campus(String),
        //      lecture(String)         
        //      noOfWeek(int)        Ex: 2
        //output:7 dayOfWeeks (of this week, now) Ex: 10/1/2022 to 16/1/2022 (for week 2)
        //       numberOfWeek(int) (of this week, now)
        //         lessons (arrayList)   all lesson of this week(now) for that input 
//Date: now  
        String campus = request.getParameter("campus");
        String lecture = request.getParameter("lecture");
        //return output numberOfWeek(int) 
        int numberOfWeek = Integer.parseInt(request.getParameter("numberOfWeek"));
        request.setAttribute("numberOfWeek",numberOfWeek);
        //System.out.println(start.toString()+"------"+end.toString()+"------"+numberOfWeekNow+"------------"+(double)DAYS.between(end,start)/7);
        //return output 7 dayOfWeeks (of this week, now):
        request.setAttribute("dayOfWeeks",wDBC.getDaysOfWeek(numberOfWeek));
        //return output lessons
        LessonDBContext lDBC = new LessonDBContext();
        request.setAttribute("lessons",lDBC.listAllLessonInThisWeekAndLecture(numberOfWeek, lecture));

        request.getRequestDispatcher("view/Timetable3.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
