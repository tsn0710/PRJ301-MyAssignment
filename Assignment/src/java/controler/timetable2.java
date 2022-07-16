/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.LessonDBContext;
import dal.StudentLessonDBContext;
import dal.WeekDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;
import java.util.ArrayList;
import model.Account;
import model.Lesson;
import model.Week;

/**
 *
 * @author Tong Nhat
 */
public class timetable2 extends HttpServlet {

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
        HttpSession aSession = request.getSession();
        Account acc=(Account)aSession.getAttribute("acc");
        if(acc==null){
            response.getWriter().print("access denied");
            return;
        }
        
        //input: no
        //output: campusList
        //        weekList
        //to Timetable3.jsp
        ArrayList<String> campusList = new ArrayList<>();
        campusList.add("FU-HL");
        //campusList.add("FU-Hồ Chí Minh");
        //campusList.add("FU-Đà Nẵng");
        request.setAttribute("campusList", campusList);
        WeekDBContext wDBC = new WeekDBContext();
        ArrayList<Week> weekList = wDBC.list();
        request.setAttribute("weekList", weekList);
        request.setAttribute("numberOfWeek", 1);
        int numberOfWeek = 1;
        //return output dayOfWeeks:
        request.setAttribute("dayOfWeeks", wDBC.getDaysOfWeek(numberOfWeek));
        //return output lessons
        request.setAttribute("lessons", null);
        request.getRequestDispatcher("view/Timetable3.jsp").forward(request, response);
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
        HttpSession aSession = request.getSession();
        Account acc=(Account)aSession.getAttribute("acc");
        if(acc==null){
            response.getWriter().print("access denied");
            return;
        }
        
        String howToView = request.getParameter("howToView");
        if (howToView.equals("viewInThisPage2")) {
            return;
        }else if(howToView.equals("View")){
            //tiep tuc
        }
        ArrayList<String> campusList = new ArrayList<>();
        campusList.add("FU-HL");
        campusList.add("FU-Hồ Chí Minh");
        campusList.add("FU-Đà Nẵng");
        request.setAttribute("campusList", campusList);
        WeekDBContext wDBC = new WeekDBContext();
        ArrayList<Week> weekList = wDBC.list();
        request.setAttribute("weekList", weekList);
        //input:campus(String),
        //      lecture(String)                        Ex: Thay A
        //output:7 dayOfWeeks (of this week, now)      Ex: 10/1/2022 to 16/1/2022 (for week 2)
        //       numberOfWeek(int) (of this week, now) Ex: 2
        //       lessons (arrayList)   all lesson of this week(now) for that input 
        //       statusList (ArrayList<String>) (dua vao lessons ben tren)
        String campus = request.getParameter("campus");
        String lecture = request.getParameter("lecture");
        //return output numberOfWeek(int) (of this week, now)
        LocalDate start = LocalDate.now();
        LocalDate end = LocalDate.parse("2022-01-02");
        int numberOfWeekNow = (int) Math.ceil((double) DAYS.between(end, start) / 7);
        request.setAttribute("numberOfWeek", numberOfWeekNow);
        //return output 7 dayOfWeeks (of this week, now):
        request.setAttribute("dayOfWeeks", wDBC.getDaysOfWeek(numberOfWeekNow));
        //return output lessons
        LessonDBContext lDBC = new LessonDBContext();
        ArrayList<Lesson> lessons = lDBC.listAllLessonInThisWeekAndLecture(numberOfWeekNow, lecture);
        request.setAttribute("lessons", lessons);
        //return output statusList
        ArrayList<String> statusList = new ArrayList<>();
        StudentLessonDBContext slDBC = new StudentLessonDBContext();
        for(Lesson a: lessons){
            int status = slDBC.getStatus(a);
            if(status ==0){continue;}
            if(status >0){statusList.add(a.getId()+"_"+slDBC.getStatus(a));}
        }
        request.setAttribute("statuses", statusList);
        request.getRequestDispatcher("view/Timetable3.jsp").forward(request, response);
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
