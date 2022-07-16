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
import model.Instructor;

/**
 *
 * @author Tong Nhat
 */
public class InstructorDBContext extends DBContext<Instructor>{
    public String getInstructorID(String lessonID){
        try {
            PreparedStatement sql = connection.prepareStatement("select [Group].InstructorID from [Lesson] JOIN [Group] on [Group].[group] = [Lesson].[group] where [Lesson].id=?");
            sql.setString(1, lessonID);
            ResultSet rs = sql.executeQuery();
            if (rs.next()) {
                return rs.getString("InstructorID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
//    public String getInstructorIDByName(String lectureName){
//        try {
//            PreparedStatement sql = connection.prepareStatement("select * from [Instructor] where [Instructor].name like ?");
//            sql.setString(1, "%"+lectureName+"%");
//            ResultSet rs = sql.executeQuery();
//            while (rs.next()) {
//                return rs.getString("InstructorID");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return "";
//    }
    
    @Override
    public ArrayList<Instructor> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Instructor> list(int did) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Instructor get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Instructor model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
