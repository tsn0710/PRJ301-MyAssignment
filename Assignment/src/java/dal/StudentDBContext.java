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
import model.Student;

/**
 *
 * @author Tong Nhat
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public ArrayList<Student> list() {
//        try {
//            ArrayList<Lesson> ds = new ArrayList<>();
//            PreparedStatement sql = connection.prepareStatement("select * from [all]");
//            ResultSet rs = sql.executeQuery();
//            while(rs.next()){
//                Lesson a = new Lesson();
//                a.setId(rs.getInt("id"));
//                a.setSlot(rs.getInt("slot"));
//                a.setDate(rs.getDate("date"));
//                a.setGroup(rs.getString("group"));
//                a.setCourse(rs.getString("course"));
//                a.setInstructor(rs.getString("instructor"));
//                a.setRoom(rs.getString("room"));
//                ds.add(a);
//            }
//            return ds;
//        } catch (SQLException ex) {
//            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return null;
    }

    //@Override
//    public ArrayList<Student> list(int did) {
//        int slot = did;
//        try {
//            ArrayList<Student> ds = new ArrayList<>();
//            PreparedStatement sql = connection.prepareStatement("select *\n" +"from [all] where slot = ?");
//            sql.setInt(1, slot);
//            ResultSet rs = sql.executeQuery();
//            while(rs.next()){
//                Student a = new Student();
//                a.setSlot(slot);
//                a.setId(rs.getInt("id"));
//                a.setDate(rs.getDate("date"));
//                a.setGroup(rs.getString("group"));
//                a.setCourse(rs.getString("course"));
//                a.setInstructor(rs.getString("instructor"));
//                a.setRoom(rs.getString("room"));
//                ds.add(a);
//            }
//            return ds;
//        } catch (SQLException ex) {
//            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
 //       return null;
  //  }
@Override
    public ArrayList<Student> list(int lessonID) {
        try {
            ArrayList<Student> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("select*\n"
                    + "from Student s\n"
                    + "where s.[group] = (\n"
                    + "select a.[group]\n"
                    + "from [all] a\n"
                    + "where a.id =?)");
            sql.setInt(1, lessonID);
            ResultSet rs = sql.executeQuery();
            while (rs.next()) {
                Student a = new Student();
                a.setId(rs.getString("id"));
                a.setGroup(rs.getString("group"));
                a.setName(rs.getString("name"));
                ds.add(a);
            }
            System.out.println("----------------"+ds.size());
            return ds;
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
