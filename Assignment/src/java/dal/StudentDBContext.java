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
public class StudentDBContext extends DBContext<Student>{

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list(int lessonID) {
        try {
            ArrayList<Student> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("select Student.*\n"
                    + "	from Student join GroupStudent on Student.id=GroupStudent.id\n"
                    + "	where GroupStudent.[group] in (select [Group].[group] \n"
                    + "	from [Group] join Lesson on [Group].[group]= Lesson.[group]\n"
                    + "	where Lesson.id = ?)");
            sql.setInt(1, lessonID);
            ResultSet rs = sql.executeQuery();
            while (rs.next()) {
                Student a = new Student();
                a.setId(rs.getString("id"));
                a.setName(rs.getString("name"));
                ds.add(a);
            }
            System.out.println("----------------" + ds.size());
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
