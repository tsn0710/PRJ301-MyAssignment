/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lesson;
import model.Student;
import model.StudentLesson;

/**
 *
 * @author Tong Nhat
 */
public class StudentLessonDBContext extends DBContext<StudentLesson> {

    @Override
    public ArrayList<StudentLesson> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<StudentLesson> list(int lessonID) {
        try {
            ArrayList<StudentLesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("select sl.*,s.name as studentName from StudentLesson sl,Student s\n"
                    + "where s.id = sl.StudentID and sl.LessonID =?");
            sql.setInt(1, lessonID);
            ResultSet rs = sql.executeQuery();
            while (rs.next()) {
                StudentLesson a = new StudentLesson(
                        new Student(rs.getString("StudentID"), rs.getString("studentName")),
                        null, //lesson
                        rs.getBoolean("status"),
                        rs.getString("recordTime"),
                        rs.getString("note")
                );
                ds.add(a);
            }
            return ds;
        } catch (SQLException ex) {
            Logger.getLogger(StudentLessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public StudentLesson get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(StudentLesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(StudentLesson model) {
        try {
            ArrayList<StudentLesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("UPDATE StudentLesson\n"
                    + "SET StudentLesson.status = ?, StudentLesson.note = ?, StudentLesson.recordTime = ?\n"
                    + "WHERE StudentLesson.LessonID= ? and StudentLesson.StudentID = ?");
            sql.setBoolean(1, model.isStatus());
            sql.setString(2, model.getNote());
            sql.setString(3, model.getRecordTime());
            sql.setString(4, Integer.toString(model.getLesson().getId()));
            sql.setString(5, model.getStudent().getId());
            sql.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentLessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public boolean add(StudentLesson model) {
        try {
            ArrayList<StudentLesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("INSERT INTO StudentLesson (StudentLesson.LessonID, StudentLesson.StudentID, StudentLesson.status, StudentLesson.note, StudentLesson.recordTime)\n"
                    + "VALUES (?, ?, ?, ?,?)");
            sql.setString(1, Integer.toString(model.getLesson().getId()));
            sql.setString(2, model.getStudent().getId());
            sql.setBoolean(3, model.isStatus());
            sql.setString(4, model.getNote());
            sql.setString(5, model.getRecordTime());
            sql.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentLessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    @Override
    public boolean delete(StudentLesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int isExistInTableStudentLesson(String lessonID, String studentID) {
        try {
            ArrayList<StudentLesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("execute isExistInTableStudentLesson ?,?");
            sql.setString(1, lessonID);
            sql.setString(2, studentID);
            ResultSet rs = sql.executeQuery();
            if (rs.next()) {
                return rs.getInt("dem");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentLessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getStatus(Lesson thisLessonID) {
         try {
            ArrayList<StudentLesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("execute getStatus ?");
            sql.setString(1, Integer.toString(thisLessonID.getId()));
            ResultSet rs = sql.executeQuery();
            if (rs.next()) {
                return rs.getInt("dem");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentLessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
