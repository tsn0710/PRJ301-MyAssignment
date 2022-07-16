/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;


import dal.InstructorDBContext;
import dal.StudentDBContext;
import dal.StudentLessonDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Account;
import model.Lesson;
import model.Student;
import model.StudentLesson;
import utility.Utility;

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
        HttpSession aSession = request.getSession();
        Account acc=(Account)aSession.getAttribute("acc");
        if(acc==null){
            response.getWriter().print("access denied");
            return;
        }
//        response.getWriter().print(request.getParameter("id")+"\n"
//                +request.getParameter("group")+"\n"
//                + request.getParameter("course")+"\n"
//                + request.getParameter("instructor")+"\n"
//                + request.getParameter("slot")+"\n"
//                + request.getParameter("room")+"\n"
//                + request.getParameter("date"));
        int idOfLesson = Integer.parseInt(request.getParameter("LessonID"));
//just need idOfLesson to get list of Student in this Lesson so im comment all below
//        String group = request.getParameter("group");
//        String course = request.getParameter("course");
//        String instructor = request.getParameter("instructor");
//        int slot = Integer.parseInt(request.getParameter("slot"));
//        String room = request.getParameter("room");
//        Date date = Date.valueOf(request.getParameter("date"));
 //           response.getWriter().print(idOfLesson);
        //tra ve InstructorID nua de disable input neu user khac instructor
        InstructorDBContext iDBC = new InstructorDBContext();
        request.setAttribute("InstructorID", iDBC.getInstructorID(Integer.toString(idOfLesson)));
        //
        StudentDBContext sdbc = new StudentDBContext();
        ArrayList<Student> studentList = sdbc.list(idOfLesson);
        request.setAttribute("studentList", studentList);
        
        StudentLessonDBContext slDBC = new StudentLessonDBContext();
        ArrayList<StudentLesson> studentLessonList = slDBC.list(idOfLesson);
        request.setAttribute("studentLessonList", studentLessonList);
        for(StudentLesson a: studentLessonList){
            System.out.println(a.isStatus());
        }
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
        HttpSession aSession = request.getSession();
        Account acc=(Account)aSession.getAttribute("acc");
        if(acc==null){
            response.getWriter().print("access denied");
            return;
        }
        //lay instructorID tu DB
        //khong nen lay o url vi nguoi dung co the thay doi de hack:
        //thay doi instructorID de co quyen cham diem danh
        InstructorDBContext iDBC = new InstructorDBContext();
        if(acc.getInstructor().getId().equals(iDBC.getInstructorID(request.getParameter("lessonID")))){
            //continue request.getParameter("lessonID")   iDBC.getInstructorID(request.getParameter("lessonID"))
        }else{
            response.getWriter().print("You can not take attendance of this Lesson because you are not Instructor of this Lesson ");
            return;
        }
        
        
        Lesson thisLesson = new Lesson();
        thisLesson.setDate(Date.valueOf(request.getParameter("lessonDate")));
        thisLesson.setSlot(Integer.parseInt(request.getParameter("lessonSlot")));
        int idOfLesson = Integer.parseInt(request.getParameter("lessonID"));
        thisLesson.setId(idOfLesson);
        if(false == Utility.isAllowToTakeAttendance(thisLesson)){
            return;
        }
        StudentDBContext sdbc = new StudentDBContext();
        ArrayList<Student> studentList = sdbc.list(idOfLesson);
        ArrayList<StudentLesson> studentLessonList = new ArrayList<>();
        for(Student thisStudent: studentList){
            String x=request.getParameter("status_"+thisStudent.getId());
            if(x==null){
                //student nay vang mat
                StudentLesson youDone = new StudentLesson(thisStudent, new Lesson(idOfLesson), false, LocalDateTime.now().toString(), request.getParameter("note_"+thisStudent.getId()) );
                studentLessonList.add(youDone);
            }else{
                //student nay di hoc
                StudentLesson oke = new StudentLesson(thisStudent, new Lesson(idOfLesson), true, LocalDateTime.now().toString(), request.getParameter("note_"+thisStudent.getId()) );
                studentLessonList.add(oke);
            }
        }
        StudentLessonDBContext slDBC = new StudentLessonDBContext();
        //quyet dinh nen update hay add
        for(StudentLesson a: studentLessonList){
            if(1==slDBC.isExistInTableStudentLesson(Integer.toString(idOfLesson), a.getStudent().getId())){
                slDBC.update(a);
            }else{
                slDBC.add(a);
            }
        }
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
